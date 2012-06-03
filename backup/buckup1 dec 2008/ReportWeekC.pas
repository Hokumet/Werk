unit ReportWeekC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpRenderPrinter, RpRender, RpRenderCanvas, RpRenderPreview, RpConDS,
  RpCon, RpBase, RpSystem, RpDefine,  ppRelatv, ppProd, ppClass,
  ppReport, ppFormWrapper, ppRptExp, ppComm, ppEndUsr, ExtCtrls, ppViewr, ppTypes,
  ppPrnabl, ppCtrls, ppBands, ppCache, ppDB, ppDBJIT, ComCtrls, ToolWin, ImgList,
  ppParameter, ADODB, ppStrtch, ppSubRpt, ppModule, raCodMod, ppVar;

type
  TfrmReportWeekC = class(TForm)
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
    ppShape12: TppShape;
    ppShape11: TppShape;
    lblTitel: TppLabel;
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
    ppShape15: TppShape;
    ppDBText3: TppDBText;
    ppCustomer: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppShape23: TppShape;
    ppShape22: TppShape;
    ppShape24: TppShape;
    ppDBText13: TppDBText;
    ppDetailppField11: TppField;
    ppDetailppField12: TppField;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    raCodeModule2: TraCodeModule;
    ppLabel7: TppLabel;
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
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
  private
    TWeekReport, TWeekDetail, TEmployee, TCustomer, TInvoice: TADOTable;
    TQuery, TQ2: TADOQuery;
    Totmoney: Double;
    TotUren: Double;
  public
    constructor Create(Owner: TComponent; ID: Integer; CustomerId: Integer); reintroduce;
  end;

var
  frmReportWeekC: TfrmReportWeekC;

implementation

uses Main, DB;

{$R *.dfm}

constructor TfrmReportWeekC.Create(Owner: TComponent; ID: Integer; CustomerId: Integer);
begin
  inherited Create(Owner);
  TWeekReport := TfrmMain.GetTableWeekReport;
  TWeekReport.Locate('ID', ID, []);

//  TInvoice := TfrmMain.GetTableInvoice;
//  TInvoice.Locate('ID', TWeekReport.FieldByName('FactuurID').AsInteger, []);

  TWeekDetail := TfrmMain.GetTableWeekDetail;
  TWeekDetail.Filtered := True;
  TWeekDetail.Filter := 'WeekRapportId=' + IntToStr(ID);

  TQuery := TfrmMain.GetTableQuery;
  TQuery.SQL.Text := 'SELECT Werknemers.Voornaam AS VoorNaam, Werknemers.Achternaam AS Achternaam, '+
    'Werknemers.Sofinummer AS Sofinummer, Klanten.Naam as Naam, Klanten.Id, Werknemers.UurLoon AS UurLoon, '+
    'Sum(WeekDetails.Maandag) AS Maandag, Sum(WeekDetails.Dinsdag) AS Dinsdag, Sum(WeekDetails.Woensdag)'+
    ' AS Woensdag, Sum(WeekDetails.Donderdag) AS Donderdag, Sum(WeekDetails.Vrijdag) AS Vrijdag, '+
    'Sum(WeekDetails.Zaterdag) AS Zaterdag, Sum(WeekDetails.Zondag) AS Zondag, '+
    'Sum(WeekDetails.SalarisTotaal) AS SalarisTotaal, Sum(WeekDetails.UurTotaal) AS UurTotaal '+
    'FROM Weekrapporten INNER JOIN (Klanten INNER JOIN (Werknemers INNER JOIN WeekDetails '+
    'ON Werknemers.Id = WeekDetails.WerknemerID) ON Klanten.Id = WeekDetails.KlantID) '+
    'ON Weekrapporten.Id = WeekDetails.WeekrapportID WHERE (((Weekrapporten.Id)='+ IntToStr(ID)+') AND ((Klanten.Id)='+ IntToStr(CustomerId)+')) '+
    'GROUP BY Werknemers.Voornaam, Werknemers.Achternaam, Werknemers.Sofinummer, Klanten.Naam, Klanten.Id, Werknemers.UurLoon;';

  TQuery.ExecSQL;
  TQuery.Open;
  TQuery.First;
  lblTitel.Text := 'WEEK RAPPORT VOOR ' + TQuery.fieldByname('Naam').AsString;

  TQ2 := frmMain.GetTableQuery2;
  TQ2.SQL.Text := 'SELECT Sum(WeekDetails.UurTotaal) AS Totaaluur '+
    'FROM Weekrapporten INNER JOIN (Klanten INNER JOIN (Werknemers INNER JOIN WeekDetails '+
    'ON Werknemers.Id = WeekDetails.WerknemerID) ON Klanten.Id = WeekDetails.KlantID) ON '+
    'Weekrapporten.Id = WeekDetails.WeekrapportID GROUP BY Weekrapporten.Id, Klanten.Id '+
    'HAVING (((Weekrapporten.Id)='+ IntToStr(ID)+') AND ((Klanten.Id)='+ IntToStr(CustomerId)+'))';
  TQ2.ExecSQL;
  TQ2.Open;
  TQ2.First;

  TEmployee := TfrmMain.GetTableEmployee;

  TCustomer := TfrmMain.GetTableCustomer;

  ppMain.RecordCount := 1;
//  ppDetail.RecordCount := TWeekDetail.RecordCount;
  ppDetail.RecordCount := TQuery.RecordCount;
  repReport.PrintToDevices;
end;


function TfrmReportWeekC.ppMainGetFieldValue(aFieldName: String): Variant;
begin
  if aFieldName = 'Totaaluren' then
    Result := TQ2.FieldByname('Totaaluur').AsVariant
  else
    Result := TWeekReport.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekC.ppDetailGetFieldValue(aFieldName: String): Variant;
begin
  TWeekDetail.RecNo := ppDetail.RecordIndex + 1;
  TQuery.RecNo := ppDetail.RecordIndex + 1;

  if aFieldName = 'WerknemerID' then
    Result := TQuery.FieldByName('Voornaam').AsString + ' '+  TQuery.FieldByName('Achternaam').AsString 
  else if aFieldName = 'TotaalSalaris' then begin
    TotUren := TotUren + TQuery.FieldByName(aFieldName).AsFloat;
    Result := TQuery.FieldByName(aFieldName).AsFloat;
  end
  else if aFieldName = 'TotaalSalaris' then begin
      Totmoney := Totmoney +  TQuery.FieldByName(aFieldName).AsFloat;
      Result := TQuery.FieldByName(aFieldName).AsVariant;
    end
    else
      Result := TQuery.FieldByName(aFieldName).AsVariant;
end;


function TfrmReportWeekC.ppInvoiceGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TInvoice.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekC.ppCustomerGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TCustomer.FieldByName(aFieldName).AsVariant;
end;

procedure TfrmReportWeekC.btnPrintClick(Sender: TObject);
begin
  if Assigned(ppViewer.Report) then begin
    ppViewer.Report.ShowPrintDialog := True;
    ppViewer.Report.DeviceType := 'Printer';
    ppViewer.Report.Print;
  end;
end;

procedure TfrmReportWeekC.btnWholePageClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsWholePage;
  btnWholePage.Down := True;
end;

procedure TfrmReportWeekC.btnPageWidthClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsPageWidth;
  btnPageWidth.Down := True;
end;

procedure TfrmReportWeekC.btnPage100Click(Sender: TObject);
begin
  ppViewer.ZoomSetting := zs100Percent;
  btnPage100.Down := True;
end;

procedure TfrmReportWeekC.btnFirstPageClick(Sender: TObject);
begin
  ppViewer.FirstPage;
end;

procedure TfrmReportWeekC.btnPriorPageClick(Sender: TObject);
begin
  ppViewer.PriorPage;
end;

procedure TfrmReportWeekC.btnNextPageClick(Sender: TObject);
begin
  ppViewer.NextPage;
end;

procedure TfrmReportWeekC.btnLastPageClick(Sender: TObject);
begin
  ppViewer.LastPage;
end;

procedure TfrmReportWeekC.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmReportWeekC.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
var I: Integer;
begin
  TQuery.First;
  for I := 0 to TQuery.RecordCount -1 do begin

    Value := Value + TQuery.FieldByName('Salaristotaal').AsCurrency;
    TQuery.Next;
  end;
end;             
end.
