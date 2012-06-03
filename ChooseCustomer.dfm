object frmChooseCustomer: TfrmChooseCustomer
  Left = 450
  Top = 413
  BorderStyle = bsDialog
  Caption = 'Kies een klant'
  ClientHeight = 104
  ClientWidth = 194
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cmbCustomers: TComboBox
    Left = 16
    Top = 24
    Width = 153
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 48
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Bevestigen'
    ModalResult = 1
    TabOrder = 1
  end
end
