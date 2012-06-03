unit EditCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, CustomizeDlg, ActnMan, ActnColorMaps, Buttons,
  ExtCtrls, Spin, ComCtrls,AdoDB, HolderEdits;

type
  TfrmEditCustomer = class(TForm)
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    lblName: TLabel;
    lblAddress: TLabel;
    lblPostalcode: TLabel;
    lblPhoneNumber: TLabel;
    lblNotes: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    edtName: TEdit;
    edtAddress: TEdit;
    edtPlace: TEdit;
    edtPostalCode: TEdit;
    edtPhoneNumber: TEdit;
    rbtBtw: TRadioGroup;
    ckbDeleted: TCheckBox;
    edtPeriod: TSpinEdit;
    lvwItems: TListView;
    btnDelete: TBitBtn;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    lblBtwnr: TLabel;
    edtMNotes: TMemo;
    edtPrijs: THCurrencyEdit;
    edtBtwnr: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvwItemsDblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    ID: Integer;
    TKlantFuncties, TFuncties: TADOTable;
    procedure SaveValues;
    procedure LoadFuncties;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmEditCustomer: TfrmEditCustomer;

implementation

uses DB, Main, EditKlantFunctie;

{$R *.dfm}

{ TfrmResultsForm }

constructor TfrmEditCustomer.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  Self.ID := ID;
  frmMain := TfrmMain(Owner);
  frmMain.DBTCustomers.Locate('ID', ID, []);

  edtName.Text := frmMain.DBTCustomersNaam.AsString ;
  edtAddress.Text := frmMain.DBTCustomersAdres.AsString;
  edtPostalCode.Text := frmMain.DBTCustomersPostcode.AsString;
  edtPlace.Text := frmMain.DBTCustomersPlaats.AsString;
  edtPhoneNumber.Text := frmMain.DBTCustomersTelefoonnr.AsString;
  edtMNotes.Text := frmMain.DBTCustomersNotities.AsString;
  edtPeriod.Value := frmMain.DBTCustomersPeriode.AsInteger;
  edtPrijs.Value := frmMain.DBTCustomersPrijswerk.AsCurrency;      
  edtBtwnr.Text := frmMain.DBTCustomersBtwNr.AsString;
  rbtBtw.ItemIndex := 0;
  if not frmMain.DBTCustomersBtw.AsBoolean then
    rbtBtw.ItemIndex := 1;

  if frmMain.DBTCustomersVerwijderd.AsBoolean then
    ckbDeleted.Visible := True;

  
  btnEdit.Enabled := False;
  btnDelete.Enabled := False;


  TKlantFuncties := TfrmMain.GetTableKlantFuncties;
  TFuncties := TfrmMain.GetTableFuncties;
  LoadFuncties;
end;


procedure TfrmEditCustomer.LoadFuncties;
var I: Integer;
    Item: TListItem;
begin                   
  lvwItems.Clear;
  TKlantFuncties.Filter := 'KlantID =' + IntToStr(ID);
  TKlantFuncties.Filtered := true;  

  TKlantFuncties.First;
  for I := 0 to TKlantFuncties.RecordCount -1 do begin
    Item := lvwItems.Items.Add;                             
    if TFuncties.Locate('ID', TKlantFuncties.FieldByName('FunctieId').AsInteger, []) then
      Item.Caption := TFuncties.FieldByName('Functie').AsString
    else
      Item.Caption := 'Functie is verwijderd';
    Item.SubItems.Add('€ ' + TKlantFuncties.FieldByName('Prijs').AsString);
                                                                               
    Item.Data := Pointer(TKlantFuncties.FieldByName('Id').AsInteger);
    TKlantFuncties.Next;
  end;
end;
         
procedure TfrmEditCustomer.btnAddClick(Sender: TObject);
begin
  TKlantFuncties.Insert;
  TKlantFuncties.FieldByName('KlantID').AsInteger := ID;
  TKlantFuncties.Post;
  TKlantFuncties.Refresh;
  frmKlantFunctie := TfrmKlantFunctie.Create(Self, TKlantFuncties.FieldByName('Id').AsInteger);
  try
    if frmKlantFunctie.ShowModal = mrOk then
      LoadFuncties
    else
      TKlantFuncties.Delete;
  finally
    frmKlantFunctie.Free;
  end;
end;

procedure TfrmEditCustomer.btnEditClick(Sender: TObject);
begin

  if lvwItems.Selected = nil then Exit;
  frmKlantFunctie := TfrmKlantFunctie.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmKlantFunctie.ShowModal = mrOk then
      LoadFuncties;
  finally
    frmKlantFunctie.Free;
  end;   
end;
                
procedure TfrmEditCustomer.lvwItemsDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfrmEditCustomer.btnDeleteClick(Sender: TObject);
begin
  TKlantFuncties.Locate('KlantID', Integer(lvwItems.Selected.Data), []);
  TKlantFuncties.Delete;
  LoadFuncties;
end;

procedure TfrmEditCustomer.btnOkClick(Sender: TObject);
begin
  SaveValues;
end;

procedure TfrmEditCustomer.SaveValues;
begin
  frmMain.DBTCustomers.Edit;
  frmMain.DBTCustomersNaam.AsString := edtName.Text;
  frmMain.DBTCustomersAdres.AsString := edtAddress.Text;
  frmMain.DBTCustomersPostcode.AsString := edtPostalCode.Text;
  frmMain.DBTCustomersPlaats.AsString := edtPlace.Text;
  frmMain.DBTCustomersTelefoonnr.AsString := edtPhoneNumber.Text;
  frmMain.DBTCustomersNotities.AsString := edtMNotes.Text;
  frmMain.DBTCustomersPrijswerk.AsCurrency := edtPrijs.Value;
  frmMain.DBTCustomersPeriode.AsInteger := edtPeriod.Value;
  frmMain.DBTCustomersBtw.AsBoolean := rbtBtw.ItemIndex = 0;
  frmMain.DBTCustomersBtwNr.AsString := edtBtwnr.Text;
  if frmMain.DBTCustomersVerwijderd.AsBoolean then
    frmMain.DBTCustomersVerwijderd.AsBoolean := not ckbDeleted.Checked;
  frmMain.DBTCustomers.Post;
end;

procedure TfrmEditCustomer.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmEditCustomer.lvwItemsSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
   btnEdit.Enabled := Selected;
   btnDelete.Enabled := Selected;
end;

end.
