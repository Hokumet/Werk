unit EditWeekDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, Buttons, ExtCtrls, HolderEdits;

type
  TfrmWeekDetail = class(TForm)
    lblName: TLabel;
    lblAddress: TLabel;
    lblPostalcode: TLabel;
    lblPhoneNumber: TLabel;
    lblNotes: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtMonday: THFloatEdit;
    edtTeusday: THFloatEdit;
    edtThursday: THFloatEdit;
    edtFriday: THFloatEdit;
    edtSunday: THFloatEdit;
    edtWednesday: THFloatEdit;
    edtSaturday: THFloatEdit;
    edtTotal: THFloatEdit;
    edtSofinr: TEdit;
    cmbCustomer: TComboBox;
    cmbEmployees: TComboBox;
    procedure edtMondayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMondayEnter(Sender: TObject);
    procedure edtMondayClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnOkClick(Sender: TObject);
    procedure cmbEmployeesSelect(Sender: TObject);
  private
    ID: Integer;
    TWeekDetail, TEmployees, TCustomer: TADOTable;
    procedure SaveValues;
    procedure RecaulCulate;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmWeekDetail: TfrmWeekDetail;

implementation

uses Main, DB;
{$R *.dfm}

{ TfrmWeekDetail }

constructor TfrmWeekDetail.Create(Owner: TComponent; ID: Integer);
var I, Index: Integer;
begin
  inherited Create(Owner);
  Self.ID := ID;
  TWeekDetail := TfrmMain.GetTableWeekDetail;
  TWeekDetail.Locate('ID', ID, []);

  edtMonday.Value := TWeekDetail.FieldByName('Maandag').AsFloat;
  edtTeusday.Value := TWeekDetail.FieldByName('Dinsdag').AsFloat;
  edtWednesday.Value := TWeekDetail.FieldByName('Woensdag').AsFloat;
  edtThursday.Value := TWeekDetail.FieldByName('Donderdag').AsFloat;
  edtFriday.Value := TWeekDetail.FieldByName('Vrijdag').AsFloat;
  edtSaturday.Value := TWeekDetail.FieldByName('Zaterdag').AsFloat;
  edtSunday.Value := TWeekDetail.FieldByName('Zondag').AsFloat;
  edtTotal.Value := TWeekDetail.FieldByName('UurTotaal').AsFloat;

  TEmployees := TfrmMain.GetTableEmployee;

  TEmployees.First;
  for I := 0 to TEmployees.RecordCount -1 do begin
    Index := cmbEmployees.Items.AddObject(TEmployees.FieldByName('Voornaam').AsString + ' ' + TEmployees.FieldByName('Achternaam').AsString, Pointer(TEmployees.FieldByName('Id').AsInteger));
    if TWeekDetail.FieldByName('WerknemerId').AsInteger = TEmployees.FieldByName('Id').AsInteger then begin
      cmbEmployees.ItemIndex := Index;
      cmbEmployees.Enabled := not TEmployees.FieldByName('Verwijderd').AsBoolean;
      edtSofinr.Text := TEmployees.FieldByName('Sofinummer').AsString;
    end;
    if TEmployees.FieldByName('Verwijderd').AsBoolean then
      cmbEmployees.Items.Delete(Index);
    TEmployees.Next;
  end;
  if cmbEmployees.ItemIndex = -1 then  cmbEmployees.ItemIndex := 0;

  TCustomer := TfrmMain.GetTableCustomer;
  TCustomer.First;
  for I := 0 to TCustomer.RecordCount -1 do begin
    Index := cmbCustomer.Items.AddObject(TCustomer.FieldByName('Naam').AsString,   Pointer(TCustomer.FieldByName('Id').AsInteger));
    if TWeekDetail.FieldByName('Klantid').AsInteger = TCustomer.FieldByName('Id').AsInteger then begin
      cmbCustomer.ItemIndex := Index;
      cmbCustomer.Enabled := not TCustomer.FieldByName('Verwijderd').AsBoolean;
    end;       
    if TCustomer.FieldByName('Verwijderd').AsBoolean then
      cmbCustomer.Items.Delete(Index);
    TCustomer.Next;
  end;

  if cmbCustomer.ItemIndex = -1 then  cmbCustomer.ItemIndex := 0;
end;

procedure TfrmWeekDetail.SaveValues;
begin
  TWeekDetail.Edit;
  TEmployees.Locate('ID', Integer(cmbEmployees.Items.Objects[cmbEmployees.ItemIndex]), []);
  TWeekDetail.FieldByName('Maandag').AsFloat := edtMonday.Value;
  TWeekDetail.FieldByName('Dinsdag').AsFloat := edtTeusday.Value;
  TWeekDetail.FieldByName('Woensdag').AsFloat := edtWednesday.Value;
  TWeekDetail.FieldByName('Donderdag').AsFloat := edtThursday.Value;
  TWeekDetail.FieldByName('Vrijdag').AsFloat := edtFriday.Value;
  TWeekDetail.FieldByName('Zaterdag').AsFloat := edtSaturday.Value;
  TWeekDetail.FieldByName('Zondag').AsFloat:= edtSunday.Value;
  TWeekDetail.FieldByName('UurTotaal').AsFloat := edtTotal.Value;
  TWeekDetail.FieldByName('SalarisTotaal').AsFloat := (edtTotal.Value * TEmployees.FieldByName('UurLoon').AsCurrency);
  TWeekDetail.FieldByName('WerknemerId').AsInteger := Integer(cmbEmployees.Items.Objects[cmbEmployees.ItemIndex]);
  TWeekDetail.FieldByName('KlantID').AsInteger := Integer(cmbCustomer.Items.Objects[cmbCustomer.ItemIndex]);
  TWeekDetail.Post;
end;

procedure TfrmWeekDetail.RecaulCulate;
begin
  edtTotal.Value :=  edtMonday.Value + edtTeusday.Value + edtThursday.Value + edtWednesday.Value + edtFriday.Value + edtSaturday.Value+ edtSunday.Value;
end;

procedure TfrmWeekDetail.edtMondayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  RecaulCulate;
end;

procedure TfrmWeekDetail.edtMondayEnter(Sender: TObject);
begin
  RecaulCulate;
end;

procedure TfrmWeekDetail.edtMondayClick(Sender: TObject);
begin
  RecaulCulate;
end;

procedure TfrmWeekDetail.btnOkClick(Sender: TObject);
begin
  SaveValues;
end;           

procedure TfrmWeekDetail.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmWeekDetail.cmbEmployeesSelect(Sender: TObject);
begin
  TEmployees.Locate('ID', Integer(cmbEmployees.Items.Objects[cmbEmployees.ItemIndex]), []);
  edtSofinr.Text := TEmployees.FieldByName('Sofinummer').AsString;
end;

end.
