unit EditSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEditSettings = class(TForm)
    lblName: TLabel;
    lblAddress: TLabel;
    lblPostalcode: TLabel;
    lblPhoneNumber: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    edtName: TEdit;
    edtAddress: TEdit;
    edtPlace: TEdit;
    edtPostalCode: TEdit;
    edtPhoneNumber: TEdit;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtkvknr: TEdit;
    Label3: TLabel;
    edtgrekening: TEdit;
    Label4: TLabel;
    edtzrekening: TEdit;
    Button1: TButton;
    Label5: TLabel;
    edtEmailadres: TEdit;
    edtBtwnr: TEdit;
    Label6: TLabel;
    edtLoonbelastingnr: TEdit;
    btnFuncties: TButton;
    Label7: TLabel;
    edtBanknaam: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure btnFunctiesClick(Sender: TObject);
  private
    procedure SaveValues;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditSettings: TfrmEditSettings;

implementation

uses Main, EditPassword, Functies;

{$R *.dfm}

procedure TfrmEditSettings.FormCreate(Sender: TObject);
begin
  inherited;
  frmMain := TfrmMain(Owner);
  frmMain.DBTEigen.First;

  edtName.Text := frmMain.DBTEigenNaam.AsString ;
  edtAddress.Text := frmMain.DBTEigenAdres.AsString;
  edtPostalCode.Text := frmMain.DBTEigenPostcode.AsString;
  edtPlace.Text := frmMain.DBTEigenPlaats.AsString;
  edtPhoneNumber.Text := frmMain.DBTEigenTelefoonnummer.AsString;
  edtkvknr.Text := frmMain.DBTEigenKvknummer.AsString;
  edtBtwnr.Text := frmMain.DBTEigenBtwnummer.AsString;
  edtgrekening.Text := frmMain.DBTEigenGrekening.AsString;
  edtzrekening.Text := frmMain.DBTEigenZrekening.AsString;
  edtEmailadres.Text := frmMain.DBTEigenEmailadres.AsString;
  edtLoonbelastingnr.Text := frmMain.DBTEigenLoonbelastingnr.AsString;
  edtBanknaam.Text := frmMain.DBTEigenBankNaam.AsString;
end;

procedure TfrmEditSettings.btnOkClick(Sender: TObject);
begin     
  SaveValues;
end;

procedure TfrmEditSettings.SaveValues;
begin
  frmMain.DBTEigen.Edit;
  frmMain.DBTEigenNaam.AsString := edtName.Text;
  frmMain.DBTEigenAdres.AsString := edtAddress.Text;
  frmMain.DBTEigenPostcode.AsString := edtPostalCode.Text;
  frmMain.DBTEigenPlaats.AsString := edtPlace.Text;
  frmMain.DBTEigenTelefoonnummer.AsString := edtPhoneNumber.Text;
  frmMain.DBTEigenKvknummer.AsString := edtkvknr.Text;
  frmMain.DBTEigenBtwnummer.AsString := edtBtwnr.Text;
  frmMain.DBTEigenGrekening.AsString := edtgrekening.Text;
  frmMain.DBTEigenZrekening.AsString := edtzrekening.Text;
  frmMain.DBTEigenEmailadres.AsString := edtEmailadres.Text;
  frmMain.DBTEigenLoonbelastingnr.AsString := edtLoonbelastingnr.Text;
  frmMain.DBTEigenBankNaam.AsString := edtBanknaam.Text;
  frmMain.DBTEigen.Post;
end;

procedure TfrmEditSettings.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmEditSettings.Button1Click(Sender: TObject);
begin
  TfrmEditPassword.Create(Self).ShowModal;;
end;

procedure TfrmEditSettings.btnFunctiesClick(Sender: TObject);
begin              
  frmFuncties := TfrmFuncties.Create(Self);
  try
    frmFuncties.ShowModal;
  finally
    frmFuncties.Free;
  end;
end;

end.
