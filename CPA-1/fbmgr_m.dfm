object FoMain: TFoMain
  Left = 217
  Top = 127
  ActiveControl = BtStartStop
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FBManager'
  ClientHeight = 268
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000010000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF009999
    9999999999999000000000000999999999999999999908888888888809909999
    99900000999908800000000000009999000000000090800F7878787870009990
    000000000000808F7878787870009900000000000000088F7878787870009000
    000000000000088F787878787000000B000000000000008F787878787000007B
    000000088000000F78787878700007BB0000000BBBB0000F7878787870000BBB
    8000000BBBB7000F7878787870000BBBB0000000BBBBB00F787878787000BBBB
    B78000008BBBB00F787878787000BBBBBBBB80000BBBB00F787878787000BBBB
    B8BB00008BBBB00F7878787870000BBBB000000BBBBBB08F78787878700007BB
    B80000887BBBB08F787878787000908BBBB88BBBBBBB088F787878787000990B
    BBBBBBBBBB80888F78787878700099907BBBBBBBBB07888F7878787870009999
    07BBBBBBB007888F78F8F8F8700099999999BBB90007888F7888888870009999
    999999000007888F7777777770009999999990000007888F7777788870009999
    999900000007888F77777AAA7000999999900000000F888F7777788870009999
    990000000000F88F77777999700099999000000000000F8F7777777770009999
    00000000000000FFFFFFFFFFF000999000000000000000000000000000009900
    0000000000000000000000000000900000000000000000000000000000000000
    0000000000010000000300000003000000030000000300000003000000030000
    0003000000030000000300000003000000030000000300000003000000030000
    000300000003000000030000000300000003000C0003003C0003007C000300FC
    000301FC000303FE000307FF00030FFF80031FFFC0033FFFFFFF7FFFFFFF}
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GBRDir: TGroupBox
    Left = 0
    Top = 53
    Width = 316
    Height = 47
    Caption = 'Root &Directory '
    TabOrder = 1
    object LbRDir: TLabel
      Left = 10
      Top = 20
      Width = 42
      Height = 13
      Caption = '(RootDir)'
    end
  end
  object GBSUp: TGroupBox
    Left = 80
    Top = 0
    Width = 234
    Height = 49
    Caption = 'Startup &Mode '
    TabOrder = 0
    object RBSMAuto: TRadioButton
      Left = 8
      Top = 23
      Width = 105
      Height = 17
      Caption = 'Automatic'
      TabOrder = 0
      OnClick = ChangeStartUp
    end
    object RBSMMan: TRadioButton
      Left = 124
      Top = 23
      Width = 68
      Height = 17
      Caption = 'Manual'
      TabOrder = 1
      OnClick = ChangeStartUp
    end
  end
  object GBStat: TGroupBox
    Left = 0
    Top = 103
    Width = 317
    Height = 136
    Caption = 'S&tatus '
    TabOrder = 2
    object LbStatS: TLabel
      Left = 10
      Top = 20
      Width = 146
      Height = 13
      Caption = 'The Firebird Server is currently '
    end
    object LbVersion: TLabel
      Left = 10
      Top = 40
      Width = 41
      Height = 13
      Caption = '(Version)'
    end
    object LbAutoReboot: TLabel
      Left = 221
      Top = 102
      Width = 91
      Height = 13
      Caption = '(Automatic Reboot)'
      Visible = False
    end
    object Bevel1: TBevel
      Left = 5
      Top = 66
      Width = 308
      Height = 9
      Shape = bsTopLine
      Style = bsRaised
    end
    object LbStat: TLabel
      Left = 162
      Top = 20
      Width = 71
      Height = 15
      AutoSize = False
      Caption = 'Started'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtStartStop: TButton
      Left = 237
      Top = 15
      Width = 75
      Height = 25
      Caption = '&Change'
      TabOrder = 0
      OnClick = BtStartStopClick
    end
    object CBServ: TCheckBox
      Left = 9
      Top = 79
      Width = 223
      Height = 17
      Caption = '&Run as a service on NT/W2K/XP'
      TabOrder = 1
      OnClick = CBServClick
    end
    object CBGuar: TCheckBox
      Left = 9
      Top = 95
      Width = 182
      Height = 17
      Caption = '&Use Guardian'
      TabOrder = 2
      OnClick = CBGuarClick
    end
    object BtApply: TButton
      Left = 234
      Top = 77
      Width = 75
      Height = 25
      Caption = '&Apply'
      TabOrder = 3
      Visible = False
      OnClick = BtApplyClick
    end
    object CBGOpt: TCheckBox
      Left = 25
      Top = 112
      Width = 182
      Height = 17
      Caption = '&Keep Restarting Firebird'
      TabOrder = 4
      OnClick = CBGOptClick
    end
  end
  object GBFb: TGroupBox
    Left = 0
    Top = 0
    Width = 76
    Height = 49
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    object ImFb: TImage
      Left = 23
      Top = 11
      Width = 32
      Height = 32
      AutoSize = True
      Center = True
      IncrementalDisplay = True
      Picture.Data = {
        055449636F6E0000010001002020100001000400E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000000000000000000000000000000008770000778000
        0000000000000000F70000000000078000000000000000000000000000000007
        8000000000000070000000000000000008000000000007000000000000000000
        0080000000007000000000000000000000080000000800000000000000000000
        0000F00000F0000F000000000000000000007000008000FF0000000000000000
        00000800000008B800000000000770000000070008007BB80000000000FBBBF7
        000000F007008BBF0000000000FBBBBB800000000700BBBB70000000007BBBBB
        B80000700707BBBB800000000008BBBBBB8000700008BBBBB80000000000FBBB
        BBB700700008BBBBBB87000000007BBBBBB800700708BBBBBBBBF70000000FBB
        BBBF00700708BBBBBBBBBB7000000BBBBBBB00800807BBBBBF7FBF0000007BBB
        BBBF00800F07BBBBB70000000000FBBBBBB800000070BBBBB7000000007FBBBB
        BBB7070000808BBBBF70000007778BBBBBB00F0000070BBBBBBB7770078F8BBB
        BB807000000F07BBBBBB8778FBBBBBBBBF00F0000000808BBBBBBBBBBBBBBBBB
        B708000000000808BBBBBBBBBBBBBBBB70800000000000808BBBBBBBBBBBBBF7
        080000000000000F778BBBBBBBBBB807F00000000000000008778FBBBB8777F0
        0000000000000000000F87777788000000000000000000000000000000000000
        00000000FFFFFFFFFFE007FFFF0001FFFF00007FFC00003FF800001FF000000F
        E0000007C0000007C0000003C000000380000001800000038000000180000001
        800000018000000180000001800000018000000180000003C0000003C0000003
        E0000007E0000007F000000FF800001FFC00003FFE00007FFF8001FFFFE00FFF
        FFFFFFFF}
      Transparent = True
    end
  end
  object PanVersion: TPanel
    Left = 221
    Top = 241
    Width = 96
    Height = 25
    BevelInner = bvLowered
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object PanVisit: TPanel
    Left = 0
    Top = 241
    Width = 221
    Height = 25
    BevelInner = bvLowered
    TabOrder = 5
    object LbUrl: TLabel
      Left = 43
      Top = 5
      Width = 168
      Height = 13
      Cursor = crHandPoint
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'http://www.comunidade-firebird.org'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = LbUrlClick
    end
    object LbVisit: TLabel
      Left = 11
      Top = 5
      Width = 22
      Height = 13
      Caption = 'Visit:'
      ParentShowHint = False
      ShowHint = True
    end
  end
end
