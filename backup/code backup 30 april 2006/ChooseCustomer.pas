unit ChooseCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls;

type
  TfrmChooseCustomer = class(TForm)
    cmbCustomers: TComboBox;
    btnOk: TButton;
  private
    { Private declarations }
  public                    
    TQuery: TADOQuery;
    constructor Create(Owner: TComponent; ID: Integer); reintroduce;
  end;

var
  frmChooseCustomer: TfrmChooseCustomer;

implementation

uses Main, DB;
{$R *.dfm}

constructor TfrmChooseCustomer.Create(Owner: TComponent; ID: Integer);
var I: Integer;
begin         
  inherited Create(Owner);
  TQuery := TfrmMain(Self).GetTableQuery;
  TQuery.SQL.Text := 'SELECT Klanten.Naam as Naam, Klanten.Id as Id FROM Weekrapporten INNER JOIN '+
    '(Klanten INNER JOIN WeekDetails ON Klanten.Id = WeekDetails.KlantID)'+
    ' ON Weekrapporten.Id = WeekDetails.WeekrapportID '+
    'Where Weekrapporten.Id='+ IntToStr(ID)+
    ' GROUP BY Klanten.Naam, Weekrapporten.Id, Klanten.Id;';

  TQuery.ExecSQL;
  TQuery.Open;
  TQuery.First;
  for I := 0 to TQuery.RecordCount -1 do begin
     cmbCustomers.AddItem(TQuery.fieldByname('Naam').AsString, Pointer( TQuery.fieldByname('Id').AsInteger) );
     TQuery.Next;
  end;
  cmbCustomers.ItemIndex := 0;

end;
end.
