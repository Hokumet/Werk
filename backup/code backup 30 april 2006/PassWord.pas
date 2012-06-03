unit PASSWORD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls,  ADODB;

type
  TPasswordDlg = class(TForm)
    lblUserName: TLabel;
    lblPassword: TLabel;
    lblVersion: TLabel;
    Label1: TLabel;
    edtPassword: TEdit;
    cmbUsers: TComboBox;
    CancelBtn: TButton;
    Okbtn: TButton;
    //DBTUsers: TADOTable;
    //DBTUsersID: TAutoIncField;
    //DBTUsersLoginnaam: TWideStringField;
    //DBTUsersWachtwoord: TWideStringField;
    //DBTUsersIngelogd: TBooleanField;
    procedure OKBtnClick(Sender: TObject);
  private
    function CurrentUserValidated: Boolean;
  public
    TUsers: TADOTable;
    constructor Create(Owner: TComponent); override;
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses Dialogs, Main, DB;
{$R *.dfm}

constructor TPasswordDlg.Create;
var I: Integer;
begin
  inherited;
  TUsers := TfrmMain.GetTablePassword;
  TUsers.First;
  for I := 0 to TUsers.RecordCount -1 do begin
    cmbUsers.Items.AddObject(TUsers.FieldByName('Loginnaam').AsString, Pointer(TUsers.FieldByName('ID').AsInteger));
    TUsers.Next;
  end;
  cmbUsers.ItemIndex := 0;
end;

function TPasswordDlg.CurrentUserValidated: Boolean;
begin
  Result := False;
  TUsers.Refresh;
  TUsers.Locate('ID',Integer(cmbUsers.Items.Objects[cmbUsers.ItemIndex]),[loCaseInsensitive]);
  if (TUsers.FieldByName('Loginnaam').AsString = cmbUsers.Items.Strings[cmbUsers.ItemIndex]) and (TUsers.FieldByName('Wachtwoord').AsString = edtPassword.Text) then
    Result := True;
end;

procedure TPasswordDlg.OKBtnClick(Sender: TObject);
begin
  if CurrentUserValidated then
      ModalResult := mrOk
  else begin
    ModalResult := mrNone;
    edtPassword.SetFocus;
  end;
end;

end.

