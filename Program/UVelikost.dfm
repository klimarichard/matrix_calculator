object Velikost: TVelikost
  Left = 516
  Top = 317
  Width = 258
  Height = 134
  Caption = 'Velikost'
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PocetRadku: TLabel
    Left = 8
    Top = 8
    Width = 80
    Height = 17
    Caption = 'Po'#269'et '#345#225'dk'#367':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clScrollBar
    Font.Height = -15
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object PocetSloupcu: TLabel
    Left = 8
    Top = 32
    Width = 92
    Height = 17
    Caption = 'Po'#269'et sloupc'#367':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clScrollBar
    Font.Height = -15
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 128
    Top = 64
    Width = 105
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 63
    Width = 113
    Height = 25
    Caption = 'Zru'#353'it'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Cambria'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 8
    Width = 57
    Height = 23
    Style = csDropDownList
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = []
    ItemHeight = 15
    ItemIndex = 3
    ParentFont = False
    TabOrder = 2
    Text = '4'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
  object ComboBox2: TComboBox
    Left = 112
    Top = 32
    Width = 57
    Height = 23
    Style = csDropDownList
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Cambria'
    Font.Style = []
    ItemHeight = 15
    ItemIndex = 3
    ParentFont = False
    TabOrder = 3
    Text = '4'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
end
