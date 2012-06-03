object frmWeekHourList: TfrmWeekHourList
  Left = 371
  Top = 271
  Width = 443
  Height = 640
  Caption = 'Week uurlijst bekijken'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 435
    Height = 41
    Align = alTop
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 16
      Top = 8
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 41
    Width = 435
    Height = 565
    Align = alClient
    Columns = <>
    TabOrder = 1
  end
end
