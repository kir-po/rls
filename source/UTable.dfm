object Form2: TForm2
  Left = 1166
  Top = 77
  HorzScrollBar.Visible = False
  Caption = #1052#1072#1090#1088#1080#1094#1072' '#1072#1079#1080#1084#1091#1090#1072#1083#1100#1085#1099#1093' '#1083#1080#1085#1077#1077#1082' '#1080' '#1076#1080#1089#1082#1088#1077#1090#1086#1074' '#1076#1072#1083#1100#1085#1086#1089#1090#1080
  ClientHeight = 499
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 8
    Top = 64
    Width = 577
    Height = 425
    ColCount = 3200
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 1024
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 49
    Caption = #1042#1074#1077#1089#1090#1080' '#1076#1072#1085#1085#1099#1077' '#1074' '#1084#1072#1089#1089#1080#1074
    TabOrder = 1
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 49
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1084#1080' '#1079#1085#1072#1095#1077#1085#1080#1103#1084#1080
    TabOrder = 2
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 8
    Width = 75
    Height = 49
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 3
    WordWrap = True
    OnClick = Button3Click
  end
  object StringGrid2: TStringGrid
    Left = 591
    Top = 64
    Width = 90
    Height = 427
    ColCount = 1
    FixedCols = 0
    RowCount = 80
    FixedRows = 0
    TabOrder = 4
  end
  object Button4: TButton
    Left = 606
    Top = 8
    Width = 75
    Height = 50
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1072#1090#1088#1080#1094#1091' '#1074' '#1082#1085#1080#1075#1091' Excel'
    TabOrder = 5
    WordWrap = True
    OnClick = Button4Click
  end
  object ProgressBar1: TProgressBar
    Left = 257
    Top = 8
    Width = 343
    Height = 50
    TabOrder = 6
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Left = 32
    Top = 416
  end
end
