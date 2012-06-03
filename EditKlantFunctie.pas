unit EditKlantFunctie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, HolderEdits, ExtCtrls, ADODB, Spin;

type
  TfrmKlantFunctie = class(TForm)
    lblfunctie: TLabel;
    lblprijs: TLabel;
    Panel3: TPanel;
    edtHourprice: THCurrencyEdit;
    cmbFunties: TComboBox;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);  
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    ID: Integer;
    TKlantFuncties, TFuncties: TADOTable;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmKlantFunctie: TfrmKlantFunctie;

implementation

uses main, DB;

{$R *.dfm}

{ TedtKlantFunctie }

constructor TfrmKlantFunctie.Create(Owner: TComponent; ID: Integer);
var I, Index: Integer;
begin
  inherited Create(Owner);
  Self.ID := ID;
  TKlantFuncties := TfrmMain.GetTableKlantFuncties;
  TKlantFuncties.Locate('ID', ID, []);
  edtHourprice.Value := TKlantFuncties.FieldByName('Prijs').AsCurrency;

  TFuncties := TfrmMain.GetTableFuncties;

  TFuncties.First;
  for I := 0 to TFuncties.RecordCount -1 do begin
    Index := cmbFunties.Items.AddObject(TFuncties.FieldByName('Functie').AsString,   Pointer(TFuncties.FieldByName('Id').AsInteger));
    if TKlantFuncties.FieldByName('Functieid').AsInteger = TFuncties.FieldByName('Id').AsInteger then
      cmbFunties.ItemIndex := Index;
    TFuncties.Next;
  end;

  if cmbFunties.ItemIndex = -1 then  cmbFunties.ItemIndex := 0;
end;

procedure TfrmKlantFunctie.btnOkClick(Sender: TObject);
begin
  TKlantFuncties.Edit;
  TKlantFuncties.FieldByName('Functieid').AsInteger := Integer(cmbFunties.Items.Objects[cmbFunties.ItemIndex]);
  TKlantFuncties.FieldByName('Prijs').AsCurrency := edtHourprice.Value;
  TKlantFuncties.Post;
end;                  

procedure TfrmKlantFunctie.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

end.
