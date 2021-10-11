object Form1: TForm1
  Left = 252
  Top = 122
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1086#1074' Run-time'
  ClientHeight = 354
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object PanelTest: TPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 354
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    OnDblClick = PanelTestDblClick
  end
  object Panel2: TPanel
    Left = 440
    Top = 0
    Width = 211
    Height = 354
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 22
      Top = 162
      Width = 119
      Height = 48
      Caption = #1062#1074#1077#1090' '#1092#1086#1085#1090#1072' '#1076#1083#1103'  '#1084#1077#1085#1102' "'#1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090'"'
      WordWrap = True
    end
    object rgComponents: TRadioGroup
      Left = 23
      Top = 21
      Width = 170
      Height = 129
      Caption = #1057#1086#1079#1076#1072#1077#1084' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      Items.Strings = (
        'TEdit'
        'TButtom'
        'TCheckBox'
        'TLabel')
      TabOrder = 0
    end
    object ColorGrid: TColorGrid
      Left = 22
      Top = 223
      Width = 120
      Height = 120
      ForegroundIndex = 9
      BackgroundEnabled = False
      TabOrder = 1
    end
  end
  object MainMenu: TMainMenu
    Left = 500
    Top = 64
    object N3: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1094#1074#1077#1090
      object AllColor: TMenuItem
        Caption = #1044#1083#1103' '#1074#1089#1077#1093
        OnClick = AllColorClick
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object Tag12: TMenuItem
        Tag = 1
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' Tag=1'
        OnClick = AllColorClick
      end
      object Tag22: TMenuItem
        Tag = 2
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' Tag=2'
        OnClick = AllColorClick
      end
    end
    object N6: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      object miAllClear: TMenuItem
        Caption = #1042#1089#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099
        OnClick = miAllClearClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object TEdit1: TMenuItem
        Tag = 1
        Caption = 'TEdit'
        OnClick = miAllClearClick
      end
      object TCheckBox1: TMenuItem
        Tag = 2
        Caption = 'TCheckBox'
        OnClick = miAllClearClick
      end
    end
    object miCheckBox: TMenuItem
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' CheckBox'
      OnClick = miCheckBoxClick
      object miChecked: TMenuItem
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086' '#1074#1089#1077#1084' '
        OnClick = miCheckedClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
    end
  end
  object pmComponent: TPopupMenu
    OnPopup = pmComponentPopup
    Left = 500
    Top = 33
    object pmTag1: TMenuItem
      Caption = 'Tag = 1'
      OnClick = pmTag1Click
    end
    object pmTag2: TMenuItem
      Caption = 'Tag = 2'
      OnClick = pmTag2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1084#1087#1086#1085#1077#1085#1090
      OnClick = N2Click
    end
    object pmLine: TMenuItem
      Caption = '-'
    end
    object pmNewMessage: TMenuItem
      Caption = #1042#1074#1077#1089#1090#1080' '#1085#1086#1074#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      OnClick = pmNewMessageClick
    end
  end
end
