unit EditLateInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ADODB;

type
  TfrmEditLateInvoice = class(TForm)
    lvwItems: TListView;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure lvwItemsDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    TInvoice, TCustomer: TADOTable;
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmEditLateInvoice: TfrmEditLateInvoice;

implementation

uses Main, DB, DateUtils, Math, EditInvoice, ReportInvoice;
{$R *.dfm}

procedure TfrmEditLateInvoice.FormCreate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmEditLateInvoice.lvwItemsDblClick(Sender: TObject);
begin
  frmEditInvoice := TfrmEditInvoice.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmEditInvoice.ShowModal = mrOk then
      Refresh;
  finally
    frmEditInvoice.Free;
  end;
end;

procedure TfrmEditLateInvoice.Refresh;
var Item: TListItem;
    I: Integer;
    TempDate: TDateTime;
begin
  lvwItems.Clear;

  TInvoice := TfrmMain.GetTableInvoice;
  TCustomer := TfrmMain.GetTableCustomer;
  TInvoice.First;

  for I := 0 to TInvoice.RecordCount -1 do begin
    TempDate := TInvoice.FieldByName('Factuurdatum').AsDateTime;
    IncWeek(TempDate, 2);

     if not TInvoice.FieldByName('Betaald').AsBoolean and (TempDate < Now) then begin
      TCustomer.Locate('ID', TInvoice.FieldByName('KlantId').AsString, [] );

      Item := lvwItems.Items.Add;
      Item.Caption := TInvoice.FieldByName('Factuurnr').AsString;
      Item.SubItems.Add(TCustomer.FieldByName('Naam').AsString);
      Item.SubItems.Add(DateToStr(TInvoice.FieldByName('Factuurdatum').AsDateTime));
      Item.SubItems.Add('€ '+ CurrToStrF(TInvoice.FieldByName('TeBetalen').AsCurrency, ffFixed, 2));
      Item.SubItems.Add(IntToStr(MonthsBetween (Now, TInvoice.FieldByName('Factuurdatum').AsDateTime)));
      Item.Data := Pointer(TInvoice.FieldByName('Id').AsInteger);
    end;
    TInvoice.Next;
  end;
end;

procedure TfrmEditLateInvoice.BitBtn2Click(Sender: TObject);
begin
  frmReportInvoice := TfrmReportInvoice.Create(Self, Integer(lvwItems.Selected.Data));
  try
    frmReportInvoice.ShowModal;
  finally
    frmReportInvoice.Free;
  end;
end;

end.
