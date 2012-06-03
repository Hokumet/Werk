unit EditInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, Buttons, ExtCtrls, StdCtrls, ComCtrls, Spin, HolderEdits;

type
  TfrmEditInvoice = class(TForm)
    lblInvoiceNr: TLabel;
    lblDate: TLabel;
    lblCustomer: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lvwItems: TListView;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    btnEdit: TBitBtn;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    edtSubTotal: THCurrencyEdit;
    edtBtwTotal: THCurrencyEdit;
    edtTotal: THCurrencyEdit;
    edtGrekAmount: THCurrencyEdit;
    edtZrekAmount: THCurrencyEdit;
    lbluren: TLabel;
    edtInvoiceNumber: TEdit;
    dtpInvoiceDate: TDateTimePicker;
    cmbWeeknr: TComboBox;
    cmbCustomers: TComboBox;
    rbtBtw: TRadioGroup;
    edtGrekPerc: TSpinEdit;
    edtZrekPerc: TSpinEdit;
    ckbPayed: TCheckBox;
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure lvwItemsDblClick(Sender: TObject);
    procedure cmbWeeknrSelect(Sender: TObject);
    procedure cmbCustomersSelect(Sender: TObject);
    procedure rbtBtwClick(Sender: TObject);
    procedure edtZrekPercChange(Sender: TObject);
    procedure edtGrekPercChange(Sender: TObject);
    procedure edtZrekPercDblClick(Sender: TObject);
    procedure edtGrekPercDblClick(Sender: TObject);
    procedure edtSubTotalExit(Sender: TObject);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    ID: Integer;
    TInvoice, TInvoiceDetail, TWeekReport: TADOTable;
    TQuery: TADOQuery;
    SubTotal, Totaaluren, TotaalgebUren: Double;
    procedure SaveValues;
    procedure LoadInvoiceDetails;
    procedure ReCalculate;
    procedure ReCalculateGrek;
    procedure ReCalculateZrek;
    procedure FindCustomers(Weeknr: Integer);
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmEditInvoice: TfrmEditInvoice;

implementation

uses Main, ReportInvoice, EditInvoiceDetail, DB, DateUtils, ReportWeek;

{$R *.dfm}

{ TfrmEditInvoice }

constructor TfrmEditInvoice.Create(Owner: TComponent; ID: Integer);
var I, Index: Integer;
begin
  inherited Create(Owner);
  Totaaluren := 0;
  Self.ID := ID;

  TInvoice := TfrmMain.GetTableInvoice;
  TInvoiceDetail := TfrmMain.GetTableInvoiceDetail;
  TWeekReport := TfrmMain.GetTableWeekReport;
  TQuery := TfrmMain.GetTableQuery;

  TInvoice.Locate('ID', ID, []);

  edtInvoiceNumber.Text := TInvoice.FieldByName('Factuurnr').AsString;
  dtpInvoiceDate.DateTime := TInvoice.FieldByName('Factuurdatum').AsDateTime;

  SubTotal := TInvoice.FieldByName('Subtotaal').AsCurrency;
  edtSubTotal.Value := TInvoice.FieldByName('Subtotaal').AsCurrency;
  edtBtwTotal.Value := TInvoice.FieldByName('BtwTotaal').AsCurrency;
  edtGrekPerc.Value := TInvoice.FieldByName('GRekPercentage').AsInteger;
  edtZrekPerc.Value := TInvoice.FieldByName('ZrekPercentage').AsInteger;
  edtGrekAmount.Value := TInvoice.FieldByName('GrekTotaal').AsCurrency;
  edtZrekAmount.Value := TInvoice.FieldByName('ZrekTotaal').AsCurrency;
  edtTotal.Value := TInvoice.FieldByName('Tebetalen').AsCurrency;
  rbtBtw.ItemIndex := 0;
  if not TInvoice.FieldByName('Btw').AsBoolean then
    rbtBtw.ItemIndex := 1;

  ckbPayed.Checked := TInvoice.FieldByName('Betaald').AsBoolean;

  
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;

  TWeekReport.First;
  for I := 0 to TWeekReport.RecordCount -1 do begin
    Index := cmbWeeknr.Items.AddObject(TWeekReport.FieldByName('Weeknr').AsString, Pointer(TWeekReport.FieldByName('Id').AsInteger));
    if TInvoice.FieldByName('WeekID').AsInteger = TWeekReport.FieldByName('Id').AsInteger then begin
      cmbWeeknr.ItemIndex := Index;
      FindCustomers(TWeekReport.FieldByName('Weeknr').AsInteger);
    end;
    TWeekReport.Next;
  end;
  TInvoiceDetail.Filter := 'FactuurID =' + IntToStr(ID);

  LoadInvoiceDetails;
end;

procedure TfrmEditInvoice.SaveValues;
begin
  TInvoice.Edit;
  TInvoice.FieldByName('Factuurnr').AsString := edtInvoiceNumber.Text;
  TInvoice.FieldByName('Factuurdatum').AsDateTime := dtpInvoiceDate.DateTime;
  TInvoice.FieldByName('KlantId').AsInteger := Integer(cmbCustomers.Items.Objects[cmbCustomers.ItemIndex]);
  TInvoice.FieldByName('WeekID').AsInteger := Integer(cmbWeeknr.Items.Objects[cmbWeeknr.ItemIndex]);
  TInvoice.FieldByName('Subtotaal').AsCurrency := edtSubTotal.Value;
  TInvoice.FieldByName('BtwTotaal').AsCurrency := edtBtwTotal.Value;
  TInvoice.FieldByName('GrekTotaal').AsCurrency := edtGrekAmount.Value;
  TInvoice.FieldByName('ZrekTotaal').AsCurrency := edtZrekAmount.Value;
  TInvoice.FieldByName('GRekPercentage').AsInteger := edtGrekPerc.Value;
  TInvoice.FieldByName('ZrekPercentage').AsInteger := edtZrekPerc.Value;
  TInvoice.FieldByName('Tebetalen').AsCurrency := edtTotal.Value;
  TInvoice.FieldByName('Btw').AsBoolean := rbtBtw.ItemIndex = 0;
  TInvoice.FieldByName('Betaald').AsBoolean := ckbPayed.Checked;
  TInvoice.Post;
end;

procedure TfrmEditInvoice.LoadInvoiceDetails;
var I: Integer;
    Item: TListItem;
begin
  TInvoice.Refresh;
  TInvoiceDetail.Filtered := True;
  TInvoiceDetail.Filter := 'FactuurID =' + IntToStr(ID);

  lvwItems.Clear;
  SubTotal := 0;
  TotaalgebUren := 0;

  TInvoiceDetail.First;
  for I := 0 to TInvoiceDetail.RecordCount -1 do begin
    Item := lvwItems.Items.Add;
    Item.Caption := TInvoiceDetail.FieldByName('Omschrijving').AsString;
    Item.SubItems.Add(TInvoiceDetail.FieldByName('Uren').AsString);
    Item.SubItems.Add('€ ' + TInvoiceDetail.FieldByName('Uurprijs').AsString);
    Item.SubItems.Add('€ ' + TInvoiceDetail.FieldByName('Totaalbedrag').AsString);
    Item.Data := Pointer(TInvoiceDetail.FieldByName('Id').AsInteger);
    SubTotal := SubTotal +  TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency;
    if not TInvoiceDetail.FieldByName('Eenmalig').AsBoolean then
      TotaalgebUren := TotaalgebUren +  TInvoiceDetail.FieldByName('Uren').AsCurrency;
    TInvoiceDetail.Next;
  end;
  lbluren.Caption := FloatToStr(Totaaluren - TotaalgebUren) + ' nog te factureren uren';
end;

procedure TfrmEditInvoice.ReCalculate;
begin
  edtSubTotal.Value := SubTotal;

  if rbtBtw.ItemIndex = 0 then
    edtBtwTotal.Value := (edtSubTotal.Value * 0.19);
  if rbtBtw.ItemIndex = 1 then
    edtBtwTotal.Value := 0.00;

  edtTotal.Value := edtBtwTotal.Value + edtSubTotal.Value;
  ReCalculateGrek;
end;

procedure TfrmEditInvoice.ReCalculateGrek;
begin
  edtGrekAmount.Value := (edtGrekPerc.Value * edtTotal.Value) / 100;
  edtZrekPerc.Value := (100 - edtGrekPerc.Value);
  edtZrekAmount.Value := (edtZrekPerc.Value * edtTotal.Value) / 100;
end;

procedure TfrmEditInvoice.ReCalculateZrek;
begin
  edtZrekAmount.Value := (edtZrekPerc.Value * edtTotal.Value) / 100;
  edtGrekPerc.Value := (100 - edtZrekPerc.Value);
  edtGrekAmount.Value := (edtGrekPerc.Value * edtTotal.Value) / 100;
end;

procedure TfrmEditInvoice.btnPrintClick(Sender: TObject);
begin
  SaveValues;
  frmReportInvoice := TfrmReportInvoice.Create(Self, ID);
  try
    frmReportInvoice.ShowModal;
  finally
    frmReportInvoice.Free;
  end;
end;

procedure TfrmEditInvoice.btnOkClick(Sender: TObject);
begin
  SaveValues;
end;

procedure TfrmEditInvoice.btnAddClick(Sender: TObject);
begin

  SaveValues;
  TInvoiceDetail.Insert;
  TInvoiceDetail.FieldByName('FactuurID').AsInteger := ID;
  TInvoiceDetail.Post;
  TInvoiceDetail.Refresh;
  frmInvoiceDetail := TfrmInvoiceDetail.Create(Self, TInvoiceDetail.FieldByName('Id').AsInteger);
  try
    if frmInvoiceDetail.ShowModal = mrOk then begin
      LoadInvoiceDetails;
      ReCalculate;
    end
    else
      TInvoiceDetail.Delete;
  finally
    frmInvoiceDetail.Free;
  end;
end;

procedure TfrmEditInvoice.btnEditClick(Sender: TObject);
begin    
  if lvwItems.Selected = nil then Exit;
  frmInvoiceDetail := TfrmInvoiceDetail.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmInvoiceDetail.ShowModal = mrOk then begin
      LoadInvoiceDetails;
      ReCalculate;
    end;
  finally
    frmInvoiceDetail.Free;
  end;
end;

procedure TfrmEditInvoice.lvwItemsDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfrmEditInvoice.btnDeleteClick(Sender: TObject);
begin
  TInvoiceDetail.Locate('ID', Integer(lvwItems.Selected.Data), []);
  TInvoiceDetail.Delete;
  LoadInvoiceDetails;
  ReCalculate;
end;   

procedure TfrmEditInvoice.edtGrekPercChange(Sender: TObject);
begin
  ReCalculateGrek;
end;

procedure TfrmEditInvoice.edtZrekPercChange(Sender: TObject);
begin
  ReCalculateZrek;
end;

procedure TfrmEditInvoice.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmEditInvoice.FindCustomers(Weeknr: Integer);
var I, Index: Integer;
begin
  TQuery.SQL.Text := 'SELECT Klanten.Id as ID, Klanten.Naam as Naam, Klanten.Verwijderd as Verwijderd, Sum(Klanten.Prijswerk) as Prijswerk, Sum(WeekDetails.UurTotaal) AS UurTotaal '+
  'FROM Weekrapporten INNER JOIN (Klanten INNER JOIN WeekDetails ON Klanten.Id = WeekDetails.KlantID) ON Weekrapporten.Id = WeekDetails.WeekrapportID '+
  'WHERE (((Weekrapporten.Weeknr)='+IntToStr(Weeknr)+'))'+
  'Group by Klanten.Naam,Klanten.Id, Klanten.Verwijderd;';
  TQuery.ExecSQL;
  TQuery.Open;

  TQuery.First;
  for I := 0 to TQuery.RecordCount -1 do begin
    Index := cmbCustomers.Items.AddObject(TQuery.FieldByName('Naam').AsString, Pointer(TQuery.FieldByName('Id').AsInteger));
    if TInvoice.FieldByName('KlantId').AsInteger = TQuery.FieldByName('Id').AsInteger then begin
      cmbCustomers.ItemIndex := Index;
      cmbCustomers.Enabled := not TQuery.FieldByName('Verwijderd').AsBoolean;
      Totaaluren := TQuery.FieldByName('UurTotaal').AsCurrency; 
    end;
    TQuery.Next;
  end;
end;

procedure TfrmEditInvoice.cmbWeeknrSelect(Sender: TObject);
begin
  cmbCustomers.Clear;
  TWeekReport.Locate('ID', Integer(cmbWeeknr.Items.Objects[cmbWeeknr.ItemIndex]),[]);
  FindCustomers(TWeekReport.FieldByname('Weeknr').AsInteger);
end;

procedure TfrmEditInvoice.cmbCustomersSelect(Sender: TObject);
begin
  TQuery.Locate('ID', Integer(cmbCustomers.Items.Objects[cmbCustomers.ItemIndex]), []);
  TWeekReport.Locate('ID', Integer(cmbWeeknr.Items.Objects[cmbWeeknr.ItemIndex]), []);
  Totaaluren := TQuery.FieldByName('UurTotaal').AsCurrency;                    //

//  SubTotal := TQuery.FieldByName('Prijswerk').AsCurrency * TWeekReport.FieldByName('Totaaluren').AsCurrency;
//  ReCalculate;
end;

procedure TfrmEditInvoice.rbtBtwClick(Sender: TObject);
begin
  ReCalculate;
end;

procedure TfrmEditInvoice.edtZrekPercDblClick(Sender: TObject);
begin
  edtZrekPerc.Value := edtZrekPerc.Value + 10;
end;

procedure TfrmEditInvoice.edtGrekPercDblClick(Sender: TObject);
begin
  edtGrekPerc.Value := edtGrekPerc.Value + 10;
end;

procedure TfrmEditInvoice.edtSubTotalExit(Sender: TObject);
begin
  SubTotal := edtSubTotal.Value;
  ReCalculate;
end;

procedure TfrmEditInvoice.lvwItemsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
   btnEdit.Enabled := Selected;
   btnDelete.Enabled := Selected;
end;

end.
