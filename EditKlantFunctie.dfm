object frmKlantFunctie: TfrmKlantFunctie
  Left = 496
  Top = 438
  Width = 336
  Height = 245
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Klant functies wijzigen'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblfunctie: TLabel
    Left = 10
    Top = 28
    Width = 32
    Height = 13
    Caption = 'Funtie:'
  end
  object lblprijs: TLabel
    Left = 10
    Top = 54
    Width = 22
    Height = 13
    Caption = 'Prijs:'
  end
  object Panel3: TPanel
    Left = 128
    Top = 0
    Width = 193
    Height = 365
    Align = alCustom
    Color = 12998969
    ParentBackground = False
    TabOrder = 0
    object edtHourprice: THCurrencyEdit
      Left = 8
      Top = 47
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Alignment = taRightJustify
      MaxValue = 999999.000000000000000000
    end
    object cmbFunties: TComboBox
      Left = 8
      Top = 20
      Width = 154
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 141
    Width = 328
    Height = 70
    Align = alBottom
    Color = clBlue
    Locked = True
    ParentBackground = False
    TabOrder = 1
    object btnCancel: TBitBtn
      Left = 184
      Top = 8
      Width = 49
      Height = 49
      Hint = 'Annuleren'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F609C2C2C23DC9C9
        C936F2F2F20DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0098BE98678B9E8B747474
        748BADADAD52EDEDED12FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FCFCFC03FFFFFF00FFFFFF00FFFFFF0083B986823FB959F2355B
        35CA5E5E5EA1ABABAB54F0F0F00FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FCFCFC03DBDBDB24F3F3F30CFFFFFF00FFFFFF00CEE1CE3144CD67FF53E2
        7CFF2E5832D76161619EBDBDBD42F9F9F906FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00CAD6CA357C7C7C83ABABAB54E9E9E916FFFFFF00E6ECE61934B751FF62FB
        95FF46CF69FF344D34CB8282827DEDEDED12FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00118721FF3A633EC8595959A69A9A9A65E1E1E11E82A8827D47D670FF5CF5
        8FFF62FB95FF23782CEF5E5E5EA1E7E7E718FFFFFF00FFFFFF00FFFFFF00FFFF
        FF001A9933FF2BBA54FF1F5C23E3535353AC787E78872B963DF152EB85FF57F0
        8AFF5CF58FFF30B04AFF595959A6E7E7E718FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0017972EFF33CC65FF2BBA54FF1B5E1FE71A7623F142D872FF4CE57FFF51EA
        84FF57F08AFF2DAC46FF67676798E9E9E916FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00159429FF2DC65AFF33CC65FF2BBA54FF33C660FF41DA74FF46DF79FF4CE5
        7FFF51EA84FF2AA040FA9494946BF0F0F00FFFFFFF00FFFFFF00FFFFFF00FFFF
        FF00129124FF27C04EFF2DC65AFF33CC65FF35CE68FF3AD36DFF41DA74FF46DF
        79FF47DD77FF2F7132D5D4D4D42BFEFEFE01FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000F8E1DFF21BA43FF27C04EFF2DC65AFF33CC65FF35CE68FF3AD36DFF40D9
        73FF239939FAA5ABA55AF9F9F906FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000B8B17FF1BB437FF21BA42FF27C04DFF2CC558FF32CB63FF35CE68FF28B1
        4BFF3B4E3BC48F8F8F70E1E1E11EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF0008870FFF15AE29FF1AB335FF20B940FF26BF4CFF2CC557FF32CB63FF31C7
        61FF226B2BE7525252AD9494946BE1E1E11EFFFFFF00FFFFFF00FFFFFF00FFFF
        FF0005850AFF0FA81DFF15AE29FF1AB335FF20B940FF26BF4CFF2CC557FF32CB
        63FF31C660FF277030E25E5E5EA1A0A0A05FF0F0F00FFFFFFF00FFFFFF00FFFF
        FF00028205FF09A212FF0FA81DFF15AE29FF1AB335FF20B940FF26BF4CFF2CC5
        57FF32CB63FF31C660FF468F4FC3B4B4B44BF3F3F30CFFFFFF00FFFFFF00FFFF
        FF008FBB8F707AAD7A8579AC798679AC798679AC798679AC798679AC798679AC
        798679AC798679AC798679AC7986F3F3F30CFFFFFF00FFFFFF00}
    end
    object btnOk: TBitBtn
      Left = 96
      Top = 8
      Width = 49
      Height = 49
      Hint = 'Opslaan'
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F9F9F906BDBDBD429F9F9F60BDBDBD42E3E3
        E31CEFEFEF10F6F6F609FCFCFC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00B9B9B9524E4E4ECA454545C6535353AC6565
        659A86868679B0B0B04FD2D2D22DE9E9E916F2F2F20DF8F8F807FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF006D6D6DFF666666FF444444FF3C3C3CFB3737
        37EB3F3F3FD34B4B4BBA595959A67474748B97979768BCBCBC43E0E0E01FEFEF
        EF10F5F5F50AFCFCFC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00818181FF777777FF555555FF565656FF4545
        45FF266396FF203D80FF343745F33A3A3AE1434343CC505050AF5F5F5FA08383
        837CAAAAAA55D1D1D12EE7E7E718F2F2F20DF8F8F807FEFEFE01FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00828282FF777777FF535353FF555555FF4444
        44FF16AFD5FF00CCFFFF00AFFFFF0C82DBFF1650A6FF293669FF393939EB3E3E
        3ED7494949BC585858A76E6E6E919595956ABABABA45DADADA25ECECEC13F5F5
        F50AFCFCFC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00848484FF787878FF525252FF535353FF4444
        44FF4F7575FF26A6BFFF00CCFFFF00CCFFFF00CCFFFF00C2FFFF0695F5FF1352
        C2FF20368FFF303750F7393939E2434343CC4E4E4EB45C5C5CA37D7D7D82A8A8
        A857DDDDDD22FCFCFC03FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00858585FF787878FF515151FF525252FF4343
        43FFB49585FFECD9CFFFD2A68FFF93998FFF59999FFF26A6BFFF00CCFFFF0080
        FFFF0033FFFF0033FFFF0936E8FF203380FF3F3F3FFF3C3C3CEF3D3D3DD85454
        54B1A8A8A857F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00878787FF787878FF4F4F4FFF515151FF4242
        42FF9B6144FFD9B39FFFDFBFAFFFF2E6DFFFFFFFFFFFECD9CFFFD2A68FFFA393
        8FFF4040AFFF0033FFFF0033FFFF1A3399FF575757FF646464FF5F5F5FFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00888888FF797979FF4E4E4EFF4F4F4FFF4242
        42FF3B3B94FF563370FF7C3330FF993300FFBF8060FFD9B39FFFDFBFAFFFFFFF
        FFFF99809FFF0033FFFF0033FFFF1A3399FF565656FF636363FF646464FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008A8A8AFF797979FF4D4D4DFF4E4E4EFF4141
        41FF143AD3FF0033FFFF0033FFFF0A33EFFF3033AFFF4D3380FF733340FFAC59
        30FF863320FF0033FFFF0033FFFF1A3399FF555555FF626262FF636363FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008B8B8BFF7A7A7AFF4C4C4CFF4D4D4DFF4040
        40FF1A37A9FF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFF0033
        FFFF2633BFFF0033FFFF0033FFFF1A3399FF545454FF606060FF626262FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008C8C8CFF797979FF4A4A4AFF4C4C4CFF4949
        49FF444444FF3C3F4CFF2C386BFF1A3399FF0D33CCFF0033FFFF0033FFFF0033
        FFFF0033FFFF0033FFFF0033FFFF1A3399FF535353FF5F5F5FFF606060FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008E8E8EFF7A7A7AFF494949FF4A4A4AFF3C3C
        3CFF3B3B3BFF424242FF484848FF4F4F4FFF4A4A4AFF434343FF323B62FF1D33
        8CFF1033BFFF0633E6FF0033FFFF1A3399FF525252FF5E5E5EFF5F5F5FFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF008F8F8FFF7A7A7AFF484848FF494949FF3939
        39FF333333FF333333FF333333FF333333FF3B3B3BFF414141FF4C4C4CFF5555
        55FF4F4F4FFF474747FF383F58FF353845FF515151FF5D5D5DFF5E5E5EFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00919191FF7B7B7BFF464646FF484848FF3838
        38FF333333FF333333FF333333FF333333FF333333FF333333FF3B3B3BFF5353
        53FF404040FF333333FF353535FF4F4F4FFF5A5A5AFF5B5B5BFF5D5D5DFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00929292FF7B7B7BFF454545FF464646FF3838
        38FF333333FF333333FF333333FF333333FF333333FF333333FF3B3B3BFF5050
        50FF333333FF333333FF333333FF353535FF595959FF5A5A5AFF5B5B5BFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00949494FF7C7C7CFF444444FF454545FF4646
        46FF454545FF424242FF3E3E3EFF393939FF353535FF333333FF3A3A3AFF4F4F
        4FFF333333FF333333FF333333FF333333FF4E4E4EFF595959FF5A5A5AFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00959595FF7B7B7BFF424242FF4B585BFF80E6
        FFFF82E8FFFF79CCDDFF6FAFBBFF66939AFF586B6DFF494949FF494949FF4F4F
        4FFF3A3A3AFF333333FF333333FF333333FF515151FF575757FF595959FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00979797FF7C7C7CFF414141FF506A71FF7DE3
        FFFF80E6FFFF82E8FFFF85EBFFFF87EDFFFF8AF0FFFF8CF2FFFF7ECBD3FF74AD
        B2FF678E90FF475354FF3B3B3BFF474747FF555555FF565656FF575757FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00989898FF7C7C7CFF404040FF4F6870FF88EE
        FFFF82E8FFFF80E6FFFF82E8FFFF85EBFFFF87EDFFFF8AF0FFFF90F6FFFF92F8
        FFFF94FAFFFF95FBFFFF92F2F4FF87D4D4FF617474FF555555FF565656FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009A9A9AFF7C7C7CFF3E3E3EFF4D676FFF82E8
        FFFF91F7FFFF90F6FFFF8DF3FFFF8EF4FFFF92F8FFFF96FCFFFF92F8FFFF92F8
        FFFF94FAFFFF97FDFFFF98FEFFFF97FDFFFF75A8A8FF535353FF555555FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009B9B9BFF7D7D7DFF3C3C3CFF4B656EFF8DF3
        FFFF91F7FFFF88EEFFFF87EDFFFF89EFFFFF8FF5FFFF93F9FFFF96FCFFFF95FB
        FFFF97FDFFFF96FCFFFF95FBFFFF98FEFFFF74A7A8FF525252FF535353FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009C9C9CFF7D7D7DFF3B3B3BFF4A636DFF8DF3
        FFFF89EFFFFF88EEFFFF8FF5FFFF90F6FFFF8CF2FFFF8BF1FFFF8FF5FFFF91F7
        FFFF92F8FFFF93F9FFFF95FBFFFF98FEFFFF72A5A7FF515151FF525252FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009E9E9EFF7D7D7DFF3A3A3AFF3C3C3CFF72D8
        FFFF88EEFFFF92F8FFFF91F7FFFF91F7FFFF94FAFFFF8FF5FFFF89EFFFFF8AF0
        FFFF8DF3FFFF93F9FFFF97FDFFFF95FBFFFF70A3A6FF4F4F4FFF515151FF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF009F9F9FFF7E7E7EFF393939FF3A3A3AFF6ED4
        FFFF70D6FFFF73D9FFFF75DBFFFF78DEFFFF7AE0FFFF7DE3FFFF80E6FFFF82E8
        FFFF85EBFFFF87EDFFFF8BF1FFFF94FAFFFF70A3A6FF4E4E4EFF4F4F4FFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A1A1A1FF7E7E7EFF373737FF393939FF6BD1
        FFFF6ED4FFFF70D6FFFF73D9FFFF75DBFFFF78DEFFFF7AE0FFFF7DE3FFFF80E6
        FFFF82E8FFFF85EBFFFF87EDFFFF8AF0FFFF6C9FA5FF4D4D4DFF4E4E4EFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2FF7E7E7EFF363636FF373737FF69CF
        FFFF6BD1FFFF6ED4FFFF70D6FFFF73D9FFFF75DBFFFF78DEFFFF7AE0FFFF7DE3
        FFFF80E6FFFF82E8FFFF85EBFFFF87EDFFFF6A9DA5FF4C4C4CFF4D4D4DFF3F3F
        3FD99F9F9F60F3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A3A3A3FF7E7E7EFF353535FF363636FF589E
        C1FF69CFFFFF6BD1FFFF6ED4FFFF70D6FFFF73D9FFFF75DBFFFF78DEFFFF7AE0
        FFFF7DE3FFFF80E6FFFF82E8FFFF85EBFFFF689BA4FF4A4A4AFF4C4C4CFF3F3F
        3FD9A4A4A45BF3F3F30CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00A5A5A5FF7F7F7FFF333333FF353535FF3636
        36FF383838FF3F4C52FF47606CFF527E91FF56899EFF66B2CFFF6BBEDBFF78DE
        FFFF7AE0FFFF7DE3FFFF80E6FFFF82E8FFFF6699A3FF494949FF4A4A4AFF4F4F
        4FC9BFBFBF40F8F8F807FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00999999CF8C8C8CFF777777FF868686FF7A7A
        7AFF6E6E6EFF616161FF555555FF484848FF3C3C3CFF3D3D3DFF3E3E3EFF4040
        40FF4B5E64FF506A71FF6194A1FF6396A2FF556F74FF484848FF444444F6A0A0
        A06EF6F6F609FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F210CACACA41C3C3
        C354B5B5B583A7A7A794A2A2A2C2969696D2969696FF878787FF9F9F9FFF8A8A
        8AFF838383FF6C6C6CFF656565FF4C4C4CFF404040FF717171B0E1E1E121FEFE
        FE01FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F2F210CACACA41BBBB
        BB54BCBCBC83ADADAD94A0A0A0A4B0B0B078DCDCDC29FCFCFC03FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
  end
end
