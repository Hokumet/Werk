unit EditFunctie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ADODB;

type
  TfrmEditFunctie = class(TForm)
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    Panel2: TPanel;
    lblName: TLabel;
    edtName: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    ID: Integer;
    TFuncties: TADOTable;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmEditFunctie: TfrmEditFunctie;

implementation

uses Main;

{$R *.dfm}

{ TfrmEditFunctie }

constructor TfrmEditFunctie.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  Self.ID := ID;
  TFuncties := TfrmMain.GetTableFuncties;
  TFuncties.Locate('ID', ID, []);
  edtName.Text := TFuncties.FieldByName('Functie').AsString;
end;

procedure TfrmEditFunctie.btnOkClick(Sender: TObject);
begin
  TFuncties.Edit;
  TFuncties.FieldByName('Functie').AsString := edtName.Text;
  TFuncties.Post;
end;

procedure TfrmEditFunctie.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin  
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

end.
