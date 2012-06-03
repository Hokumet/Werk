program Administratie;

uses
  Forms,
  EditCustomer in 'EditCustomer.pas' {frmEditCustomer},
  EditEmployee in 'EditEmployee.pas' {frmEditEmployee},
  EditInvoice in 'EditInvoice.pas' {frmEditInvoice},
  EditInvoiceDetail in 'EditInvoiceDetail.pas' {frmInvoiceDetail},
  EditWeekReport in 'EditWeekReport.pas' {frmEditWeekReport},
  Main in 'Main.pas' {frmMain},
  PassWord in 'PassWord.pas' {PasswordDlg},
  ReportInvoice in 'ReportInvoice.pas' {frmReportInvoice},
  EditWeekDetail in 'EditWeekDetail.pas' {frmWeekDetail},
  ReportWeekd in 'ReportWeekd.pas' {frmReportWeekd},
  EditLateInvoice in 'EditLateInvoice.pas' {frmEditLateInvoice},
  ReportWeek in 'ReportWeek.pas' {frmReportWeek},
  EditSettings in 'EditSettings.pas' {frmEditSettings},
  EditPassword in 'EditPassword.pas' {frmEditPassword},
  ReportWeekB in 'ReportWeekB.pas' {frmReportWeekB},
  ChooseCustomer in 'ChooseCustomer.pas' {frmChooseCustomer},
  EditKlantFunctie in 'EditKlantFunctie.pas' {frmKlantFunctie},
  ReportWeekC in 'ReportWeekC.pas' {frmReportWeekC},
  Functies in 'Functies.pas' {frmFuncties},
  EditFunctie in 'EditFunctie.pas' {frmEditFunctie};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
