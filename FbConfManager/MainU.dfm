object MainForm: TMainForm
  Left = 277
  Top = 236
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Firebird Configuration Manager'
  ClientHeight = 418
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PTools: TPanel
    Left = 0
    Top = 393
    Width = 632
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object PanVersion: TPanel
      Left = 209
      Top = 0
      Width = 423
      Height = 25
      Align = alClient
      BevelOuter = bvNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object PLanguage: TPanel
        Left = 274
        Top = 0
        Width = 149
        Height = 25
        Align = alRight
        BevelInner = bvLowered
        Caption = 'English Language'
        TabOrder = 0
      end
      object PModified: TPanel
        Left = 0
        Top = 0
        Width = 274
        Height = 25
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 1
        object LbVersion: TLabel
          Left = 114
          Top = 6
          Width = 47
          Height = 13
          Alignment = taCenter
          Caption = 'LbVersion'
        end
      end
    end
    object PanVisit: TPanel
      Left = 0
      Top = 0
      Width = 209
      Height = 25
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 1
      object LbUrl: TLabel
        Left = 48
        Top = 5
        Width = 120
        Height = 13
        Cursor = crHandPoint
        Caption = 'http://www.firebirdsql.org'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = LbUrlClick
      end
      object LbVisit: TLabel
        Left = 6
        Top = 5
        Width = 22
        Height = 13
        Caption = 'Visit:'
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object PButtons: TPanel
    Left = 0
    Top = 352
    Width = 632
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BReadConfig: TBitBtn
      Left = 16
      Top = 8
      Width = 185
      Height = 25
      Caption = 'Read configuration file'
      TabOrder = 0
      OnClick = BReadConfigClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
        333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
        C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
        F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
        F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
        00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
        3333333373FF7333333333333000333333333333377733333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BWriteConfig: TBitBtn
      Left = 224
      Top = 8
      Width = 185
      Height = 25
      Caption = 'Save configuration file to disk'
      TabOrder = 1
      OnClick = BWriteConfigClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object BLanguage: TBitBtn
      Left = 432
      Top = 8
      Width = 185
      Height = 25
      Caption = 'Change language'
      PopupMenu = PMLanguage
      TabOrder = 2
      OnClick = BLanguageClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 41
      Align = alLeft
      BevelInner = bvLowered
      TabOrder = 0
      object ImFb: TImage
        Left = 4
        Top = 4
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
      object LFirebirdLabel: TLabel
        Left = 40
        Top = 7
        Width = 155
        Height = 26
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relational Database for the '#13#10'New Millennium'
        WordWrap = True
      end
    end
    object Panel4: TPanel
      Left = 201
      Top = 0
      Width = 431
      Height = 41
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object LbConfFile: TLabel
        Left = 16
        Top = 14
        Width = 401
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'LbConfFile'
      end
    end
  end
  object FB_List: TListView
    Left = 0
    Top = 41
    Width = 361
    Height = 311
    Align = alLeft
    Columns = <
      item
        Caption = 'Property'
        Width = 129
      end
      item
        Caption = 'Value'
        Width = 111
      end
      item
        Caption = 'Default'
        Width = 100
      end>
    Items.Data = {
      740000000200000000000000FFFFFFFFFFFFFFFF02000000000000000C617364
      66617364666173646608617364666173646608617364666173646600000000FF
      FFFFFFFFFFFFFF0200000000000000097765723233343536650A776572793334
      363735360763787662637662FFFFFFFFFFFFFFFF}
    ReadOnly = True
    TabOrder = 0
    ViewStyle = vsReport
    OnKeyPress = FB_ListKeyPress
    OnSelectItem = FB_ListSelectItem
  end
  object Panel6: TPanel
    Left = 361
    Top = 41
    Width = 271
    Height = 311
    Align = alClient
    TabOrder = 1
    object LItemValue: TLabel
      Left = 11
      Top = 232
      Width = 55
      Height = 13
      Caption = 'New Value:'
    end
    object Item_Comments: TMemo
      Left = 1
      Top = 1
      Width = 269
      Height = 224
      TabStop = False
      Align = alTop
      Lines.Strings = (
        'This memo should hold the description of the '
        'curently '
        'selected item')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      WantReturns = False
    end
    object ItemValue: TEdit
      Left = 11
      Top = 253
      Width = 254
      Height = 21
      TabOrder = 1
      Text = 'ItemValue'
      OnChange = ItemValueChange
      OnKeyPress = ItemValueKeyPress
    end
    object BSaveValue: TBitBtn
      Left = 142
      Top = 280
      Width = 99
      Height = 25
      Caption = 'Save'
      Default = True
      Enabled = False
      TabOrder = 2
      OnClick = BCancelValueClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object BCancelValue: TBitBtn
      Left = 30
      Top = 280
      Width = 99
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Enabled = False
      TabOrder = 3
      OnClick = BCancelValueClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  object PMLanguage: TPopupMenu
    AutoHotkeys = maManual
    AutoPopup = False
    MenuAnimation = [maBottomToTop]
    Left = 576
    Top = 304
  end
end
