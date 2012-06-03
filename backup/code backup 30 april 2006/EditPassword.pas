unit EditPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ADODB;

type
  TfrmEditPassword = class(TForm)
    lblPassword: TLabel;
    lblAddress: TLabel;
    Panel3: TPanel;
    edtPassword: TEdit;
    edtPasswordAgain: TEdit;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    okknop: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure okknopClick(Sender: TObject);
  private
    TPassword: TADOTable;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditPassword: TfrmEditPassword;

implementation

uses Main;

{$R *.dfm}

procedure TfrmEditPassword.btnOkClick(Sender: TObject);
begin
  if edtPassword.Text = edtPasswordAgain.Text then begin
    ShowMessage('Uw wachtwoord is gewijzigd');
    TPassword := TfrmMain.GetTablePassword;
    TPassword.Locate('Id', 4, []);
    TPassword.Edit;
    TPassword.FieldByName('Wachtwoord').AsString := edtPassword.Text;
    TPassword.Post;
    okknop.Click;
  end
  else begin
    ShowMessage('Uw wachtwoorden zijn niet gelijk');
  end;
end;

procedure TfrmEditPassword.okknopClick(Sender: TObject);
begin
  //
end;

end.
