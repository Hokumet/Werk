unit ReportWeekB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpRenderPrinter, RpRender, RpRenderCanvas, RpRenderPreview, RpConDS,
  RpCon, RpBase, RpSystem, RpDefine,  ppRelatv, ppProd, ppClass,
  ppReport, ppFormWrapper, ppRptExp, ppComm, ppEndUsr, ExtCtrls, ppViewr, ppTypes,
  ppPrnabl, ppCtrls, ppBands, ppCache, ppDB, ppDBJIT, ComCtrls, ToolWin, ImgList,
  ppParameter, ADODB, ppStrtch, ppSubRpt, ppModule, raCodMod, ppVar;

type
  TfrmReportWeekB = class(TForm)
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
    ppShape15: TppShape;
    ppDBText3: TppDBText;
    ppCustomer: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppShape23: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape22: TppShape;
    ppShape24: TppShape;
    ppDBText13: TppDBText;
    ppDetailppField11: TppField;
    ppDetailppField12: TppField;
    ppDBText16: TppDBText;
    raCodeModule1: TraCodeModule;
    ppParameterList1: TppParameterList;
    raCodeModule2: TraCodeModule;
    ppVariable1: TppVariable;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDetailppField13: TppField;
    ppDetailppField14: TppField;
    ppDetailppField15: TppField;
    ppDetailppField16: TppField;
    ppDetailppField17: TppField;
    ppDetailppField18: TppField;
    ppDetailppField19: TppField;
    ppDetailppField20: TppField;
    ppDetailppField21: TppField;
    ppDetailppField22: TppField;
    ppDetailppField23: TppField;
    ppDetailppField24: TppField;
    ppDetailppField25: TppField;
    ppDetailppField26: TppField;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
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
    TQuery: TADOQuery;
    Totmoney: Double;
  public
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmReportWeekB: TfrmReportWeekB;

implementation

uses Main, DB;

{$R *.dfm}

constructor TfrmReportWeekB.Create(Owner: TComponent; ID: Integer);
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
  TQuery.SQL.Text := 'SELECT Werknemers.Voornaam as VoorNaam, Werknemers.Achternaam as Achternaam, Werknemers.UurLoon as UurLoon, Sum(WeekDetails.Maandag) AS Maandag,'+
' Sum(WeekDetails.Dinsdag)  AS Dinsdag, Sum(WeekDetails.Woensdag) AS Woensdag, Sum(WeekDetails.Donderdag) AS Donderdag, Sum(WeekDetails.Vrijdag) AS Vrijdag,'+
' Sum(WeekDetails.Zaterdag) AS Zaterdag, Sum(WeekDetails.Zondag) AS Zondag, Sum(WeekDetails.SalarisTotaal) AS SalarisTotaal, Sum(WeekDetails.UurTotaal) AS UurTotaal,' +

' Sum(WeekDetails.MaandagT)  AS MaandagT,'+
' Sum(WeekDetails.DinsdagT)  AS DinsdagT, Sum(WeekDetails.WoensdagT) AS WoensdagT,'+
' Sum(WeekDetails.DonderdagT) AS DonderdagT, Sum(WeekDetails.VrijdagT) AS VrijdagT,'+
' Sum(WeekDetails.ZaterdagT) AS ZaterdagT, Sum(WeekDetails.ZondagT) AS ZondagT ,' +

' Sum(WeekDetails.MaandagTu)  AS MaandagTu,'+
' Sum(WeekDetails.DinsdagTu)  AS DinsdagTu, Sum(WeekDetails.WoensdagTu) AS WoensdagTu,'+
' Sum(WeekDetails.DonderdagTu) AS DonderdagTu, Sum(WeekDetails.VrijdagTu) AS VrijdagTu,'+
' Sum(WeekDetails.ZaterdagTu) AS ZaterdagTu, Sum(WeekDetails.ZondagTu) AS ZondagTu, ' +

' Max(WeekDetails.MaandagVZ)  AS MaandagVZ,'+
' Max(WeekDetails.DinsdagVZ)  AS DinsdagVZ, Max(WeekDetails.WoensdagVZ) AS WoensdagVZ,'+
' Max(WeekDetails.DonderdagVZ) AS DonderdagVZ, Max(WeekDetails.VrijdagVZ) AS VrijdagVZ,'+
' Max(WeekDetails.ZaterdagVZ) AS ZaterdagVZ, Max(WeekDetails.ZondagVZ) AS ZondagVZ ' +

' FROM Weekrapporten INNER JOIN (Werknemers INNER JOIN WeekDetails ON Werknemers.Id = WeekDetails.WerknemerID) ON Weekrapporten.Id = WeekDetails.WeekrapportID'+
' WHERE (((Weekrapporten.Id)='+ IntToStr(ID) +'))'+
' GROUP BY Werknemers.Voornaam, Werknemers.Achternaam, Werknemers.UurLoon, Weekrapporten.Id;';
  TQuery.ExecSQL;
  TQuery.Open;

  TEmployee := TfrmMain.GetTableEmployee;

  TCustomer := TfrmMain.GetTableCustomer;
  
  ppMain.RecordCount := 1;
//  ppDetail.RecordCount := TWeekDetail.RecordCount;
  ppDetail.RecordCount := TQuery.RecordCount;
  repReport.PrintToDevices;
end;


function TfrmReportWeekB.ppMainGetFieldValue(aFieldName: String): Variant;
begin
  Result := TWeekReport.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekB.ppDetailGetFieldValue(aFieldName: String): Variant;
begin
  TWeekDetail.RecNo := ppDetail.RecordIndex + 1;
  TQuery.RecNo := ppDetail.RecordIndex + 1;

  if aFieldName = 'WerknemerID' then
    Result := TQuery.FieldByName('Voornaam').AsString + ' '+  TQuery.FieldByName('Achternaam').AsString
  else
    if aFieldName = 'TotaalSalaris' then begin
      Totmoney := Totmoney +  TQuery.FieldByName(aFieldName).AsFloat;
      Result := TQuery.FieldByName(aFieldName).AsVariant;
    end
    else if (aFieldName = 'Maandag') or
          (aFieldName = 'Dinsdag')or
          (aFieldName = 'Woensdag')or
          (aFieldName = 'Donderdag')or
          (aFieldName = 'Vrijdag')or
          (aFieldName = 'Zaterdag')or
          (aFieldName = 'Zondag') then begin
      if TQuery.FieldByName(aFieldName+'VZ').AsInteger > 0 then begin
        if TQuery.FieldByName(aFieldName+'VZ').AsInteger = 1 then
          Result := 'F ' + TQuery.FieldByName(aFieldName).AsString;
        if TQuery.FieldByName(aFieldName+'VZ').AsInteger = 2 then
          Result := 'A ' + TQuery.FieldByName(aFieldName).AsString;
        if TQuery.FieldByName(aFieldName+'VZ').AsInteger = 3 then
          Result := 'V ' + TQuery.FieldByName(aFieldName).AsString;
        if TQuery.FieldByName(aFieldName+'VZ').AsInteger = 4 then
          Result := 'Z ' + TQuery.FieldByName(aFieldName).AsString;
      end
      else
        Result := TQuery.FieldByName(aFieldName).AsString;
    end
    else
      Result := TQuery.FieldByName(aFieldName).AsVariant;
end;


function TfrmReportWeekB.ppInvoiceGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TInvoice.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekB.ppCustomerGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TCustomer.FieldByName(aFieldName).AsVariant;
end;

procedure TfrmReportWeekB.btnPrintClick(Sender: TObject);
begin
  if Assigned(ppViewer.Report) then begin
    ppViewer.Report.ShowPrintDialog := True;
    ppViewer.Report.DeviceType := 'Printer';
    ppViewer.Report.Print;
  end;
end;

procedure TfrmReportWeekB.btnWholePageClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsWholePage;
  btnWholePage.Down := True;
end;

procedure TfrmReportWeekB.btnPageWidthClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsPageWidth;
  btnPageWidth.Down := True;
end;

procedure TfrmReportWeekB.btnPage100Click(Sender: TObject);
begin
  ppViewer.ZoomSetting := zs100Percent;
  btnPage100.Down := True;
end;

procedure TfrmReportWeekB.btnFirstPageClick(Sender: TObject);
begin
  ppViewer.FirstPage;
end;

procedure TfrmReportWeekB.btnPriorPageClick(Sender: TObject);
begin
  ppViewer.PriorPage;
end;

procedure TfrmReportWeekB.btnNextPageClick(Sender: TObject);
begin
  ppViewer.NextPage;
end;

procedure TfrmReportWeekB.btnLastPageClick(Sender: TObject);
begin
  ppViewer.LastPage;
end;

procedure TfrmReportWeekB.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmReportWeekB.ppVariable1Calc(Sender: TObject;
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
