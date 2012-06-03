unit ReportWeekd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpRenderPrinter, RpRender, RpRenderCanvas, RpRenderPreview, RpConDS,
  RpCon, RpBase, RpSystem, RpDefine,  ppRelatv, ppProd, ppClass,
  ppReport, ppFormWrapper, ppRptExp, ppComm, ppEndUsr, ExtCtrls, ppViewr, ppTypes,
  ppPrnabl, ppCtrls, ppBands, ppCache, ppDB, ppDBJIT, ComCtrls, ToolWin, ImgList,
  ppParameter, ADODB, ppStrtch, ppSubRpt, ppModule, raCodMod, ppVar;

type
  TfrmReportWeekd = class(TForm)
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
    ppMain: TppJITPipeline;
    ppMainppField1: TppField;
    ppMainppField2: TppField;
    ppDetail: TppJITPipeline;
    ppDetailppField1: TppField;
    ppDetailppField2: TppField;
    ppDetailppField3: TppField;
    ppDetailppField4: TppField;
    ppDetailppField5: TppField;
    ppDetailppField6: TppField;
    ppDetailppField7: TppField;
    ppDetailppField8: TppField;
    ppInvoice: TppJITPipeline;
    ppInvoiceppField1: TppField;
    ppInvoiceppField2: TppField;
    ppMainppField5: TppField;
    ppDetailppField9: TppField;
    ppDetailppField10: TppField;
    ppCustomer: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppDetailppField11: TppField;
    ppDetailppField12: TppField;
    ppParameterList1: TppParameterList;
    ppEigen: TppJITPipeline;
    ppBtwppField1: TppField;
    ppEigenppField2: TppField;
    ppEigenppField3: TppField;
    ppEigenppField4: TppField;
    ppEigenppField8: TppField;
    ppEigenppField5: TppField;
    ppEigenppField6: TppField;
    ppEigenppField7: TppField;
    ppEigenppField1: TppField;
    ppBtwppField2: TppField;
    ppEigenppField9: TppField;
    ppEigenppField10: TppField;
    ppDetailBand1: TppDetailBand;
    ppShape17: TppShape;
    ppShape3: TppShape;
    ppLabel1: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDetailBand2: TppDetailBand;
    ppShape15: TppShape;
    ppShape8: TppShape;
    ppShape12: TppShape;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText3: TppDBText;
    ppShape22: TppShape;
    ppDBText13: TppDBText;
    raCodeModule2: TraCodeModule;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppLabel11: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText20: TppDBText;
    ppLabel9: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText49: TppDBText;
    ppLabel13: TppLabel;
    ppDBText51: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel24: TppLabel;
    ppLabel5: TppLabel;
    ppDetailppField13: TppField;
    ppDetailppField14: TppField;
    ppDBText5: TppDBText;
    ppDBText16: TppDBText;
    ppDetailppField15: TppField;
    ppDBText17: TppDBText;
    ppLabel26: TppLabel;
    ppEigenppField11: TppField;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    weekbegin: TppField;
    ppDBText14: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel3: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape16: TppShape;
    ppShape18: TppShape;
    ppDetailppField16: TppField;
    ppDBText15: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppMainppField3: TppField;
    ppMainppField4: TppField;
    ppMainppField6: TppField;
    ppMainppField7: TppField;
    ppMainppField8: TppField;
    ppMainppField9: TppField;
    ppMainppField10: TppField;
    ppFooterBand1: TppFooterBand;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape26: TppShape;
    ppShape27: TppShape;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLabel39: TppLabel;
    ppLabel25: TppLabel;
    ppDBText18: TppDBText;
    ppLine9: TppLine;
    ppLabel40: TppLabel;
    ppShape28: TppShape;
    ppLabel41: TppLabel;
    ppEigenppField12: TppField;
    ppDBText19: TppDBText;
    ppLabel10: TppLabel;
    ppDBText30: TppDBText;
    ppMainppField11: TppField;
    ppMainppField12: TppField;
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
    function ppEigenGetFieldValue(aFieldName: String): Variant;
  private
    TWeekReport, TWeekDetail, TEmployee, TCustomer, TInvoice, TEigen: TADOTable;
    TQuery, TQ2, TQ3: TADOQuery;
    Totmoney, MaTotal,DiTotal,WoTotal,DoTotal,VrTotal,ZaTotal,ZoTotal :Double;
    TotUren: Double;
    nr: Integer;
  public
    constructor Create(Owner: TComponent; ID: Integer; CustomerId: Integer); reintroduce;
  end;

var
  frmReportWeekd: TfrmReportWeekd;

implementation

uses Main, DB, DateUtils, TypInfo;

{$R *.dfm}

constructor TfrmReportWeekd.Create(Owner: TComponent; ID: Integer; CustomerId: Integer);
var I: Integer;
begin
  inherited Create(Owner);
  TWeekReport := TfrmMain.GetTableWeekReport;
  TWeekReport.Locate('ID', ID, []);

  TEigen := TfrmMain.GetTableEigen;
  TEigen.First;

  nr :=0;
  Totmoney :=0;
  MaTotal :=0;
  MaTotal :=0;
  WoTotal :=0;
  DoTotal :=0;
  VrTotal :=0;
  ZaTotal :=0;
  ZoTotal :=0;

  TWeekDetail := TfrmMain.GetTableWeekDetail;
  TWeekDetail.Filtered := True;
  TWeekDetail.Filter := 'WeekRapportId=' + IntToStr(ID);

  TQuery := TfrmMain.GetTableQuery;
  TQuery.SQL.Text := 'SELECT Werknemers.Voornaam AS VoorNaam, Werknemers.Achternaam AS Achternaam, '+
    'Werknemers.Adres AS adres, Werknemers.Plaats as Plaats, Werknemers.Geboortedatum as Geboortedatum, '+
    'Werknemers.Sofinummer AS Sofinummer, Klanten.Naam as Naam, Klanten.Id, Werknemers.UurLoon AS UurLoon, '+

    'Sum(WeekDetails.Maandag) AS Maandag, Sum(WeekDetails.Dinsdag) AS Dinsdag, Sum(WeekDetails.Woensdag)'+
    ' AS Woensdag, Sum(WeekDetails.Donderdag) AS Donderdag, Sum(WeekDetails.Vrijdag) AS Vrijdag, '+
    'Sum(WeekDetails.Zaterdag) AS Zaterdag, Sum(WeekDetails.Zondag) AS Zondag, '+

    ' Max(WeekDetails.MaandagVZ)  AS MaandagVZ,'+
    ' Max(WeekDetails.DinsdagVZ)  AS DinsdagVZ, Max(WeekDetails.WoensdagVZ) AS WoensdagVZ,'+
    ' Max(WeekDetails.DonderdagVZ) AS DonderdagVZ, Max(WeekDetails.VrijdagVZ) AS VrijdagVZ,'+
    ' Max(WeekDetails.ZaterdagVZ) AS ZaterdagVZ, Max(WeekDetails.ZondagVZ) AS ZondagVZ, ' +

    'Sum(WeekDetails.SalarisTotaal) AS SalarisTotaal, Sum(WeekDetails.UurTotaal) AS UurTotaal '+


    'FROM Weekrapporten INNER JOIN (Klanten INNER JOIN (Werknemers INNER JOIN WeekDetails '+
    'ON Werknemers.Id = WeekDetails.WerknemerID) ON Klanten.Id = WeekDetails.KlantID) '+
    'ON Weekrapporten.Id = WeekDetails.WeekrapportID WHERE (((Weekrapporten.Id)='+ IntToStr(ID)+') AND ((Klanten.Id)='+ IntToStr(CustomerId)+')) '+
    'GROUP BY Werknemers.Voornaam, Werknemers.Achternaam, Werknemers.Adres, Werknemers.Plaats, Werknemers.Geboortedatum, Werknemers.Sofinummer, Klanten.Naam, Klanten.Id, Werknemers.UurLoon;';

  TQuery.ExecSQL;
  TQuery.Open;
  TQuery.First;



  for I := 0 to TQuery.RecordCount -1 do begin
      if (TQuery.FieldByName('MaandagVZ').AsInteger = 1) or (TQuery.FieldByName('MaandagVZ').AsInteger = 2) then
         MaTotal :=  MaTotal + 0
      else
         MaTotal := MaTotal + TQuery.FieldByName('Maandag').AsFloat;
      if (TQuery.FieldByName('DinsdagVZ').AsInteger = 1) or (TQuery.FieldByName('DinsdagVZ').AsInteger = 2) then
         DiTotal :=  DiTotal + 0
      else
         DiTotal := DiTotal + TQuery.FieldByName('Dinsdag').AsFloat;
      if (TQuery.FieldByName('WoensdagVZ').AsInteger = 1) or (TQuery.FieldByName('WoensdagVZ').AsInteger = 2) then
         WoTotal :=  WoTotal + 0
      else
         WoTotal := WoTotal + TQuery.FieldByName('Woensdag').AsFloat;
      if (TQuery.FieldByName('DonderdagVZ').AsInteger = 1) or (TQuery.FieldByName('DonderdagVZ').AsInteger = 2) then
         DoTotal :=  DoTotal + 0
      else
         DoTotal := DoTotal + TQuery.FieldByName('Donderdag').AsFloat;
      if (TQuery.FieldByName('VrijdagVZ').AsInteger = 1) or (TQuery.FieldByName('VrijdagVZ').AsInteger = 2) then
         VrTotal :=  VrTotal + 0
      else
         VrTotal := VrTotal + TQuery.FieldByName('Vrijdag').AsFloat;
      if (TQuery.FieldByName('ZaterdagVZ').AsInteger = 1) or (TQuery.FieldByName('ZaterdagVZ').AsInteger = 2) then
         ZaTotal :=  ZaTotal + 0
      else
         ZaTotal := ZaTotal + TQuery.FieldByName('Zaterdag').AsFloat;
      if (TQuery.FieldByName('ZondagVZ').AsInteger = 1) or (TQuery.FieldByName('ZondagVZ').AsInteger = 2) then
         ZoTotal :=  ZoTotal + 0
      else
         ZoTotal := ZoTotal + TQuery.FieldByName('Zondag').AsFloat;

{      MaTotal := MaTotal + TQuery.FieldByName('Maandag').AsFloat;
      DiTotal := DiTotal + TQuery.FieldByName('Dinsdag').AsFloat;
      WoTotal := WoTotal + TQuery.FieldByName('Woensdag').AsFloat;
      DoTotal := DoTotal + TQuery.FieldByName('Donderdag').AsFloat;
      VrTotal := VrTotal + TQuery.FieldByName('Vrijdag').AsFloat;
      ZaTotal := ZaTotal + TQuery.FieldByName('Zaterdag').AsFloat;
      ZoTotal := ZoTotal + TQuery.FieldByName('Zondag').AsFloat;}
      Totmoney := Totmoney +  TQuery.FieldByName('UurTotaal').AsFloat;
      TQuery.Next;
  end;              
  TQuery.First;

  TQ2 := frmMain.GetTableQuery2;
  TQ2.SQL.Text := 'SELECT Sum(WeekDetails.UurTotaal) AS Totaaluur '+
    'FROM Weekrapporten INNER JOIN (Klanten INNER JOIN (Werknemers INNER JOIN WeekDetails '+
    'ON Werknemers.Id = WeekDetails.WerknemerID) ON Klanten.Id = WeekDetails.KlantID) ON '+
    'Weekrapporten.Id = WeekDetails.WeekrapportID GROUP BY Weekrapporten.Id, Klanten.Id '+
    'HAVING (((Weekrapporten.Id)='+ IntToStr(ID)+') AND ((Klanten.Id)='+ IntToStr(CustomerId)+'))';
  TQ2.ExecSQL;
  TQ2.Open;
  TQ2.First;

  TQ3 := TfrmMain.GetTableQuery3;
  TQ3.SQL.Text :='SELECT Facturen.Factuurnr AS Factuurnr '+
    'FROM Klanten INNER JOIN (Weekrapporten INNER JOIN Facturen ON Weekrapporten.Id = Facturen.WeekId) ON Klanten.Id = Facturen.KlantId '+
    'WHERE (((Weekrapporten.Id)=34) AND ((Klanten.Id)=1))';    
  TQ3.Open;
  TQ3.First;

  TEmployee := TfrmMain.GetTableEmployee;

  TCustomer := TfrmMain.GetTableCustomer;

  ppMain.RecordCount := 1;
  if TWeekDetail.RecordCount > 10 then
    ppDetail.RecordCount := TWeekDetail.RecordCount
  else
    ppDetail.RecordCount := 10;
  repReport.PrintToDevices;
end;


function TfrmReportWeekd.ppMainGetFieldValue(aFieldName: String): Variant;
begin
  if aFieldName = 'Totaaluren' then
    Result := MaTotal + DiTotal + WoTotal + DoTotal + VrTotal + ZaTotal + ZoTotal
  else if aFieldName = 'jaar' then
    Result := IntToStr(YearOf(TWeekReport.FieldByName('weekbegin').AsDateTime))
  else if aFieldName = 'MaTotal' then
    Result := MaTotal
  else if aFieldName = 'DiTotal' then
    Result := DiTotal
  else if aFieldName = 'WoTotal' then
    Result := WoTotal
  else if aFieldName = 'DoTotal' then
    Result := DoTotal
  else if aFieldName = 'VrTotal' then
    Result := VrTotal
  else if aFieldName = 'ZaTotal' then
    Result := ZaTotal
  else if aFieldName = 'ZoTotal' then
    Result := ZoTotal
  else
    Result := TWeekReport.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekd.ppDetailGetFieldValue(aFieldName: String): Variant;
begin
  if ppDetail.RecordIndex >= TQuery.RecordCount then begin
    if aFieldName = 'Nr' then
      Result := ppDetail.RecordIndex + 1;
    exit;
  end;
  TWeekDetail.RecNo := ppDetail.RecordIndex + 1;
  TQuery.RecNo := ppDetail.RecordIndex + 1;

  if aFieldName = 'WerknemerID' then
    Result := TQuery.FieldByName('Voornaam').AsString + ' '+  TQuery.FieldByName('Achternaam').AsString
  {else if aFieldName = 'TotaalSalaris' then begin
    TotUren := TotUren + TQuery.FieldByName(aFieldName).AsFloat;
    Result := TQuery.FieldByName(aFieldName).AsFloat;
  end}
  else if aFieldName = 'Nr' then begin
      Result := ppDetail.RecordIndex + 1;
  end
  else if aFieldName = 'UurTotaal' then begin
      TotUren := 0;
      if (TQuery.FieldByName('MaandagVZ').AsInteger = 1) or (TQuery.FieldByName('MaandagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Maandag').AsFloat;
      if (TQuery.FieldByName('DinsdagVZ').AsInteger = 1) or (TQuery.FieldByName('DinsdagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Dinsdag').AsFloat;
      if (TQuery.FieldByName('WoensdagVZ').AsInteger = 1) or (TQuery.FieldByName('WoensdagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Woensdag').AsFloat;
      if (TQuery.FieldByName('DonderdagVZ').AsInteger = 1) or (TQuery.FieldByName('DonderdagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Donderdag').AsFloat;
      if (TQuery.FieldByName('VrijdagVZ').AsInteger = 1) or (TQuery.FieldByName('VrijdagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Vrijdag').AsFloat;
      if (TQuery.FieldByName('ZaterdagVZ').AsInteger = 1) or (TQuery.FieldByName('ZaterdagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Zaterdag').AsFloat;
      if (TQuery.FieldByName('ZondagVZ').AsInteger = 1) or (TQuery.FieldByName('ZondagVZ').AsInteger = 2) then
         TotUren :=  TotUren + 0
      else
         TotUren := TotUren + TQuery.FieldByName('Zondag').AsFloat;
      Result := TotUren;
  end
  else if (aFieldName = 'Maandag') or
        (aFieldName = 'Dinsdag')or
        (aFieldName = 'Woensdag')or
        (aFieldName = 'Donderdag')or
        (aFieldName = 'Vrijdag')or
        (aFieldName = 'Zaterdag')or
        (aFieldName = 'Zondag') then begin
     if (TQuery.FieldByName(aFieldName+'VZ').AsInteger = 1) or (TQuery.FieldByName(aFieldName+'VZ').AsInteger = 2) then
        Result := 0
     else
        Result := TQuery.FieldByName(aFieldName).AsVariant;
  end
  else
    Result := TQuery.FieldByName(aFieldName).AsVariant;
end;


function TfrmReportWeekd.ppInvoiceGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TInvoice.FieldByName(aFieldName).AsVariant;
end;

function TfrmReportWeekd.ppCustomerGetFieldValue(
  aFieldName: String): Variant;
begin
  Result := TCustomer.FieldByName(aFieldName).AsVariant;
end;

procedure TfrmReportWeekd.btnPrintClick(Sender: TObject);
begin
  if Assigned(ppViewer.Report) then begin
    ppViewer.Report.ShowPrintDialog := True;
    ppViewer.Report.DeviceType := 'Printer';
    ppViewer.Report.Print;
  end;
end;

procedure TfrmReportWeekd.btnWholePageClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsWholePage;
  btnWholePage.Down := True;
end;

procedure TfrmReportWeekd.btnPageWidthClick(Sender: TObject);
begin
  ppViewer.ZoomSetting := zsPageWidth;
  btnPageWidth.Down := True;
end;

procedure TfrmReportWeekd.btnPage100Click(Sender: TObject);
begin
  ppViewer.ZoomSetting := zs100Percent;
  btnPage100.Down := True;
end;

procedure TfrmReportWeekd.btnFirstPageClick(Sender: TObject);
begin
  ppViewer.FirstPage;
end;

procedure TfrmReportWeekd.btnPriorPageClick(Sender: TObject);
begin
  ppViewer.PriorPage;
end;

procedure TfrmReportWeekd.btnNextPageClick(Sender: TObject);
begin
  ppViewer.NextPage;
end;

procedure TfrmReportWeekd.btnLastPageClick(Sender: TObject);
begin
  ppViewer.LastPage;
end;

procedure TfrmReportWeekd.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_ESCAPE) then
    Close;
end;

procedure TfrmReportWeekd.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
var I: Integer;
begin
  TQuery.First;
  for I := 0 to TQuery.RecordCount -1 do begin

    Value := Value + TQuery.FieldByName('Salaristotaal').AsCurrency;
    TQuery.Next;
  end;
end;
function TfrmReportWeekd.ppEigenGetFieldValue(aFieldName: String): Variant;
begin
  if aFieldName = 'factuurnr' then
    Result := TQ3.FieldByName('factuurnr').AsString
  else
    Result := TEigen.FieldByName(aFieldName).AsVariant;
end;

end.
