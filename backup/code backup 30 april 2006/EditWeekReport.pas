unit EditWeekReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin,  Buttons, ExtCtrls, ADODB,
  HolderEdits;

type
  TfrmEditWeekReport = class(TForm)
    Label2: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Panel1: TPanel;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Panel2: TPanel;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    btnEdit: TBitBtn;
    Label4: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    lvwItems: TListView;
    Label3: TLabel;
    edtTotal: THFloatEdit;
    edtProje: TEdit;
    dtpEnd: TDateTimePicker;
    dtpBegin: TDateTimePicker;
    edtWeeknr: TEdit;
    procedure dtpBeginChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private         
    ID: Integer;
    TWeekReport, TWeekDetail, TEmployee, TCustomer: TADOTable;
    Total, TotalS: Double;
    procedure LoadWeekDetails;
    procedure SaveValues;
    procedure Recalculate;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmEditWeekReport: TfrmEditWeekReport;

implementation

uses Main, DateUtils, DB, EditWeekDetail, ReportWeek;

{$R *.dfm}

{ TfrmEditWeekReport }

constructor TfrmEditWeekReport.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  Self.ID := ID;

  TWeekReport := TfrmMain.GetTableWeekReport;
  TWeekDetail := TfrmMain.GetTableWeekDetail;
  TEmployee := TfrmMain.GetTableEmployee;
  TCustomer := TfrmMain.GetTableCustomer;

  TWeekReport.Locate('ID', ID, []);

  edtWeeknr.Text := TWeekReport.FieldByName('Weeknr').AsString;
  edtProje.Text := TWeekReport.FieldByName('Proje').AsString;
  dtpBegin.DateTime := TWeekReport.FieldByName('Weekbegin').AsDateTime;
  dtpEnd.DateTime := TWeekReport.FieldByName('WeekEind').AsDateTime;
  if edtWeeknr.Text = '' then
    edtWeeknr.Text := IntToStr(WeekOftheYear(Now));

  edtTotal.Value := TWeekReport.FieldByName('Totaaluren').AsFloat;

  btnEdit.Enabled := False;
  btnDelete.Enabled := False;

  LoadWeekDetails;
end;

procedure TfrmEditWeekReport.SaveValues;
begin
  TWeekReport.Edit;
  TWeekReport.FieldByName('Weeknr').AsString := edtWeeknr.Text;
  TWeekReport.FieldByName('Weekbegin').AsDateTime := dtpBegin.DateTime;
  TWeekReport.FieldByName('WeekEind').AsDateTime := dtpEnd.DateTime;
  TWeekReport.FieldByName('Totaaluren').AsFloat := edtTotal.Value;
  TWeekReport.FieldByName('Proje').AsString := edtProje.Text;
  TWeekReport.FieldByName('TotaalSalaris').AsFloat := TotalS;
  TWeekReport.Post;
end;

procedure TfrmEditWeekReport.LoadWeekDetails;
var I: Integer;
    Item: TListItem;
begin
  TWeekDetail.Refresh;
  TWeekDetail.Filtered := True;
  TWeekDetail.Filter := 'WeekRapportId =' + IntToStr(ID);

  lvwItems.Clear;
  Total := 0;
  TotalS := 0;

  TWeekDetail.First;
  for I := 0 to TWeekDetail.RecordCount -1 do begin
    Total := Total + TWeekDetail.FieldByName('UurTotaal').AsFloat;
    TotalS := TotalS + TWeekDetail.FieldByName('SalarisTotaal').AsFloat;
    Item := lvwItems.Items.Add;
    TEmployee.Locate('ID', TWeekDetail.FieldByName('WerknemerId').AsInteger, []);
    Item.Caption :=  TEmployee.FieldByName('Voornaam').AsString + ' ' + TEmployee.FieldByName('Achternaam').AsString;
    TCustomer.Locate('ID', TWeekDetail.FieldByName('KlantID').AsInteger, []);
    Item.SubItems.Add(TCustomer.FieldByName('Naam').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Maandag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Dinsdag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Woensdag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Donderdag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Vrijdag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Zaterdag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('Zondag').AsString);
    Item.SubItems.Add(TWeekDetail.FieldByName('UurTotaal').AsString);

    Item.Data := Pointer(TWeekDetail.FieldByName('ID').AsInteger);

    TWeekDetail.Next;
  end;
end;

procedure TfrmEditWeekReport.Recalculate;
begin
  edtTotal.Value := Total;      
end;

procedure TfrmEditWeekReport.btnPrintClick(Sender: TObject);
begin
  SaveValues;
  frmReportWeek := TfrmReportWeek.Create(Self, ID);
  try
    frmReportWeek.ShowModal;
  finally
    frmReportWeek.Free;
  end;
end;

procedure TfrmEditWeekReport.dtpBeginChange(Sender: TObject);
begin
  edtWeeknr.Text := IntToStr(WeekOftheYear(dtpBegin.DateTime));
  dtpEnd.DateTime := IncDay(dtpBegin.DateTime, 7);
end;

procedure TfrmEditWeekReport.btnOkClick(Sender: TObject);
begin
  SaveValues;
end;

procedure TfrmEditWeekReport.btnAddClick(Sender: TObject);
begin
  TWeekDetail.Insert;
  TWeekDetail.FieldByName('WeekrapportId').AsInteger := ID;
  TWeekDetail.Post;
  TWeekDetail.Refresh;
  frmWeekDetail := TfrmWeekDetail.Create(Self, TWeekDetail.FieldByName('Id').AsInteger);
  try
    if frmWeekDetail.ShowModal = mrOk then begin
      LoadWeekDetails;
      ReCalculate;
    end
    else
      TWeekDetail.Delete;
  finally
    frmWeekDetail.Free;
  end;
end;

procedure TfrmEditWeekReport.btnEditClick(Sender: TObject);
begin
  if lvwItems.Selected = nil then Exit;
  frmWeekDetail := TfrmWeekDetail.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmWeekDetail.ShowModal = mrOk then begin
      LoadWeekDetails;
      Recalculate;
    end;
  finally
    frmWeekDetail.Free;
  end;
end;

procedure TfrmEditWeekReport.btnDeleteClick(Sender: TObject);
begin
  if TWeekDetail.Locate('ID', Integer(lvwItems.Selected.Data), []) then begin
    TWeekDetail.Delete;
    LoadWeekDetails;
    Recalculate;
  end;
end;

procedure TfrmEditWeekReport.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmEditWeekReport.lvwItemsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin   
   btnEdit.Enabled := Selected;
   btnDelete.Enabled := Selected;
end;

end.
