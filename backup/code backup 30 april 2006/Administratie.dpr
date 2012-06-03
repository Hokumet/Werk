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
  ReportWeekC in 'ReportWeekC.pas' {frmReportWeekC},
  EditLateInvoice in 'EditLateInvoice.pas' {frmEditLateInvoice},
  ReportWeek in 'ReportWeek.pas' {frmReportWeek},
  EditSettings in 'EditSettings.pas' {frmEditSettings},
  EditPassword in 'EditPassword.pas' {frmEditPassword},
  ReportWeekB in 'ReportWeekB.pas' {frmReportWeekB},
  ChooseCustomer in 'ChooseCustomer.pas' {frmChooseCustomer},
  EditKlantFunctie in 'EditKlantFunctie.pas' {frmKlantFunctie};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEditPassword, frmEditPassword);
  Application.CreateForm(TfrmReportWeekB, frmReportWeekB);
  Application.CreateForm(TfrmChooseCustomer, frmChooseCustomer);
  Application.CreateForm(TfrmKlantFunctie, frmKlantFunctie);
  Application.Run;
end.
