unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, XPMan, ToolWin, DB, ADODB,
  Menus;

type
  TfrmMain = class(TForm)
    lvwItems: TListView;
    imgMainButtons: TImageList;
    imgPmSmall: TImageList;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    Seperator: TToolButton;
    btnCustomers: TToolButton;
    btnWeekreports: TToolButton;
    XPManifest: TXPManifest;
    btnEmployees: TToolButton;
    btnInvoices: TToolButton;
    DBCConnection: TADOConnection;
    DBTCustomers: TADOTable;
    DBTEmployees: TADOTable;
    DBTInvoices: TADOTable;
    DBTWeekreports: TADOTable;
    DBTInvoiceDetails: TADOTable;
    DBTEigen: TADOTable;
    StatusBar: TStatusBar;
    DBTUsers: TADOTable;
    DBTUsersID: TAutoIncField;
    DBTUsersLoginnaam: TWideStringField;
    DBTUsersWachtwoord: TWideStringField;
    DBTUsersIngelogd: TBooleanField;
    btnClose: TToolButton;
    ToolButton1: TToolButton;
    DBTWeekDetails: TADOTable;
    ppmright: TPopupMenu;
    ppmPrint: TMenuItem;
    btnSettings: TToolButton;
    DBTQuery: TADOQuery;
    DBTQuery2: TADOQuery;
    DBTEmployeesId: TAutoIncField;
    DBTEmployeesSofinummer: TWideStringField;
    DBTEmployeesVoornaam: TWideStringField;
    DBTEmployeesAchternaam: TWideStringField;
    DBTEmployeesAdres: TWideStringField;
    DBTEmployeesPlaats: TWideStringField;
    DBTEmployeesPostcode: TWideStringField;
    DBTEmployeesTelefoonPriv: TWideStringField;
    DBTEmployeesTelefoonWerk: TWideStringField;
    DBTEmployeesGeboortedatum: TDateTimeField;
    DBTEmployeesNotities: TMemoField;
    DBTWeekreportsId: TAutoIncField;
    DBTWeekreportsWeeknr: TIntegerField;
    DBTWeekreportsProje: TWideStringField;
    DBTWeekreportsWeekbegin: TDateTimeField;
    DBTWeekreportsWeekeind: TDateTimeField;
    DBTWeekreportsTotaalSalaris: TBCDField;
    DBTInvoicesId: TAutoIncField;
    DBTInvoicesFactuurnr: TIntegerField;
    DBTInvoicesFactuurdatum: TDateTimeField;
    DBTInvoicesWeekId: TIntegerField;
    DBTInvoicesKlantId: TIntegerField;
    DBTInvoicesBtw: TBooleanField;
    DBTInvoicesSubtotaal: TBCDField;
    DBTInvoicesBtwTotaal: TBCDField;
    DBTInvoicesGrekPercentage: TIntegerField;
    DBTInvoicesZrekPercentage: TIntegerField;
    DBTInvoicesGrekTotaal: TBCDField;
    DBTInvoicesZrekTotaal: TBCDField;
    DBTInvoicesTeBetalen: TBCDField;
    DBTInvoicesBetaald: TBooleanField;
    ppmBoekhouder: TMenuItem;
    DBTEmployeesUurLoon: TBCDField;
    ckbShowDeleted: TCheckBox;
    lblDeleted: TLabel;
    DBTEmployeesVerwijderd: TBooleanField;
    DBTCustomersId: TAutoIncField;
    DBTCustomersNaam: TWideStringField;
    DBTCustomersAdres: TWideStringField;
    DBTCustomersPlaats: TWideStringField;
    DBTCustomersPostbus: TWideStringField;
    DBTCustomersPostcode: TWideStringField;
    DBTCustomersTelefoonnr: TWideStringField;
    DBTCustomersFaxnr: TWideStringField;
    DBTCustomersLand: TWideStringField;
    DBTCustomersNotities: TMemoField;
    DBTCustomersPrijswerk: TBCDField;
    DBTCustomersBtw: TBooleanField;
    DBTCustomersVerwijderd: TBooleanField;
    DBTEigenID: TAutoIncField;
    DBTEigenNaam: TWideStringField;
    DBTEigenAdres: TWideStringField;
    DBTEigenPostcode: TWideStringField;
    DBTEigenPlaats: TWideStringField;
    DBTEigenTelefoonnummer: TWideStringField;
    DBTEigenKvknummer: TWideStringField;
    DBTEigenGrekening: TWideStringField;
    DBTEigenZrekening: TWideStringField;
    DBTEigenBtwnummer: TWideStringField;
    DBTCustomersPeriode: TIntegerField;
    ppmKlant: TMenuItem;
    DBTEmployeesFunctieId: TIntegerField;
    DBTFuncties: TADOTable;
    DBTFunctiesId: TAutoIncField;
    DBTFunctiesFunctie: TWideStringField;
    DBTKlantFuncties: TADOTable;
    DBTKlantFunctiesId: TAutoIncField;
    DBTKlantFunctiesKlantID: TIntegerField;
    DBTKlantFunctiesFunctieID: TIntegerField;
    DBTKlantFunctiesPrijs: TBCDField;
    DBTInvoiceDetailsId: TAutoIncField;
    DBTInvoiceDetailsFactuurid: TIntegerField;
    DBTInvoiceDetailsFunctieId: TIntegerField;
    DBTInvoiceDetailsOmschrijving: TWideStringField;
    DBTInvoiceDetailsUurprijs: TBCDField;
    DBTInvoiceDetailsTotaalbedrag: TBCDField;
    DBTInvoiceDetailsOverwerk: TBooleanField;
    DBTInvoiceDetailsnummers: TWideStringField;
    DBTInvoiceDetailsoverwerks: TWideStringField;
    DBTInvoiceDetailseenmalig: TBooleanField;
    DBTCustomersBtwNr: TWideStringField;
    DBTEigenBankNaam: TWideStringField;
    DBTEigenEmailadres: TWideStringField;
    DBTInvoiceDetailsUren: TFloatField;
    DBTInvoiceDetailsoverwerkpercentage: TFloatField;
    DBTWeekreportsTotaaluren: TFloatField;
    DBTQuery3: TADOQuery;
    DBTEigenLoonbelastingnr: TWideStringField;
    DBTWeekDetailsId: TAutoIncField;
    DBTWeekDetailsKlantID: TIntegerField;
    DBTWeekDetailsWeekrapportID: TIntegerField;
    DBTWeekDetailsWerknemerID: TIntegerField;
    DBTWeekDetailsMaandag: TFloatField;
    DBTWeekDetailsMaandagT: TFloatField;
    DBTWeekDetailsMaandagTu: TFloatField;
    DBTWeekDetailsMaandagT2: TFloatField;
    DBTWeekDetailsMaandagTu2: TFloatField;
    DBTWeekDetailsMaandagVZ: TSmallintField;
    DBTWeekDetailsDinsdag: TFloatField;
    DBTWeekDetailsDinsdagT: TFloatField;
    DBTWeekDetailsDinsdagTu: TFloatField;
    DBTWeekDetailsDinsdagVZ: TSmallintField;
    DBTWeekDetailsDinsdagT2: TFloatField;
    DBTWeekDetailsDinsdagTu2: TFloatField;
    DBTWeekDetailsWoensdag: TFloatField;
    DBTWeekDetailsWoensdagT: TFloatField;
    DBTWeekDetailsWoensdagTu: TFloatField;
    DBTWeekDetailsWoensdagVZ: TSmallintField;
    DBTWeekDetailsWoensdagT2: TFloatField;
    DBTWeekDetailsWoensdagTu2: TFloatField;
    DBTWeekDetailsDonderdag: TFloatField;
    DBTWeekDetailsDonderdagT: TFloatField;
    DBTWeekDetailsDonderdagTu: TFloatField;
    DBTWeekDetailsDonderdagVZ: TSmallintField;
    DBTWeekDetailsDonderdagT2: TFloatField;
    DBTWeekDetailsDonderdagTu2: TFloatField;
    DBTWeekDetailsVrijdag: TFloatField;
    DBTWeekDetailsVrijdagT: TFloatField;
    DBTWeekDetailsVrijdagTu: TFloatField;
    DBTWeekDetailsVrijdagVZ: TSmallintField;
    DBTWeekDetailsVrijdagT2: TFloatField;
    DBTWeekDetailsVrijdagTu2: TFloatField;
    DBTWeekDetailsZaterdag: TFloatField;
    DBTWeekDetailsZaterdagT: TFloatField;
    DBTWeekDetailsZaterdagTu: TFloatField;
    DBTWeekDetailsZaterdagVZ: TSmallintField;
    DBTWeekDetailsZaterdagT2: TFloatField;
    DBTWeekDetailsZaterdagTu2: TFloatField;
    DBTWeekDetailsZondag: TFloatField;
    DBTWeekDetailsZondagT: TFloatField;
    DBTWeekDetailsZondagTu: TFloatField;
    DBTWeekDetailsZondagVZ: TSmallintField;
    DBTWeekDetailsZondagT2: TFloatField;
    DBTWeekDetailsZondagTu2: TFloatField;
    DBTWeekDetailsSalarisTotaal: TBCDField;
    DBTWeekDetailsUurTotaal: TFloatField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnWeekreportsClick(Sender: TObject);
    procedure btnInvoicesClick(Sender: TObject);
    procedure btnEmployeesClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure ppmPrintClick(Sender: TObject);
    procedure ppmrightPopup(Sender: TObject);
    procedure ppmBoekhouderClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure ckbShowDeletedClick(Sender: TObject);
    procedure lblDeletedClick(Sender: TObject);
    procedure ppmKlantClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    ScreenType: String;
    procedure Initialize(var Message: TMessage); message WM_USER;
    procedure SetCustomersHeader;
    procedure SetEmployeesHeader;
    procedure SetInvoicesHeader;
    procedure SetWeekreportsHeader;
//    procedure SetWeekHourListHeader;

    procedure ShowCustomers;
    procedure ShowEmployees;
    procedure ShowInvoices;
    procedure ShowWeekreports;
//    procedure ShowWeekHourLists;
    procedure ShowLateInvoices;

    procedure Refresh;

    function IsthereLateInvoices: Boolean;
  public
    class function GetTableCustomer: TADOTable;
    class function GetTableEmployee: TADOTable;
    class function GetTableInvoice: TADOTable;
    class function GetTableWeekReport: TADOTable;
    class function GetTableInvoiceDetail: TADOTable;
    class function GetTableWeekDetail: TADOTable;
    class function GetTablePassword: TADOTable;
    class function GetTableEigen: TADOTable;
    class function GetTableFuncties: TADOTable;
    class function GetTableKlantFuncties: TADOTable;
    class function GetTableQuery: TADOQuery;
    class function GetTableQuery2: TADOQuery;
    class function GetTableQuery3: TADOQuery;
  end;

var
  frmMain: TfrmMain;

implementation

uses PassWord, EditCustomer, EditEmployee, EditInvoice, EditWeekReport,
  DateUtils, ReportInvoice, EditLateInvoice, Math, //WeekHourList,
  ReportWeek, ReportWeekB, EditSettings, ReportWeekC, ChooseCustomer,
  Contnrs, ReportWeekd;

{$R *.dfm}


procedure TfrmMain.FormCreate(Sender: TObject);
var Strlist: TStringList;
    PathZ: String;
    Filename: String;
begin
    PostMessage(Self.Handle, WM_USER, 0, 0);

  Strlist := TStringList.Create;
  PathZ := ExtractFileDir(Application.ExeName);
  Filename := ExtractFileName(Application.ExeName);
  PathZ := PathZ + '\' + ChangeFileExt(Filename, '.mdb') + ';';
  Strlist.Add('Provider=Microsoft.Jet.OLEDB.4.0;');
  Strlist.Add('Data Source='+ PathZ);
  Strlist.Add('Persist Security Info=False');

  DBCConnection.ConnectionString := Strlist.Text;

  DBTCustomers.Open;
  DBTEmployees.Open;
  DBTInvoices.Open;
  DBTWeekreports.Open;
  DBTInvoiceDetails.Open;
  DBTWeekDetails.Open;
  DBTEigen.Open;
  DBTUsers.Open;
  DBTFuncties.Open;
  DBTKlantFuncties.Open;   
  btnCustomers.Down := True;
  btnCustomers.Click;
end;

procedure TfrmMain.Initialize(var Message: TMessage);
var Bool: Boolean;
begin
  Bool := False;
  PasswordDlg := TPasswordDlg.Create(Self);
  try
    if PasswordDlg.ShowModal = MrOk then begin
      StatusBar.Panels.Items[1].Text := PasswordDlg.TUsers.FieldByName('Loginnaam').AsString;
      Bool := True;
    end;
  finally
    PasswordDlg.Free;
    if not Bool then
      Application.Terminate()
    else
      ShowLateInvoices;
  end;
end;

procedure TfrmMain.lvwItemsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
begin
  if Screentype = 'WeekHourList' then begin
    btnNew.Enabled := False;
    btnEdit.Enabled := Selected;
    btnDelete.Enabled := False;
  end
  else begin           
    btnNew.Enabled := True;
    btnEdit.Enabled := Selected;
    btnDelete.Enabled := Selected;
    if (ScreenType = 'Invoices') or (ScreenType = 'WeekReports') then
      lvwItems.PopupMenu := ppmright
    else
      lvwItems.PopupMenu := nil;
  end;
end;    

procedure TfrmMain.ppmPrintClick(Sender: TObject);
begin
  if ScreenType = 'Invoices' then begin
    frmReportInvoice := TfrmReportInvoice.Create(Self, Integer(lvwItems.Selected.Data));
    try
      frmReportInvoice.ShowModal;
    finally
      frmReportInvoice.Free;
    end;
  end;
  if ScreenType = 'WeekReports' then begin
    frmReportWeek := TfrmReportWeek.Create(Self, Integer(lvwItems.Selected.Data));
    try
      frmReportWeek.ShowModal;
    finally
      frmReportWeek.Free;
    end;
  end;
end;


procedure TfrmMain.ppmBoekhouderClick(Sender: TObject);
begin
  frmReportWeekB := TfrmReportWeekB.Create(Self, Integer(lvwItems.Selected.Data));
  try
    frmReportWeekB.ShowModal;
  finally
    frmReportWeekB.Free;
  end;
end;

procedure TfrmMain.ppmKlantClick(Sender: TObject);
var CustomerId: Integer;
begin
  frmChooseCustomer := TfrmChooseCustomer.Create(Self, Integer(lvwItems.Selected.Data));
  try
    if frmChooseCustomer.ShowModal = mrOk then
      CustomerId := Integer(frmChooseCustomer.cmbCustomers.Items.Objects[frmChooseCustomer.cmbCustomers.ItemIndex])
    else
      Exit;
  finally
    frmChooseCustomer.Free;
  end;

  frmReportWeekd := TfrmReportWeekd.Create(Self, Integer(lvwItems.Selected.Data),CustomerId);
  try
    frmReportWeekd.ShowModal;
  finally
    frmReportWeekd.Free;
  end;
{  frmReportWeekC := TfrmReportWeekC.Create(Self, Integer(lvwItems.Selected.Data),CustomerId);
  try
    frmReportWeekC.ShowModal;
  finally
    frmReportWeekC.Free;
  end;  }
end;

procedure TfrmMain.SetCustomersHeader;
var Column: TListColumn;
begin
  lvwItems.Columns.Clear;
  lvwItems.Columns.BeginUpdate;

  Column := lvwItems.Columns.Add;
  Column.Caption := '';
  Column.Width :=40;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Naam:';
  Column.Width := 150;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Adres:';
  Column.Width := 180;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Plaats:';
  Column.Width := 85;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Telefoonnr:';
  Column.Width := 100;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Opmerkingen:';
  Column.Width := 200;

  lvwItems.Columns.EndUpdate;
end;

procedure TfrmMain.SetEmployeesHeader;
var Column: TListColumn;
begin
  lvwItems.Columns.Clear;
  lvwItems.Columns.BeginUpdate;

  Column := lvwItems.Columns.Add;
  Column.Caption := '';
  Column.Width :=40;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Naam:';
  Column.Width := 150;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Adres:';
  Column.Width := 180;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Plaats:';
  Column.Width := 85;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Telefoonnr:';
  Column.Width := 100;


  Column := lvwItems.Columns.Add;
  Column.Caption := 'Sofinummer:';
  Column.Width := 150;

  lvwItems.Columns.EndUpdate;
end;

procedure TfrmMain.SetInvoicesHeader;
var Column: TListColumn;
begin
  lvwItems.Columns.Clear;
  lvwItems.Columns.BeginUpdate;

  Column := lvwItems.Columns.Add;
  Column.Caption := '';
  Column.Width :=40;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Factuurnr:';
  Column.Width :=70;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Datum:';
  Column.Width := 120;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Klant:';
  Column.Width := 100;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Te betalen:';
  Column.Width := 100;


  Column := lvwItems.Columns.Add;
  Column.Caption := 'Status';
  Column.Width := 100;

  lvwItems.Columns.EndUpdate;

end;

procedure TfrmMain.SetWeekreportsHeader;
var Column: TListColumn;
begin
  lvwItems.Columns.Clear;
  lvwItems.Columns.BeginUpdate;

  Column := lvwItems.Columns.Add;
  Column.Caption := '';
  Column.Width :=40;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Weeknr:';
  Column.Width := 80;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Proje:';
  Column.Width := 80;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Van - Tot:';
  Column.Width := 200;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Totaal uren';
  Column.Width := 100;
  lvwItems.Columns.EndUpdate;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Totaal salaris';
  Column.Width := 100;
  lvwItems.Columns.EndUpdate;
end;
 {
procedure TfrmMain.SetWeekHourListHeader;
var Column: TListColumn;
begin
  lvwItems.Columns.Clear;
  lvwItems.Columns.BeginUpdate;
                       
  Column := lvwItems.Columns.Add;
  Column.Caption := 'Weeknr:';
  Column.Width := 80;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Aantal facturen:';
  Column.Width := 120;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Totaal uren';
  Column.Width := 80;

  Column := lvwItems.Columns.Add;
  Column.Caption := 'Totaal te betalen';
  Column.Width := 120;
  lvwItems.Columns.EndUpdate;
end;      }

procedure TfrmMain.btnCustomersClick(Sender: TObject);
begin
  btnNew.Enabled := True;
  btnCustomers.Down := True;
  ScreenType := 'Customers';
  ckbShowDeleted.Visible := True;   
  lblDeleted.Visible := True;
  ckbShowDeleted.Checked := False;
  SetCustomersHeader;
  ShowCustomers;
end;

procedure TfrmMain.btnEmployeesClick(Sender: TObject);
begin
  btnNew.Enabled := True;
  btnEmployees.Down := True;
  ScreenType := 'Employees';
  ckbShowDeleted.Visible := True;
  lblDeleted.Visible := True;
  ckbShowDeleted.Checked := False;
  SetEmployeesHeader;
  ShowEmployees;
end;

procedure TfrmMain.btnInvoicesClick(Sender: TObject);
begin        
  btnNew.Enabled := True;
  btnInvoices.Down := True;
  ScreenType := 'Invoices'; 
  ckbShowDeleted.Visible := False;  
  lblDeleted.Visible := False;
  SetInvoicesHeader;   
  ShowInvoices;
end;

procedure TfrmMain.btnWeekreportsClick(Sender: TObject);
begin
  btnNew.Enabled := True;
  btnWeekreports.Down := True;   
  ckbShowDeleted.Visible := False;
  lblDeleted.Visible := False;
  ScreenType := 'WeekReports';
  SetWeekreportsHeader;
  ShowWeekreports;
end;


procedure TfrmMain.ShowCustomers;
var Item: TListItem;
    I: Integer;
begin
  DBTCustomers.Refresh;
  lvwItems.Clear;
  DBTCustomers.first;

  for I := 0 to DBTCustomers.RecordCount -1 do begin
  if Not ckbShowDeleted.Checked then
    if DBTCustomersVerwijderd.AsBoolean then begin
      DBTCustomers.Next;
      Continue;
    end;
    Item := lvwItems.Items.Add;
    Item.ImageIndex := 0;
    Item.Caption := DBTCustomersId.AsString;
    Item.SubItems.Add(DBTCustomersNaam.AsString);
    Item.SubItems.Add(DBTCustomersAdres.AsString);
    Item.SubItems.Add(DBTCustomersPlaats.AsString);
    Item.SubItems.Add(DBTCustomersTelefoonnr.AsString);
    Item.SubItems.Add(DBTCustomersNotities.AsString);
    if ckbShowDeleted.Checked then
      if DBTCustomersVerwijderd.AsBoolean then
        Item.SubItems.Add('Ja')
      else
        Item.SubItems.Add('Nee');


    Item.Data := Pointer(DBTCustomersId.AsInteger);
    DBTCustomers.Next;
  end;
end;

procedure TfrmMain.ShowEmployees;
var Item: TListItem;
    I: Integer;
begin
  DBTEmployees.Refresh;
  lvwItems.Clear;
  DBTEmployees.First;

  for I := 0 to DBTEmployees.RecordCount -1 do begin
  
  if Not ckbShowDeleted.Checked then
    if DBTEmployeesVerwijderd.AsBoolean then begin
      DBTEmployees.Next;
      Continue;
    end;
    Item := lvwItems.Items.Add;
    Item.ImageIndex := 1;
    Item.Caption := DBTEmployeesId.AsString;
    Item.SubItems.Add(DBTEmployeesVoornaam.AsString + ' ' + DBTEmployeesAchternaam.AsString);
    Item.SubItems.Add(DBTEmployeesAdres.AsString);
    Item.SubItems.Add(DBTEmployeesPlaats.AsString);
    Item.SubItems.Add(DBTEmployeesTelefoonWerk.AsString);
    Item.SubItems.Add(DBTEmployeesSofinummer.AsString);
    if ckbShowDeleted.Checked then
      if DBTEmployeesVerwijderd.AsBoolean then
        Item.SubItems.Add('Ja')
      else
        Item.SubItems.Add('Nee');

    Item.Data := Pointer(DBTEmployeesId.AsInteger);
    DBTEmployees.Next;
  end;
end;

procedure TfrmMain.ShowInvoices;
var Item: TListItem;
    I: Integer;
    TempDate: TDateTime;
    tempStr: String;
begin
  DBTInvoices.Refresh;
  DBTEmployees.Refresh;
  DBTCustomers.Refresh;
  lvwItems.Clear;
  DBTInvoices.Last;

  for I := 0 to DBTInvoices.RecordCount -1 do begin
  DBTCustomers.Locate('ID', DBTInvoicesKlantId.AsString, []);
    Item := lvwItems.Items.Add;
    TempDate := DBTInvoicesFactuurdatum.AsDateTime;


    TempDate := IncDay(TempDate, DBTCustomersPeriode.AsInteger);
    if DBTInvoicesBetaald.AsBoolean then
      Item.ImageIndex := 4
    else begin
      if TempDate > Now then
        Item.ImageIndex := 3
      else
        Item.ImageIndex := 2
    end;
    
    Item.Caption := DBTInvoicesId.AsString;
    Item.SubItems.Add(DBTInvoicesFactuurnr.AsString);
    DateTimeToString(tempStr,'dd/mm/yyyy', DBTInvoicesFactuurdatum.AsDateTime);
    Item.SubItems.Add(tempStr);
    Item.SubItems.Add(DBTCustomersNaam.AsString);
    Item.SubItems.Add(DBTInvoicesTeBetalen.AsString);
    if DBTInvoicesBetaald.AsBoolean then
      Item.SubItems.Add('Betaald')
    else
      Item.SubItems.Add('Open');

    Item.Data := Pointer(DBTInvoicesId.AsInteger);
    DBTInvoices.Prior;
  end;
end;

procedure TfrmMain.ShowWeekreports;
var Item: TListItem;
    I: Integer;
    tempStr, tempStr2: String;
begin
  DateSeparator := '-';
  ShortDateFormat := 'dd/mm/yyyy';

  DBTInvoices.Refresh;
  DBTEmployees.Refresh;
  DBTCustomers.Refresh;
  DBTWeekReports.Refresh;
  lvwItems.Clear;
  DBTWeekReports.Last;

  for I := 0 to DBTWeekReports.RecordCount -1 do begin
    Item := lvwItems.Items.Add;
    Item.ImageIndex := 6;

    Item.Caption := DBTWeekReportsId.AsString;
    Item.SubItems.Add(DBTWeekReportsWeeknr.AsString);
    Item.SubItems.Add(DBTWeekreportsProje.AsString);
    DateTimeToString(tempStr, 'dd/mm/yyyy', DBTWeekReportsWeekbegin.AsDateTime);
    DateTimeToString(tempStr2, 'dd/mm/yyyy', DBTWeekReportsWeekeind.AsDateTime);
    Item.SubItems.Add(tempStr + ' Tot '+ tempStr2);
    Item.SubItems.Add(FloatToStr(DBTWeekreportsTotaaluren.AsFloat) + '');
    Item.SubItems.Add(FloatToStr(DBTWeekreportsTotaalSalaris.AsFloat) + '');

    Item.Data := Pointer(DBTWeekReportsId.AsInteger);
    DBTWeekReports.Prior;
  end;
end;
          {
procedure TfrmMain.ShowWeekHourLists;
var Item: TListItem;
    I: Integer;
begin
  lvwItems.Clear;
  DBTQuery.SQL.Text := 'SELECT Count(Weekrapporten.Id) AS AantalVanId,'+
    'Count(Weekrapporten.FactuurId) AS AantalFacturen, Weekrapporten.Weeknr,'+
    'Sum(Weekrapporten.Totaaluren) AS Totaaluren, ' +
    'Sum(Weekrapporten.Totaalsalaris) AS Totaalsalaris '+
    'FROM Weekrapporten '+
    'GROUP BY Weekrapporten.Weeknr '+
    'ORDER BY Weekrapporten.Weeknr DESC;';
  DBTQuery.ExecSQL;
  DBTQuery.Open;
  DBTQuery.First;

  for I := 0 to DBTQuery.RecordCount -1 do begin
    Item := lvwItems.Items.Add;
    Item.ImageIndex := 6;

    Item.Caption := DBTQuery.FieldByName('Weeknr').AsString;
    Item.SubItems.Add(DBTQuery.FieldByName('AantalFacturen').AsString);
    Item.SubItems.Add(DBTQuery.FieldByName('Totaaluren').AsString);
    Item.SubItems.Add('€ '+DBTQuery.FieldByName('Totaalsalaris').AsString);

    Item.Data := Pointer(DBTQuery.FieldByName('Weeknr').AsInteger);
    DBTQuery.Next;
  end;
end;
         }
procedure TfrmMain.ShowLateInvoices;
begin
  If (IsthereLateInvoices) and (MessageDlg('Er zijn facturen die nog niet betaald zijn wilt u die bekijken', mtConfirmation, [mbYes, mbNo], 1 ) = mrYes) then begin
    frmEditLateInvoice := TfrmEditLateInvoice.Create(Self);
    try
      if frmEditLateInvoice.ShowModal = mrOk then
        Refresh;
    finally
      frmEditLateInvoice.Free;
    end;
  end  
end;

procedure TfrmMain.btnEditClick(Sender: TObject);
begin
  if lvwItems.Selected = nil then Exit;
  if ScreenType = 'Customers' then begin
    frmEditCustomer := TfrmEditCustomer.Create(Self, Integer(lvwItems.Selected.Data));
    try
      if frmEditCustomer.ShowModal = mrOk then
        Refresh;
    finally
      frmEditCustomer.Free;
    end;
  end
  else if ScreenType = 'Employees' then begin
    frmEditEmployee := TfrmEditEmployee.Create(Self, Integer(lvwItems.Selected.Data));
    try
      if frmEditEmployee.ShowModal = mrOk then
        Refresh;
    finally
      frmEditEmployee.Free;
    end;
  end
  else if ScreenType = 'Invoices' then begin
    frmEditInvoice := TfrmEditInvoice.Create(Self, Integer(lvwItems.Selected.Data));
    try
      if frmEditInvoice.ShowModal = mrOk then
        Refresh;
    finally
      frmEditInvoice.Free;
    end;
  end
  else if ScreenType = 'WeekReports' then begin
    frmEditWeekReport := TfrmEditWeekReport.Create(Self, Integer(lvwItems.Selected.Data));
    try
      if frmEditWeekReport.ShowModal = mrOk then
        Refresh;
    finally
      frmEditWeekReport.Free;
    end;
  end   
end;

procedure TfrmMain.btnNewClick(Sender: TObject);
begin
  if ScreenType ='Customers' then begin
    DBTCustomers.Insert;
    DBTCustomersNotities.AsString := '   ';
    DBTCustomers.Post;
    DBTCustomers.Refresh;
    frmEditCustomer := TfrmEditCustomer.Create(Self, DBTCustomersId.AsInteger);
    try
      if frmEditCustomer.ShowModal = mrOk then
        Refresh
      else
        DBTCustomers.Delete;
    finally
      frmEditCustomer.Free;
    end;
  end
  else if ScreenType = 'Employees' then begin
    DBTEmployees.Insert;
    DBTEmployeesNotities.AsString := '   ';
    DBTEmployees.Post;
    DBTEmployees.Refresh;
    frmEditEmployee := TfrmEditEmployee.Create(Self, DBTEmployeesId.AsInteger);
    try
      if frmEditEmployee.ShowModal = mrOk then
        Refresh
      else
        DBTEmployees.Delete;
    finally
      frmEditEmployee.Free;
    end;
  end
  else if ScreenType = 'Invoices' then begin

    DBTQuery.SQL.Text := 'SELECT Max(Facturen.Factuurnr) AS Factuurnr FROM Facturen';
    DBTQuery.ExecSQL;
    DBTQuery.Open;
    DBTQuery.First;
    DBTQuery.RecordCount;

    DBTInvoices.Insert;
    DBTInvoicesFactuurnr.AsInteger := (DBTQuery.fieldByName('Factuurnr').AsInteger + 1);
    DBTInvoicesFactuurdatum.AsDateTime := Now;
    DBTInvoicesGrekPercentage.AsInteger := 30;
    DBTInvoicesZrekPercentage.AsInteger := 70;
    DBTInvoices.Post;
    DBTInvoices.Refresh;
    frmEditInvoice := TfrmEditInvoice.Create(Self, DBTInvoicesId.AsInteger);
    try
      if frmEditInvoice.ShowModal = mrOk then
        Refresh
      else
        DBTInvoices.Delete;
    finally
      frmEditInvoice.Free;
    end;
  end
  else if ScreenType = 'WeekReports' then begin
    DBTWeekreports.Insert;
    DBTWeekreportsWeekbegin.AsDateTime := Now;
    DBTWeekreportsWeekeind.AsDateTime := (IncDay(Now + 7));
    DBTWeekreportsWeeknr.AsInteger := MonthOfTheYear(Now);
    DBTWeekreports.Post;
    DBTWeekreports.Refresh;
    frmEditWeekReport := TfrmEditWeekReport.Create(Self, DBTWeekreportsId.AsInteger);
    try
      if frmEditWeekReport.ShowModal = mrOk then
        Refresh
      else
        DBTWeekreports.Delete;
    finally
      frmEditWeekReport.Free;
    end;
  end;
end;

procedure TfrmMain.Refresh;
begin
  if ScreenType ='Customers' then
    ShowCustomers;
  if ScreenType = 'Employees' then
    ShowEmployees;
  if ScreenType = 'Invoices' then
    ShowInvoices;
  if ScreenType = 'WeekReports' then
    ShowWeekreports;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
  if ScreenType ='Customers' then begin
    DBTCustomers.Locate('ID', Integer(lvwItems.Selected.Data), []);
    DBTCustomers.Edit;
    DBTCustomersVerwijderd.AsBoolean := True;
    DBTCustomers.Post;
    Refresh;
  end
  else if ScreenType = 'Employees' then begin
    DBTEmployees.Locate('ID', Integer(lvwItems.Selected.Data), []);
    DBTEmployees.Edit;
    DBTEmployeesVerwijderd.AsBoolean := True;
    DBTEmployees.Post;
    Refresh;
  end
  else if ScreenType = 'Invoices' then begin
    DBTInvoices.Locate('ID', Integer(lvwItems.Selected.Data), []);
    DBTInvoices.Delete;
    Refresh;
  end
  else if ScreenType = 'WeekReports' then begin
    DBTWeekreports.Locate('ID', Integer(lvwItems.Selected.Data), []);
    DBTWeekreports.Delete;
    Refresh;
  end
end;

class function TfrmMain.GetTableInvoice: TADOTable;
begin       
  frmMain.DBTInvoices.Refresh;
  Result := frmMain.DBTInvoices;
end;

class function TfrmMain.GetTableCustomer: TADOTable;
begin
  frmMain.DBTCustomers.Refresh;
  Result := frmMain.DBTCustomers;
end;

class function TfrmMain.GetTableEmployee: TADOTable;
begin             
  frmMain.DBTEmployees.Refresh;
  Result := frmMain.DBTEmployees;
end;

class function TfrmMain.GetTableInvoiceDetail: TADOTable;
begin             
  frmMain.DBTInvoiceDetails.Refresh;
  Result := frmMain.DBTInvoiceDetails;
end;

class function TfrmMain.GetTableWeekReport: TADOTable;
begin         
  frmMain.DBTWeekreports.Refresh;
  Result := frmMain.DBTWeekreports;
end;

class function TfrmMain.GetTableWeekDetail: TADOTable;
begin      
  frmMain.DBTWeekDetails.Refresh;
  Result := frmMain.DBTWeekDetails;
end;

class function TfrmMain.GetTableEigen: TADOTable;
begin
  frmMain.DBTEigen.Refresh;
  Result := frmMain.DBTEigen;
end;


class function TfrmMain.GetTableFuncties: TADOTable;
begin
  frmMain.DBTFuncties.Refresh;
  Result := frmMain.DBTFuncties;
end;


class function TfrmMain.GetTableKlantFuncties: TADOTable;
begin
  frmMain.DBTKlantFuncties.Refresh;
  Result := frmMain.DBTKlantFuncties;
end;

class function TfrmMain.GetTablePassword: TADOTable;
begin    
  frmMain.DBTUsers.Refresh;
  Result := frmMain.DBTUsers;
end;

class function TfrmMain.GetTableQuery: TADOQuery;
begin
  Result := frmMain.DBTQuery;
end;


class function TfrmMain.GetTableQuery2: TADOQuery;
begin
  Result := frmMain.DBTQuery2;
end;

class function TfrmMain.GetTableQuery3: TADOQuery;
begin
  Result := frmMain.DBTQuery3;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_F5 ) then begin
    btnCustomers.Click;   
    Handled := True;
  end;
  if (Msg.Charcode = VK_F6 ) then begin
    btnEmployees.Click;  
    Handled := True;
  end;
  if (Msg.Charcode = VK_F7 ) then begin
    btnInvoices.Click;
    Handled := True;
  end;
  if (Msg.Charcode = VK_F8 ) then begin
    btnWeekreports.Click;
    Handled := True;
  end;
  if (Msg.Charcode = VK_INSERT ) then begin
    btnNew.Click;
    Handled := True;
  end;
  if (Msg.Charcode = VK_RETURN ) then begin
    btnEdit.Click;
    Handled := True;
  end;
  if (Msg.Charcode = VK_DELETE ) then begin
    btnDelete.Click;
    Handled := True;
  end;
end;

function TfrmMain.IsthereLateInvoices: Boolean;
var TempDate: TDateTime;
    I:  Integer;
begin
  Result := False;
  DBTInvoices.Refresh;
  DBTInvoices.First;
  DBTCustomers.Locate('ID', DBTInvoicesKlantId.AsInteger, []);

  for I := 0 to DBTInvoices.RecordCount -1 do begin
    TempDate := DBTInvoicesFactuurdatum.AsDateTime;
    IncDay(TempDate, DBTCustomersPeriode.AsInteger);
    if not DBTInvoicesBetaald.AsBoolean and (TempDate < Now) then begin
      Result := True;
      Break;
    end;
    DBTInvoices.Next;
  end;
end;

procedure TfrmMain.ppmrightPopup(Sender: TObject);
begin
  ppmBoekhouder.Enabled := ScreenType = 'WeekReports';
  ppmBoekhouder.Visible := ScreenType = 'WeekReports';
  ppmKlant.Enabled := ScreenType = 'WeekReports';
  ppmKlant.Visible := ScreenType = 'WeekReports';
  //pmpNacap.Enabled := ScreenType = 'WeekReports';
  //pmpNacap.Visible := ScreenType = 'WeekReports';
end;


procedure TfrmMain.btnSettingsClick(Sender: TObject);
begin
  frmEditSettings := TfrmEditSettings.Create(Self);
  try
    if frmEditSettings.ShowModal = mrOk then
      //
  finally
    frmEditSettings.Free;
  end;
end;

procedure TfrmMain.ckbShowDeletedClick(Sender: TObject);  
var Column: TListColumn;
begin
  if ckbShowDeleted.Checked then begin
    if lvwItems.Columns.Items[lvwItems.Columns.Count -1].Caption <> 'Verwijderd:' then begin
    Column := lvwItems.Columns.Add;
    Column.Caption := 'Verwijderd:';
    Column.Width := 100;
    end;
  end
  else begin
    if lvwItems.Columns.Items[lvwItems.Columns.Count -1].Caption = 'Verwijderd:' then
      lvwItems.Columns.Delete(lvwItems.Columns.Count -1);
  end;
  Refresh;
end;

procedure TfrmMain.lblDeletedClick(Sender: TObject);
begin
  ckbShowDeleted.Checked := not(ckbShowDeleted.Checked);
  ckbShowDeletedClick(Sender);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('Weet je zeker dat je wilt sluiten?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.
