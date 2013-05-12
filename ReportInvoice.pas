unit ReportInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpRenderPrinter, RpRender, RpRenderCanvas, RpRenderPreview, RpConDS,
  RpCon, RpBase, RpSystem, RpDefine,  ppRelatv, ppProd, ppClass,
  ppReport, ppFormWrapper, ppRptExp, ppComm, ppEndUsr, ExtCtrls, ppViewr, ppTypes,
  ppPrnabl, ppCtrls, ppBands, ppCache, ppDB, ppDBJIT, ComCtrls, ToolWin, ImgList,
  ppParameter, ADODB, ppStrtch, ppSubRpt;

type
  TfrmReportInvoice = class(TForm)
    ImageList: TImageList;
    CoolBar1: TCoolBar;
    tbMain: TToolBar;
    btnPrint: TToolButton;
    ToolButton1: TToolButton;
    btnWholePage: TToolButton;
    btnPageWidth: TToolButton;
    btnPage100: TToolButton;
    ToolButton10: TToolButton;
    btnFirstPage: TToolButton;
    btnPriorPage: TToolButton;
    btnNextPage: TToolButton;
    btnLastPage: TToolButton;
    ToolButton9: TToolButton;
    pnlButtons: TPanel;
    ppViewer: TppViewer;
    repReport: TppReport;
    ppMain: TppJITPipeline;
    ppJITPipeline1ppField1: TppField;
    ppJITPipeline1ppField2: TppField;
    ppJITPipeline1ppField3: TppField;
    ppDetailBand1: TppDetailBand;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppJITPipeline1ppField4: TppField;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppDetail: TppJITPipeline;
    ppJITPipeline2ppField1: TppField;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppDBText6: TppDBText;
    ppJITPipeline2ppField2: TppField;
    ppDBText7: TppDBText;
    ppMainppField1: TppField;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppCustomer: TppJITPipeline;
    ppCustomerppField1: TppField;
    ppCustomerppField2: TppField;
    ppCustomerppField3: TppField;
    ppCustomerppField4: TppField;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppCustomerppField5: TppField;
    ppDBText11: TppDBText;
    ppMainppField2: TppField;
    ppMainppField3: TppField;
    ppMainppField4: TppField;
    ppMainppField5: TppField;
    ppEigen: TppJITPipeline;
    ppBtwppField1: TppField;
    ppBtwppField2: TppField;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel12: TppLabel;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppLabel16: TppLabel;
    ppDetailppField1: TppField;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel23: TppLabel;
    ppShape3: TppShape;
    ppShape7: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppDBText19: TppDBText;
    ppShape13: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppLine3: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel6: TppLabel;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppMainppField6: TppField;
    ppMainppField7: TppField;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel7: TppLabel;
    ppLabel24: TppLabel;
    ppReportbackup: TppReport;
    ppDetailBand3: TppDetailBand;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppLabel27: TppLabel;
    ppDBText26: TppDBText;
    ppLabel28: TppLabel;
    ppDBText27: TppDBText;
    ppLabel29: TppLabel;
    ppDBText28: TppDBText;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppDetailBand4: TppDetailBand;
    ppShape28: TppShape;
    ppDBText29: TppDBText;
    ppShape29: TppShape;
    ppDBText30: TppDBText;
    ppShape30: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLabel32: TppLabel;
    ppDBText35: TppDBText;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDBText36: TppDBText;
    ppLabel35: TppLabel;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppLabel36: TppLabel;
    ppDBText40: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel37: TppLabel;
    ppDBText41: TppDBText;
    ppLabel38: TppLabel;
    ppDBText42: TppDBText;
    ppLabel39: TppLabel;
    ppDBText43: TppDBText;
    ppLabel40: TppLabel;
    ppDBText44: TppDBText;
    ppLabel41: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppShape34: TppShape;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLine6: TppLine;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppLabel54: TppLabel;
    ppWeek: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    Btw: TppField;
    ppDBText5: TppDBText;
    ppEigenppField1: TppField;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppEigenppField2: TppField;
    ppEigenppField3: TppField;
    ppEigenppField4: TppField;
    ppEigenppField5: TppField;
    ppEigenppField6: TppField;
    ppEigenppField7: TppField;
    ppEigenppField8: TppField;
    ppLabel5: TppLabel;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText49: TppDBText;
    ppLabel21: TppLabel;
    ppDBText50: TppDBText;
    ppLabel22: TppLabel;
    ppDBText51: TppDBText;
    ppLabel25: TppLabel;
    ppDBText52: TppDBText;
    ppCustomerppField6: TppField;
    ppLabel31: TppLabel;
    ppDBText53: TppDBText;
    ppDetailppField2: TppField;
    ppShape4: TppShape;
    ppDBText54: TppDBText;
    ppShape5: TppShape;
    ppLabel30: TppLabel;
    ppLabel55: TppLabel;
    ppDBText55: TppDBText;
    ppCustomerppField7: TppField;
    ppDBText56: TppDBText;
    ppEigenppField9: TppField;
    ppLabel17: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDBText57: TppDBText;
    ppEigenppField10: TppField;
    ppoverwerkpercentage: TppField;
    procedure btnLastPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnPriorPageClick(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
    procedure btnPage100Click(Sender: TObject);
    procedure btnPageWidthClick(Sender: TObject);
    procedure btnWholePageClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    function ppMainGetFieldValue(aFieldName: string): Variant;
    function ppDetailGetFieldValue(aFieldName: String): Variant;
    function ppCustomerGetFieldValue(aFieldName: String): Variant;
    function ppEigenGetFieldValue(aFieldName: String): Variant;
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    function ppWeekGetFieldValue(aFieldName: String): Variant;
  private
    TInvoice, TInvoiceDetail, TCustomer, TWeekReport, TEigen: TADOTable;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmReportInvoice: TfrmReportInvoice;

implementation

uses Main, DB;
{$R *.dfm}

{ TForm1 }

constructor TfrmReportInvoice.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  TInvoice := TfrmMain.GetTableInvoice;
  TInvoice.Locate('ID', ID, []);

  TInvoiceDetail := TfrmMain.GetTableInvoiceDetail;
  TInvoiceDetail.Filtered := True;
  TInvoiceDetail.Filter := 'FactuurId =' +IntToStr(ID);

  TEigen := TfrmMain.GetTableEigen;
  TEigen.First;

  TCustomer := TfrmMain.GetTableCustomer;
  TCustomer.Locate('ID', TInvoice.FieldByName('KlantId').AsInteger , []);

  TWeekReport := TfrmMain.GetTableWeekReport;
  TWeekReport.Locate('ID', TInvoice.FieldByName('WeekId').AsInteger , []);

  ppMain.RecordCount := 1;
  ppCustomer.RecordCount := 1;
  ppEigen.RecordCount := 1;
  ppDetail.RecordCount := TInvoiceDetail.RecordCount;
  repReport.PrintToDevices;
end;

function TfrmReportInvoice.ppMainGetFieldValue(aFieldName: string): Variant;
begin
  if aFieldName = 'Btw' then begin
    if TInvoice.FieldByName(aFieldName).AsBoolean then
      Result := '        21 %'
    else begin
      ppDBText5.Font.Style := [fsBold];
      Result := 'Btw verlegd';
    end
  end
  else
    Result := TInvoice.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportInvoice.ppDetailGetFieldValue(aFieldName: String): Variant;
begin
  TInvoiceDetail.RecNo := ppDetail.RecordIndex + 1;
  if aFieldName = 'Omschrijving' then begin
    if TInvoiceDetail.FieldByName('overwerk').AsBoolean then
      Result := Trim(TInvoiceDetail.FieldByName('nummers').AsVariant
      + ' ' + FloatToStr(TInvoiceDetail.FieldByName('overwerkpercentage').AsFloat + 100 )
      + '% '+TInvoiceDetail.FieldByName('overwerks').AsVariant + ' '+TInvoiceDetail.FieldByName(aFieldName).AsVariant)
    else
      Result := Trim(TInvoiceDetail.FieldByName('nummers').AsVariant
      + ' '+TInvoiceDetail.FieldByName('overwerks').AsVariant + ' '+TInvoiceDetail.FieldByName(aFieldName).AsVariant);
  end
  else
    Result := TInvoiceDetail.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportInvoice.ppCustomerGetFieldValue(aFieldName: String): Variant;
begin
  Result := TCustomer.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportInvoice.ppEigenGetFieldValue(aFieldName: String): Variant;
begin
  if  aFieldName = 'Emailadres' then begin
    if not(TEigen.FieldByName(aFieldName).AsString = '') then
      Result := TEigen.FieldByName(aFieldName).AsVariant
    else
      ppLabel57.Visible := False;
  end
  else
    Result := TEigen.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportInvoice.ppWeekGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TWeekReport.FieldByName(aFieldName).AsVariant;
end;

procedure TfrmReportInvoice.btnPrintClick(Sender: TObject);
begin
  if Assigned(ppViewer.Report) then begin
    ppViewer.Report.ShowPrintDialog := True;
    ppViewer.Report.DeviceType := 'Printer';
    ppViewer.Report.Print;
  end;
end;

procedure TfrmReportInvoice.btnWholePageClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsWholePage;
  btnWholePage.Down := True;
end;

procedure TfrmReportInvoice.btnPageWidthClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsPageWidth;
  btnPageWidth.Down := True;
end;

procedure TfrmReportInvoice.btnPage100Click(Sender: TObject);
begin
  ppViewer.ZoomSetting := zs100Percent;
  btnPage100.Down := True;
end;

procedure TfrmReportInvoice.btnFirstPageClick(Sender: TObject);
begin
  ppViewer.FirstPage;
end;

procedure TfrmReportInvoice.btnPriorPageClick(Sender: TObject);
begin
  ppViewer.PriorPage;
end;

procedure TfrmReportInvoice.btnNextPageClick(Sender: TObject);
begin
  ppViewer.NextPage;
end;

procedure TfrmReportInvoice.btnLastPageClick(Sender: TObject);
begin
  ppViewer.LastPage;
end;

procedure TfrmReportInvoice.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;


end.
