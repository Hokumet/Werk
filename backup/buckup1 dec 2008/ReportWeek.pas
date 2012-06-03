unit ReportWeek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpRenderPrinter, RpRender, RpRenderCanvas, RpRenderPreview, RpConDS,
  RpCon, RpBase, RpSystem, RpDefine,  ppRelatv, ppProd, ppClass,
  ppReport, ppFormWrapper, ppRptExp, ppComm, ppEndUsr, ExtCtrls, ppViewr, ppTypes,
  ppPrnabl, ppCtrls, ppBands, ppCache, ppDB, ppDBJIT, ComCtrls, ToolWin, ImgList,
  ppParameter, ADODB, ppStrtch, ppSubRpt;

type
  TfrmReportWeek = class(TForm)
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
    ImageList: TImageList;
    repReport: TppReport;
    ppDetailBand1: TppDetailBand;
    ppShape14: TppShape;
    ppShape17: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppShape16: TppShape;
    ppShape12: TppShape;
    ppShape11: TppShape;
    ppLabel9: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppMain: TppJITPipeline;
    ppMainppField1: TppField;
    ppMainppField2: TppField;
    ppMainppField3: TppField;
    ppMainppField4: TppField;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLine4: TppLine;
    ppDetail: TppJITPipeline;
    ppDetailppField1: TppField;
    ppDetailppField2: TppField;
    ppDetailppField3: TppField;
    ppDetailppField4: TppField;
    ppDetailppField5: TppField;
    ppDetailppField6: TppField;
    ppDetailppField7: TppField;
    ppDetailppField8: TppField;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppShape5: TppShape;
    ppShape18: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape13: TppShape;
    ppShape19: TppShape;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppInvoice: TppJITPipeline;
    ppInvoiceppField1: TppField;
    ppInvoiceppField2: TppField;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppMainppField5: TppField;
    ppDBText2: TppDBText;
    ppLabel10: TppLabel;
    ppDetailppField9: TppField;
    ppDetailppField10: TppField;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppShape15: TppShape;
    ppDBText3: TppDBText;
    ppCustomer: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppShape22: TppShape;
    ppDBText13: TppDBText;
    ppShape23: TppShape;
    ppLabel7: TppLabel;
    ppShape24: TppShape;
    ppDBText16: TppDBText;
    ppDetailppField11: TppField;
    function ppMainGetFieldValue(aFieldName: String): Variant;
    function ppDetailGetFieldValue(aFieldName: String): Variant;
    procedure btnPrintClick(Sender: TObject);
    procedure btnWholePageClick(Sender: TObject);
    procedure btnPageWidthClick(Sender: TObject);
    procedure btnPage100Click(Sender: TObject);
    procedure btnFirstPageClick(Sender: TObject);
    procedure btnPriorPageClick(Sender: TObject);
    procedure btnNextPageClick(Sender: TObject);
    procedure btnLastPageClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    function ppInvoiceGetFieldValue(aFieldName: String): Variant;
    function ppCustomerGetFieldValue(aFieldName: String): Variant;
  private
    TWeekReport, TWeekDetail, TEmployee, TCustomer, TInvoice: TADOTable;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmReportWeek: TfrmReportWeek;

implementation

uses Main, DB;

{$R *.dfm}

constructor TfrmReportWeek.Create(Owner: TComponent; ID: Integer);
begin
  inherited Create(Owner);
  TWeekReport := TfrmMain.GetTableWeekReport;
  TWeekReport.Locate('ID', ID, []);

//  TInvoice := TfrmMain.GetTableInvoice;
//  TInvoice.Locate('ID', TWeekReport.FieldByName('FactuurID').AsInteger, []);

  TWeekDetail := TfrmMain.GetTableWeekDetail;
  TWeekDetail.Filtered := True;
  TWeekDetail.Filter := 'WeekRapportId=' + IntToStr(ID);
                                       
  TEmployee := TfrmMain.GetTableEmployee;

  TCustomer := TfrmMain.GetTableCustomer;
  
  ppMain.RecordCount := 1;
  ppDetail.RecordCount := TWeekDetail.RecordCount;
  repReport.PrintToDevices;
end;


function TfrmReportWeek.ppMainGetFieldValue(aFieldName: String): Variant;
begin
  Result := TWeekReport.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeek.ppDetailGetFieldValue(aFieldName: String): Variant;
var WerknemerID: Integer;
begin
  TWeekDetail.RecNo := ppDetail.RecordIndex + 1;
  if aFieldName = 'WerknemerID' then begin
     TEmployee.Locate('ID', TWeekDetail.FieldByName(aFieldName).AsInteger, [] );
     WerknemerID := TWeekDetail.FieldByName(aFieldName).AsInteger;
     TCustomer.Locate('ID', TWeekDetail.FieldByName('KlantID').AsInteger, []);
     Result := TEmployee.FieldByName('Voornaam').AsString + ' '+  TEmployee.FieldByName('Achternaam').AsString;
  end
  else if aFieldName = 'Uurloon' then begin
     TEmployee.Locate('ID', WerknemerID, [] );
     Result := TEmployee.FieldByName('Uurloon').AsString;
  end
  else
    Result := TWeekDetail.FieldByName(aFieldName).AsVariant;
end;


function TfrmReportWeek.ppInvoiceGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TInvoice.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeek.ppCustomerGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TCustomer.FieldByName(aFieldName).AsVariant;
end;

procedure TfrmReportWeek.btnPrintClick(Sender: TObject);
begin
  if Assigned(ppViewer.Report) then begin
    ppViewer.Report.ShowPrintDialog := True;
    ppViewer.Report.DeviceType := 'Printer';
    ppViewer.Report.Print;
  end;
end;

procedure TfrmReportWeek.btnWholePageClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsWholePage;
  btnWholePage.Down := True;
end;

procedure TfrmReportWeek.btnPageWidthClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsPageWidth;
  btnPageWidth.Down := True;
end;

procedure TfrmReportWeek.btnPage100Click(Sender: TObject);
begin
  ppViewer.ZoomSetting := zs100Percent;
  btnPage100.Down := True;
end;

procedure TfrmReportWeek.btnFirstPageClick(Sender: TObject);
begin
  ppViewer.FirstPage;
end;

procedure TfrmReportWeek.btnPriorPageClick(Sender: TObject);
begin
  ppViewer.PriorPage;
end;

procedure TfrmReportWeek.btnNextPageClick(Sender: TObject);
begin
  ppViewer.NextPage;
end;

procedure TfrmReportWeek.btnLastPageClick(Sender: TObject);
begin
  ppViewer.LastPage;
end;

procedure TfrmReportWeek.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

end.
