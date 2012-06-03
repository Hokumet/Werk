object PasswordDlg: TPasswordDlg
  Left = 237
  Top = 252
  BorderStyle = bsDialog
  Caption = 'Password Dialog'
  ClientHeight = 156
  ClientWidth = 329
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  DesignSize = (
    329
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object lblUserName: TLabel
    Left = 8
    Top = 80
    Width = 80
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Gebruikersnaam:'
  end
  object lblPassword: TLabel
    Left = 8
    Top = 103
    Width = 64
    Height = 13
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Wachtwoord:'
  end
  object lblVersion: TLabel
    Left = 55
    Top = 136
    Width = 72
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = 'lblVersion'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 7
    Top = 136
    Width = 51
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = 'Versie:'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object edtPassword: TEdit
    Left = 96
    Top = 104
    Width = 217
    Height = 19
    Anchors = [akLeft, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Marlett'
    Font.Style = []
    ParentFont = False
    PasswordChar = 'h'
    TabOrder = 0
  end
  object cmbUsers: TComboBox
    Left = 96
    Top = 80
    Width = 217
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 239
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Cancel = True
    Caption = 'Afsluiten'
    ModalResult = 2
    TabOrder = 2
  end
  object Okbtn: TButton
    Left = 160
    Top = 128
    Width = 75
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = 'Ok'
    Default = True
    TabOrder = 3
    OnClick = OkbtnClick
  end
end
