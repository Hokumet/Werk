unit Functies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, ADODB;

type
  TfrmFuncties = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lvwItems: TListView;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    btnEdit: TBitBtn;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    TFuncties: TADOTable;
    procedure loadFuncties;
  public
    { Public declarations }
  end;

var
  frmFuncties: TfrmFuncties;

implementation

uses EditFunctie, Main;

{$R *.dfm}

procedure TfrmFuncties.btnAddClick(Sender: TObject);
begin
  TFuncties.Insert;
  TFuncties.FieldByName('Functie').AsString := 'XXX';
  TFuncties.Post;
  TFuncties.Refresh;
  frmEditFunctie := TfrmEditFunctie.Create(Self, TFuncties.FieldByName('Id').AsInteger);
  try
    if frmEditFunctie.ShowModal = mrOk then
      loadFuncties
    else
      TFuncties.Delete;
  finally
    frmEditFunctie.Free;
  end;
end;

procedure TfrmFuncties.btnEditClick(Sender: TObject);
begin
  if lvwItems.Selected = nil then Exit;
  frmEditFunctie := TfrmEditFunctie.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmEditFunctie.ShowModal = mrOk then
      loadFuncties;
  finally
    frmEditFunctie.Free;
  end;
end;

procedure TfrmFuncties.btnDeleteClick(Sender: TObject);
begin
  TFuncties.Locate('ID', Integer(lvwItems.Selected.Data), []);
  TFuncties.Delete;
  loadFuncties;
end;

procedure TfrmFuncties.loadFuncties;
var I: Integer;
    Item: TListItem;
begin
  TFuncties.Refresh;
  lvwItems.Clear;
  TFuncties.First;
  for I := 0 to TFuncties.RecordCount -1 do begin
    Item := lvwItems.Items.Add;
    Item.Caption := TFuncties.FieldByName('Functie').AsString;
    Item.Data := Pointer(TFuncties.FieldByName('Id').AsInteger);
    TFuncties.Next;
  end;
end;

procedure TfrmFuncties.FormCreate(Sender: TObject);
begin
  TFuncties := TfrmMain.GetTableFuncties;
  loadFuncties;
end;

procedure TfrmFuncties.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

end.
