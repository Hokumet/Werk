unit EditEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, MPlayer, ExtCtrls, ComCtrls, AppEvnts, Buttons,
  ADODB, HolderEdits;

type
  TfrmEditEmployee = class(TForm)
    lblName: TLabel;
    lblAddress: TLabel;
    lblPostalcode: TLabel;
    lblPhoneNumber: TLabel;
    lblNotes: TLabel;
    edtName: TEdit;
    edtAddress: TEdit;
    edtMNotes: TMemo;
    edtPlace: TEdit;
    edtPostalCode: TEdit;
    edtPhoneNumber: TEdit;
    Panel3: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtSofinr: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ckbDeleted: TCheckBox;
    Label3: TLabel;
    cmbFunctie: TComboBox;
    edtSalaris: THCurrencyEdit;
    Label4: TLabel;
    edtGeboortedatum: TDateTimePicker;
    procedure btnOkClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    TFuncties: TADOTable;
    procedure SaveValues;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmEditEmployee: TfrmEditEmployee;

implementation

uses Main, DB;

{$R *.dfm}

{ TfrmEditEmployee }

constructor TfrmEditEmployee.Create(Owner: TComponent; ID: Integer);
var Index, I: Integer;
begin
  inherited Create(Owner);
  frmMain := TfrmMain(Owner);
  frmMain.DBTEmployees.Locate('ID', ID, []);

  edtName.Text := frmMain.DBTEmployeesVoornaam.AsString ;
  edtAddress.Text := frmMain.DBTEmployeesAdres.AsString;
  edtPostalCode.Text := frmMain.DBTEmployeesPostcode.AsString;
  edtPlace.Text := frmMain.DBTEmployeesPlaats.AsString;
  edtPhoneNumber.Text := frmMain.DBTEmployeesTelefoonWerk.AsString;
  edtMNotes.Text := frmMain.DBTEmployeesNotities.AsString;
  edtSofinr.Text := frmMain.DBTEmployeesSofinummer.AsString;
  edtSalaris.Value := frmMain.DBTEmployeesUurLoon.AsCurrency;
  edtGeboortedatum.DateTime := frmMain.DBTEmployeesGeboortedatum.AsDateTime;

  if frmMain.DBTEmployeesVerwijderd.AsBoolean then
    ckbDeleted.Visible := True;

  TFuncties := TfrmMain.GetTableFuncties;

  TFuncties.First;
  for I := 0 to TFuncties.RecordCount -1 do begin
    Index := cmbFunctie.Items.AddObject(TFuncties.FieldByName('Functie').AsString, Pointer(TFuncties.FieldByName('Id').AsInteger));
    if frmMain.DBTEmployeesFunctieId.AsInteger = TFuncties.FieldByName('Id').AsInteger then
      cmbFunctie.ItemIndex := Index;
    TFuncties.Next;
  end;

end;

procedure TfrmEditEmployee.SaveValues;
begin
  frmMain.DBTEmployees.Edit;
  frmMain.DBTEmployeesVoornaam.AsString := edtName.Text;
  frmMain.DBTEmployeesAdres.AsString := edtAddress.Text;
  frmMain.DBTEmployeesPostcode.AsString := edtPostalCode.Text;
  frmMain.DBTEmployeesPlaats.AsString := edtPlace.Text;
  frmMain.DBTEmployeesTelefoonWerk.AsString := edtPhoneNumber.Text;
  frmMain.DBTEmployeesNotities.AsString := edtMNotes.Text;
  frmMain.DBTEmployeesSofinummer.AsString := edtSofinr.Text;
  frmMain.DBTEmployeesUurLoon.AsCurrency := edtSalaris.Value;
  frmMain.DBTEmployeesGeboortedatum.AsDateTime := edtGeboortedatum.DateTime;
  if frmMain.DBTEmployeesVerwijderd.AsBoolean then
    frmMain.DBTEmployeesVerwijderd.AsBoolean := not ckbDeleted.Checked;
  frmMain.DBTEmployeesFunctieId.AsInteger := Integer(cmbFunctie.Items.Objects[cmbFunctie.ItemIndex]);
  frmMain.DBTEmployees.Post;
end;

procedure TfrmEditEmployee.btnOkClick(Sender: TObject);
begin
  SaveValues;
end;              

procedure TfrmEditEmployee.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

end.
