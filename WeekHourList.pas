unit WeekHourList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, AdoDb;

type
  TfrmWeekHourList = class(TForm)
    Panel1: TPanel;
    lvwItems: TListView;
    cmbWeeks: TComboBox;
    Label1: TLabel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure cmbWeeksChange(Sender: TObject);
  private
    DBTQuery, DBTQuery2: TADOQuery;
    TEmployee: TADOTable;
    Weeknummer: Integer;
    procedure LoadWeekHourList;
  public
    constructor Create(Owner: TComponent; Weeknr: Integer); reintroduce;
  end;

var
  frmWeekHourList: TfrmWeekHourList;

implementation

uses Main, DB;

{$R *.dfm}

{ TfrmWeekHourList }

constructor TfrmWeekHourList.Create(Owner: TComponent; Weeknr: Integer);
var I: Integer;
begin
  inherited Create(Owner);
  Weeknummer := Weeknr;
  cmbWeeks.Clear;
  DBTQuery := TfrmMain.GetTableQuery;
  DBTQuery2 := TfrmMain.GetTableQuery2;
  DBTQuery.Open;
  DBTQuery.First;
  for I:= 0 to DBTQuery.RecordCount -1 do begin
    cmbWeeks.Items.Add(DBTQuery.FieldByName('Weeknr').AsString);
    DBTQuery.Next;
  end;

   cmbWeeks.ItemIndex := cmbWeeks.Items.IndexOf(IntToStr(Weeknummer));
  LoadWeekHourList;
end;

procedure TfrmWeekHourList.LoadWeekHourList;  
var I: Integer;
    Item: TListItem;
begin
  lvwItems.Clear;
  TEmployee := TfrmMain.GetTableEmployee;
  DBTQuery2.SQL.Text := 'SELECT WeekDetails.WerknemerID, WeekDetails.Maandag, '+
    'WeekDetails.Dinsdag, WeekDetails.Woensdag, WeekDetails.Donderdag, '+
    'WeekDetails.Vrijdag, WeekDetails.Zaterdag, WeekDetails.STotaal, WeekDetails.Totaal '+
    'FROM Weekrapporten INNER JOIN WeekDetails ON Weekrapporten.Id = WeekDetails.WeekrapportID '+
    'WHERE Weekrapporten.Weeknr= '+ IntToStr(Weeknummer)+';';
  DBTQuery2.ExecSQL;
  DBTQuery2.Open;
  DBTQuery2.First;
    for I := 0 to DBTQuery2.RecordCount -1 do begin
    TEmployee.Locate('ID', DBTQuery2.FieldByName('WerknemerID').AsString,[]);

    Item := lvwItems.Items.Add;
    Item.Caption := TEmployee.FieldByName('Voornaam').AsString;
    Item.SubItems.Add(DBTQuery2.FieldByName('Maandag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Dinsdag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Woensdag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Donderdag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Vrijdag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Zaterdag').AsString);
    Item.SubItems.Add(DBTQuery2.FieldByName('Totaal').AsString);
    Item.SubItems.Add('€ '+DBTQuery2.FieldByName('STotaal').AsString);

    Item.Data := Pointer(DBTQuery2.FieldByName('WerknemerID').AsInteger);
    DBTQuery2.Next;
  end;
end;

procedure TfrmWeekHourList.cmbWeeksChange(Sender: TObject);
begin
  Weeknummer :=StrToInt(cmbWeeks.Items.Strings[cmbWeeks.ItemIndex]);
  LoadWeekHourList;
end;

end.
