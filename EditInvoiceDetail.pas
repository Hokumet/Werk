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
    procedure cmbFuntiesSelect(Sender: TObject);
  private
    ID: Integer;
    HourPrice: Double;
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
  HourPrice := 0.0;
  Self.ID := ID;
  TInvoiceDetail := TfrmMain.GetTableInvoiceDetail;
  TInvoiceDetail.Locate('ID', ID, []);

  edtNummers.Text := TInvoiceDetail.FieldByName('nummers').AsString;
  edtHour.Value := TInvoiceDetail.FieldByName('Uren').AsFloat;
  HourPrice := TInvoiceDetail.FieldByName('Uurprijs').AsCurrency;
  edtHourprice.Value := HourPrice;
  ckbeenmalig.Checked := TInvoiceDetail.FieldByName('eenmalig').AsBoolean;
  edtTotalPrice.Value := TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency;
  edtOmschrijving.Text := TInvoiceDetail.FieldByName('Omschrijving').AsString;
  if not ckbeenmalig.Checked then begin
    setFuncties;
    ckboverwerk.Checked := TInvoiceDetail.FieldByName('Overwerk').AsBoolean;
    edtoverPercentage.Value :=  TInvoiceDetail.FieldByName('overwerkpercentage').AsFloat;

    if ckboverwerk.Checked then
      HourPrice := (HourPrice * 100) / (100 + edtoverPercentage.Value);
  end;

                      
  setVisibleEnaled;      
  setPercentageVisibleorHide;
end;

procedure TfrmInvoiceDetail.btnOkClick(Sender: TObject);
begin
  TInvoiceDetail.Edit;                  
  TInvoiceDetail.FieldByName('nummers').AsString := edtNummers.Text;
  TInvoiceDetail.FieldByName('Uren').AsFloat := edtHour.Value;  
  TInvoiceDetail.FieldByName('Totaalbedrag').AsCurrency := edtTotalPrice.Value;


  if ckbeenmalig.Checked then begin
    TInvoiceDetail.FieldByName('Omschrijving').AsString := edtOmschrijving.Text;
    TInvoiceDetail.FieldByName('Uurprijs').AsCurrency := 0.00;
    TInvoiceDetail.FieldByName('eenmalig').AsBoolean := ckbeenmalig.Checked;
    TInvoiceDetail.FieldByName('Overwerk').AsBoolean := False;                
    TInvoiceDetail.FieldByName('overwerks').AsString := '';
  end
  else begin
      if ckbOverwerk.Checked then begin
        TInvoiceDetail.FieldByName('overwerks').AsString := 'Overwerk';   
        TInvoiceDetail.FieldByName('Omschrijving').AsString := edtOmschrijving.Text;
      end
      else begin
        TInvoiceDetail.FieldByName('overwerks').AsString := '';
        TInvoiceDetail.FieldByName('Omschrijving').AsString := cmbFunties.Items.Strings[cmbFunties.ItemIndex]; 
        TInvoiceDetail.FieldByName('Functieid').AsInteger := Integer(cmbFunties.Items.Objects[cmbFunties.ItemIndex]);
      end;
      TInvoiceDetail.FieldByName('Uurprijs').AsCurrency := edtHourprice.Value; 
      TInvoiceDetail.FieldByName('eenmalig').AsBoolean := False;
      TInvoiceDetail.FieldByName('Overwerk').AsBoolean := ckbOverwerk.Checked;
      TInvoiceDetail.FieldByName('overwerkpercentage').AsFloat := edtoverPercentage.Value;
  end;                                                                 
  TInvoiceDetail.Post;
end;

procedure TfrmInvoiceDetail.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmInvoiceDetail.cmbFuntiesSelect(Sender: TObject);
begin
  TKlantFuncties.Locate('Id', Integer(cmbFunties.Items.Objects[cmbFunties.ItemIndex]),[]);
  HourPrice := TKlantFuncties.FieldByname('Prijs').AsCurrency;
  edtHourprice.Value := HourPrice;
end;

procedure TfrmInvoiceDetail.edtHourpriceExit(Sender: TObject);
begin
    if ckbeenmalig.Checked then begin
        //edtTotalPrice.Value := edtHour.Value * edtHourprice.Value;
    end
    else begin
      if ckbOverwerk.Checked then begin
        edtHourprice.Value := HourPrice +((HourPrice * edtoverPercentage.Value)/100);
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
    Label5.Visible := ckbOverwerk.Checked;
    edtoverPercentage.Visible := ckbOverwerk.Checked;
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
    Label5.Visible := ckbOverwerk.Checked;
    edtoverPercentage.Visible := ckbOverwerk.Checked;
    edtHourprice.Visible := True;
    edtHourprice.Enabled := True;
    lblhourPrice.Visible := True;
    edtOmschrijving.Visible := False;
  end;
end;

procedure  TfrmInvoiceDetail.setPercentageVisibleorHide;
begin
  if not ckbeenmalig.Checked then begin
    if ckbOverwerk.Checked then begin
      cmbFunties.Visible := False;
      cmbFunties.Enabled := False;
      edtOmschrijving.Visible := True;
    end
    else begin
      setFuncties;
      cmbFunties.Visible := True;
      cmbFunties.Enabled := True;
      edtOmschrijving.Visible := False;
    end;
    edtoverPercentage.Visible := ckbOverwerk.Checked;
    Label5.Visible := ckbOverwerk.Checked;
  end;
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
  edtHourprice.Value := HourPrice;
  setPercentageVisibleorHide;
end;

procedure TfrmInvoiceDetail.ckbeenmaligClick(Sender: TObject);
begin
  setVisibleEnaled;
end;


end.
