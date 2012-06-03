unit EditWeekHourList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TfrmWeekHourList = class(TForm)
    Panel1: TPanel;
    ListView1: TListView;
    ComboBox1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWeekHourList: TfrmWeekHourList;

implementation

{$R *.dfm}

end.
