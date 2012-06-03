unit EditWeekDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, Buttons, ExtCtrls, HolderEdits, Spin;

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
    GroupBox1: TGroupBox;
    edtMaanTu: THFloatEdit;
    edtMaanT: TSpinEdit;
    edtDinT: TSpinEdit;
    edtDinTu: THFloatEdit;
    edtWoenT: TSpinEdit;
    edtWoenTu: THFloatEdit;
    edtDonT: TSpinEdit;
    edtDonTu: THFloatEdit;
    edtVrijT: TSpinEdit;
    edtVrijTu: THFloatEdit;
    edtZatT: TSpinEdit;
    edtZatTu: THFloatEdit;
    edtZonT: TSpinEdit;
    edtZonTu: THFloatEdit;
    GroupBox2: TGroupBox;
    edtMaanTu2: THFloatEdit;
    edtMaanT2: TSpinEdit;
    edtDinT2: TSpinEdit;
    edtDinTu2: THFloatEdit;
    edtWoenT2: TSpinEdit;
    edtWoenTu2: THFloatEdit;
    edtDonT2: TSpinEdit;
    edtDonTu2: THFloatEdit;
    edtVrijT2: TSpinEdit;
    edtVrijTu2: THFloatEdit;
    edtZatT2: TSpinEdit;
    edtZatTu2: THFloatEdit;
    edtZonT2: TSpinEdit;
    edtZonTu2: THFloatEdit;
    cmbMaan: TComboBox;
    cmbZon: TComboBox;
    cmbDon: TComboBox;
    cmbDin: TComboBox;
    cmbWoen: TComboBox;
    cmbVrij: TComboBox;
    cmbZat: TComboBox;
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

  edtMaanT.Value := TWeekDetail.FieldByName('MaandagT').AsInteger;
  edtDinT.Value := TWeekDetail.FieldByName('DinsdagT').AsInteger;
  edtWoenT.Value := TWeekDetail.FieldByName('WoensdagT').AsInteger;
  edtDonT.Value := TWeekDetail.FieldByName('DonderdagT').AsInteger;
  edtVrijT.Value := TWeekDetail.FieldByName('VrijdagT').AsInteger;
  edtZatT.Value := TWeekDetail.FieldByName('ZaterdagT').AsInteger;
  edtZatT.Value := TWeekDetail.FieldByName('ZondagT').AsInteger;

  edtMaanTu.Value := TWeekDetail.FieldByName('MaandagTu').AsFloat;
  edtDinTu.Value := TWeekDetail.FieldByName('DinsdagTu').AsFloat;
  edtWoenTu.Value := TWeekDetail.FieldByName('WoensdagTu').AsFloat;
  edtDonTu.Value := TWeekDetail.FieldByName('DonderdagTu').AsFloat;
  edtVrijTu.Value := TWeekDetail.FieldByName('VrijdagTu').AsFloat;
  edtZatTu.Value := TWeekDetail.FieldByName('ZaterdagTu').AsFloat;
  edtZonTu.Value := TWeekDetail.FieldByName('ZondagTu').AsFloat;

  edtMaanT2.Value := TWeekDetail.FieldByName('MaandagT2').AsInteger;
  edtDinT2.Value := TWeekDetail.FieldByName('DinsdagT2').AsInteger;
  edtWoenT.Value := TWeekDetail.FieldByName('WoensdagT2').AsInteger;
  edtDonT2.Value := TWeekDetail.FieldByName('DonderdagT2').AsInteger;
  edtVrijT2.Value := TWeekDetail.FieldByName('VrijdagT2').AsInteger;
  edtZatT2.Value := TWeekDetail.FieldByName('ZaterdagT2').AsInteger;
  edtZatT2.Value := TWeekDetail.FieldByName('ZondagT2').AsInteger;

  edtMaanTu2.Value := TWeekDetail.FieldByName('MaandagTu2').AsFloat;
  edtDinTu2.Value := TWeekDetail.FieldByName('DinsdagTu2').AsFloat;
  edtWoenTu2.Value := TWeekDetail.FieldByName('WoensdagTu2').AsFloat;
  edtDonTu2.Value := TWeekDetail.FieldByName('DonderdagTu2').AsFloat;
  edtVrijTu2.Value := TWeekDetail.FieldByName('VrijdagTu2').AsFloat;
  edtZatTu2.Value := TWeekDetail.FieldByName('ZaterdagTu2').AsFloat;
  edtZonTu2.Value := TWeekDetail.FieldByName('ZondagTu2').AsFloat;

  cmbMaan.ItemIndex := TWeekDetail.FieldByName('MaandagVZ').AsInteger;
  cmbDin.ItemIndex := TWeekDetail.FieldByName('DinsdagVZ').AsInteger;
  cmbWoen.ItemIndex := TWeekDetail.FieldByName('WoensdagVZ').AsInteger;
  cmbDon.ItemIndex := TWeekDetail.FieldByName('DonderdagVZ').AsInteger;
  cmbVrij.ItemIndex := TWeekDetail.FieldByName('VrijdagVZ').AsInteger;
  cmbZat.ItemIndex := TWeekDetail.FieldByName('ZaterdagVZ').AsInteger;
  cmbZon.ItemIndex := TWeekDetail.FieldByName('ZondagVZ').AsInteger;

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
var UurToTal: Double;
    ToesUurTotal: Double;
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

  TWeekDetail.FieldByName('MaandagT').AsInteger := edtMaanT.Value;
  TWeekDetail.FieldByName('DinsdagT').AsInteger := edtDinT.Value;
  TWeekDetail.FieldByName('WoensdagT').AsInteger := edtWoenT.Value;
  TWeekDetail.FieldByName('DonderdagT').AsInteger := edtDonT.Value;
  TWeekDetail.FieldByName('VrijdagT').AsInteger := edtVrijT.Value;
  TWeekDetail.FieldByName('ZaterdagT').AsInteger := edtZatT.Value;
  TWeekDetail.FieldByName('ZondagT').AsInteger:= edtZonT.Value;

  TWeekDetail.FieldByName('MaandagTu').AsFloat := edtMaanTu.Value;
  TWeekDetail.FieldByName('DinsdagTu').AsFloat := edtDinTu.Value;
  TWeekDetail.FieldByName('WoensdagTu').AsFloat := edtWoenTu.Value;
  TWeekDetail.FieldByName('DonderdagTu').AsFloat := edtDonTu.Value;
  TWeekDetail.FieldByName('VrijdagTu').AsFloat := edtVrijTu.Value;
  TWeekDetail.FieldByName('ZaterdagTu').AsFloat := edtZatTu.Value;
  TWeekDetail.FieldByName('ZondagTu').AsFloat:= edtZonTu.Value;

  TWeekDetail.FieldByName('MaandagT2').AsInteger := edtMaanT2.Value;
  TWeekDetail.FieldByName('DinsdagT2').AsInteger := edtDinT2.Value;
  TWeekDetail.FieldByName('WoensdagT2').AsInteger := edtWoenT2.Value;
  TWeekDetail.FieldByName('DonderdagT2').AsInteger := edtDonT2.Value;
  TWeekDetail.FieldByName('VrijdagT2').AsInteger := edtVrijT2.Value;
  TWeekDetail.FieldByName('ZaterdagT2').AsInteger := edtZatT2.Value;
  TWeekDetail.FieldByName('ZondagT2').AsInteger:= edtZonT2.Value;

  TWeekDetail.FieldByName('MaandagTu2').AsFloat := edtMaanTu2.Value;
  TWeekDetail.FieldByName('DinsdagTu2').AsFloat := edtDinTu2.Value;
  TWeekDetail.FieldByName('WoensdagTu2').AsFloat := edtWoenTu2.Value;
  TWeekDetail.FieldByName('DonderdagTu2').AsFloat := edtDonTu2.Value;
  TWeekDetail.FieldByName('VrijdagTu2').AsFloat := edtVrijTu2.Value;
  TWeekDetail.FieldByName('ZaterdagTu2').AsFloat := edtZatTu2.Value;
  TWeekDetail.FieldByName('ZondagTu2').AsFloat:= edtZonTu2.Value;

  TWeekDetail.FieldByName('MaandagVZ').AsInteger := cmbMaan.ItemIndex;
  TWeekDetail.FieldByName('DinsdagVZ').AsInteger := cmbDin.ItemIndex;
  TWeekDetail.FieldByName('WoensdagVZ').AsInteger := cmbWoen.ItemIndex;
  TWeekDetail.FieldByName('DonderdagVZ').AsInteger := cmbDon.ItemIndex;
  TWeekDetail.FieldByName('VrijdagVZ').AsInteger := cmbVrij.ItemIndex;
  TWeekDetail.FieldByName('ZaterdagVZ').AsInteger := cmbZat.ItemIndex;
  TWeekDetail.FieldByName('ZondagVZ').AsInteger:= cmbZon.ItemIndex;

  UurToTal := (edtTotal.Value - (edtMaanTu.Value + edtDinTu.Value + edtWoenTu.Value + edtDonTu.Value
                                + edtVrijTu.Value + edtZatTu.Value + edtZonTu.Value
                                + edtMaanTu2.Value + edtDinTu2.Value + edtWoenTu2.Value + edtDonTu2.Value
                                + edtVrijTu2.Value + edtZatTu2.Value + edtZonTu2.Value));

  ToesUurTotal := (((edtMaanT.Value / 100)+ 1) * (edtMaanTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal +(((edtDinT.Value / 100)+ 1) * (edtDinTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtWoenT.Value / 100)+ 1) * (edtWoenTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtDonT.Value / 100)+ 1) * (edtDonTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtVrijT.Value / 100)+ 1) * (edtVrijTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtZatT.Value / 100)+ 1) * (edtZatTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtZonT.Value / 100)+ 1) * (edtZonTu.Value * TEmployees.FieldByName('UurLoon').AsCurrency));

  ToesUurTotal := ToesUurTotal +(((edtMaanT2.Value / 100)+ 1) * (edtMaanTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal +(((edtDinT2.Value / 100)+ 1) * (edtDinTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtWoenT2.Value / 100)+ 1) * (edtWoenTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtDonT2.Value / 100)+ 1) * (edtDonTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtVrijT2.Value / 100)+ 1) * (edtVrijTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtZatT2.Value / 100)+ 1) * (edtZatTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));
  ToesUurTotal := ToesUurTotal + (((edtZonT2.Value / 100)+ 1) * (edtZonTu2.Value * TEmployees.FieldByName('UurLoon').AsCurrency));


  TWeekDetail.FieldByName('SalarisTotaal').AsFloat := (UurToTal * TEmployees.FieldByName('UurLoon').AsCurrency) + ToesUurTotal;
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
  RecaulCulate;
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
