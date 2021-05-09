object Form1: TForm1
  Left = 69
  Top = 77
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = #1056#1051#1057
  ClientHeight = 812
  ClientWidth = 1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 5
    Top = 5
    Width = 800
    Height = 800
  end
  object GroupBox1: TGroupBox
    Left = 811
    Top = 77
    Width = 260
    Height = 97
    Caption = #1056#1091#1095#1085#1072#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1077#1075#1091#1083#1080#1088#1086#1074#1082#1080' "'#1055#1054#1056#1054#1043'"'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 64
      Width = 176
      Height = 24
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1088#1086#1075#1072': 0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object TrackBar1: TTrackBar
      Left = 13
      Top = 24
      Width = 241
      Height = 45
      Max = 100
      TabOrder = 0
      OnChange = TrackBar1Change
    end
  end
  object GroupBox2: TGroupBox
    Left = 811
    Top = 180
    Width = 260
    Height = 97
    Caption = #1040#1074#1090#1086#1085#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1077#1075#1091#1083#1080#1088#1086#1074#1082#1080' "'#1055#1054#1056#1054#1043'"'
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 47
      Width = 129
      Height = 32
      AutoSize = False
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1074#1090#1086#1087#1086#1088#1086#1075#1072': -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = #1042#1082#1083'./'#1042#1099#1082#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object RadioGroup1: TRadioGroup
      Left = 163
      Top = 24
      Width = 83
      Height = 65
      Caption = #1050#1088#1080#1090#1077#1088#1080#1081':'
      ItemIndex = 0
      Items.Strings = (
        '3'#1089#1080#1075#1084#1072
        #1057#1088#1077#1076#1085#1077#1077)
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    Left = 811
    Top = 283
    Width = 260
    Height = 226
    Caption = '"'#1042#1054#1051#1053#1067'" ("'#1042#1040#1056#1059'")'
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 127
      Width = 97
      Height = 16
      Caption = #1056#1072#1079#1084#1077#1088' '#1086#1082#1085#1072' : -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 194
      Width = 79
      Height = 16
      Caption = #1044#1072#1083#1100#1085#1086#1089#1090#1100': -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CheckBox2: TCheckBox
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = #1042#1082#1083'./'#1042#1099#1082#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object TrackBar2: TTrackBar
      Left = 16
      Top = 95
      Width = 233
      Height = 26
      Enabled = False
      Max = 100
      TabOrder = 1
      OnChange = TrackBar2Change
    end
    object TrackBar3: TTrackBar
      Left = 16
      Top = 162
      Width = 233
      Height = 26
      Enabled = False
      Max = 3200
      Min = 1
      Position = 1
      TabOrder = 2
      OnChange = TrackBar3Change
    end
    object CheckBox3: TCheckBox
      Left = 16
      Top = 47
      Width = 185
      Height = 42
      Caption = #1040#1074#1090#1086#1091#1089#1090#1072#1085#1086#1074#1082#1072' '#1088#1072#1079#1084#1077#1088#1072' '#1086#1082#1085#1072' '#1080' '#1076#1072#1083#1100#1085#1086#1089#1090#1080
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      WordWrap = True
      OnClick = CheckBox3Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 810
    Top = 5
    Width = 260
    Height = 66
    Caption = #1050#1085#1086#1087#1082#1080' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103
    TabOrder = 3
    object Button1: TButton
      Left = 11
      Top = 16
      Width = 78
      Height = 41
      Caption = #1047#1072#1087#1091#1089#1082' '#1056#1051#1057
      TabOrder = 0
      WordWrap = True
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 95
      Top = 16
      Width = 74
      Height = 41
      Caption = #1054#1089#1090#1072#1085#1086#1074#1082#1072' '#1056#1051#1057
      TabOrder = 1
      WordWrap = True
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 175
      Top = 16
      Width = 74
      Height = 41
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
      TabOrder = 2
      WordWrap = True
      OnClick = Button3Click
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 811
    Top = 515
    Width = 260
    Height = 70
    Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077' '#1084#1086#1085#1080#1090#1086#1088#1072':'
    ItemIndex = 0
    Items.Strings = (
      '1920'#1093'1080'
      '<1920'#1093'1080')
    TabOrder = 4
    OnClick = RadioGroup2Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    Left = 72
    Top = 16
  end
end
