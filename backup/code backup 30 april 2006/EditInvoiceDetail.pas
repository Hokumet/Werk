unit EditInvoiceDetail;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ADODB, Spin, Messages, HolderEdits;

type
  TfrmInvoiceDetail = class(TForm)
    lblName: TLabel;
    lblhour: TLabel;
    lblhourPrice: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    edtHourprice: THCurrencyEdit;
    edtTotalPrice: THCurrencyEdit;
    Label1: TLabel;
    cmbFunties: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtNummers: TEdit;
    ckbeenmalig: TCheckBox;
    Label4: TLabel;
    edtOmschrijving: TEdit;
    Label5: TLabel;
    edtHour: THFloatEdit;
    edtoverPercentage: THFloatEdit;
    ckbOverwerk: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure edtHourpriceExit(Sender: TObject);
    procedure ckbOverwerkClick(Sender: TObject);
    procedure ckbeenmaligClick(Sender: TObject);
  private
    ID: Integer;
    TInvoiceDetail, TKlantFuncties, TFuncties, TInvoice, TCustomer: TADOTable;
    procedure setFuncties;
    procedure setVisibleEnaled;
    procedure setPercentageVisibleorHide;

  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmInvoiceDetail: TfrmInvoiceDetail;

implementation

uses Main, DB;
{$R *.dfm}

{ TfrmInvoiceDetail }

constructor TfrmInvoiceDetail.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  Self.ID := ID;
  TInvoiceDetail := TfrmMain.GetTableInvoiceDetail;
  TInvoiceDetail.Locate('ID', ID, []);
                                                                    
  edtNummers.Text := TInvoiceDetail.FieldByName('nummers').AsString;
  edtHour.Value := TInvoiceDetail.FieldByName('Uren').AsFloat;
  edtHourprice.Value := TInvoiceDetail.FieldByName('Uurprijs').AsCurrency;
  ckbeenmalig.Checked := TInvoiceDetail.FieldByName('eenmalig').AsBoolean;
  edtTotalPrice.Value := TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency;
  edtOmschrijving.Text := TInvoiceDetail.FieldByName('Omschrijving').AsString;
  if not ckbeenmalig.Checked then begin
    setFuncties;
    ckboverwerk.Checked := TInvoiceDetail.FieldByName('Overwerk').AsBoolean;
    edtoverPercentage.Value :=  TInvoiceDetail.FieldByName('overwerkpercentage').AsFloat;
  end;

  setPercentageVisibleorHide;

  setVisibleEnaled;
end;

procedure TfrmInvoiceDetail.btnOkClick(Sender: TObject);
begin
  TInvoiceDetail.Edit;
  if ckbeenmalig.Checked then begin
    TInvoiceDetail.FieldByName('nummers').AsString := edtNummers.Text;
    TInvoiceDetail.FieldByName('Omschrijving').AsString := edtOmschrijving.Text;
    TInvoiceDetail.FieldByName('Uren').AsFloat := edtHour.Value;
    TInvoiceDetail.FieldByName('Uurprijs').AsCurrency := 0.00;
    TInvoiceDetail.FieldByName('eenmalig').AsBoolean := ckbeenmalig.Checked;
    TInvoiceDetail.FieldByName('Overwerk').AsBoolean := False;                
    TInvoiceDetail.FieldByName('overwerks').AsString := '';
    TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency := edtTotalPrice.Value;
  end
  else begin
      if ckbOverwerk.Checked then
        TInvoiceDetail.FieldByName('overwerks').AsString := 'Overwerk'
      else
        TInvoiceDetail.FieldByName('overwerks').AsString := '';

      TInvoiceDetail.FieldByName('nummers').AsString := edtNummers.Text;
      TInvoiceDetail.FieldByName('Omschrijving').AsString := cmbFunties.Items.Strings[cmbFunties.ItemIndex];
      TInvoiceDetail.FieldByName('Functieid').AsInteger := Integer(cmbFunties.Items.Objects[cmbFunties.ItemIndex]);
      TInvoiceDetail.FieldByName('Uren').AsFloat := edtHour.Value;
      TInvoiceDetail.FieldByName('Uurprijs').AsCurrency := edtHourprice.Value; 
      TInvoiceDetail.FieldByName('eenmalig').AsBoolean := False;
      TInvoiceDetail.FieldByName('Overwerk').AsBoolean := ckbOverwerk.Checked;
      TInvoiceDetail.FieldByName('overwerkpercentage').AsFloat := edtoverPercentage.Value;
      TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency := edtTotalPrice.Value;
  end;                                                                 
      TInvoiceDetail.Post;
end;

procedure TfrmInvoiceDetail.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmInvoiceDetail.edtHourpriceExit(Sender: TObject);
begin
    if ckbeenmalig.Checked then begin
        //edtTotalPrice.Value := edtHour.Value * edtHourprice.Value;
    end
    else begin          
      TKlantFuncties.Locate('Id', Integer(cmbFunties.Items.Objects[cmbFunties.ItemIndex]),[]);
      edtHourprice.Value := TKlantFuncties.FieldByname('Prijs').AsCurrency;
      if ckbOverwerk.Checked then begin
       edtHourprice.Value := edtHourprice.Value +((edtHourprice.Value* edtoverPercentage.Value)/100);
        edtTotalPrice.Value := edtHour.Value * edtHourprice.Value;
      end
      else
        edtTotalPrice.Value := edtHour.Value * edtHourprice.Value
    end
end;

procedure TfrmInvoiceDetail.setVisibleEnaled;
begin
  if ckbeenmalig.Checked then begin
    cmbFunties.Visible := False;
    cmbFunties.Enabled := False;
    Label2.Visible := False;
    ckbOverwerk.Visible := False;
    ckbOverwerk.Enabled := False;
    ckbOverwerk.Checked := False;
    edtHourprice.Visible := False;
    edtHourprice.Enabled := False;
    lblhourPrice.Visible := False;
    edtOmschrijving.Visible := True;
  end
  else begin
    setFuncties;
    cmbFunties.Visible := True;
    cmbFunties.Enabled := True;  
    Label2.Visible := true; 
    ckbOverwerk.Visible := True;
    ckbOverwerk.Enabled := True;
    edtHourprice.Visible := True;
    edtHourprice.Enabled := True; 
    lblhourPrice.Visible := True;
    edtOmschrijving.Visible := False;
  end;
end;

procedure  TfrmInvoiceDetail.setPercentageVisibleorHide;
begin
  edtoverPercentage.Value := 0;
  edtoverPercentage.Visible := ckbOverwerk.Checked;
  Label5.Visible := ckbOverwerk.Checked;
  if ckbOverwerk.Checked then begin
    edtoverPercentage.Value := 34;
  end
end;

procedure TfrmInvoiceDetail.setFuncties;
var I, Index: Integer;
begin
  TInvoice := TfrmMain.GetTableInvoice;
  TCustomer := TfrmMain.GetTableCustomer;

  TInvoice.Locate('ID', TInvoiceDetail.FieldByName('FactuurId').AsString, []);
  TCustomer.Locate('ID', TInvoice.FieldByName('KlantId').AsString, []);

  TKlantFuncties := TfrmMain.GetTableKlantFuncties;
  TKlantFuncties.Filter := 'KlantID =' + TCustomer.FieldByName('ID').AsString;
  TKlantFuncties.Filtered := true;

  TFuncties := TfrmMain.GetTableFuncties;

  TKlantFuncties.First;
  cmbFunties.Clear;
  for I := 0 to TKlantFuncties.RecordCount -1 do begin
    TFuncties.Locate('ID', TKlantFuncties.FieldByName('FunctieId').AsInteger, []);

    Index := cmbFunties.Items.AddObject(TFuncties.FieldByName('Functie').AsString,   Pointer(TKlantFuncties.FieldByName('Id').AsInteger));
    if TInvoiceDetail.FieldByName('Functieid').AsInteger = TKlantFuncties.FieldByName('Id').AsInteger then
      cmbFunties.ItemIndex := Index;
    TKlantFuncties.Next;
  end;
  if cmbFunties.ItemIndex = -1 then  cmbFunties.ItemIndex := 0;
end;

procedure TfrmInvoiceDetail.ckbOverwerkClick(Sender: TObject);
begin
  setPercentageVisibleorHide;
end;

procedure TfrmInvoiceDetail.ckbeenmaligClick(Sender: TObject);
begin
  setVisibleEnaled;
end;

end.
