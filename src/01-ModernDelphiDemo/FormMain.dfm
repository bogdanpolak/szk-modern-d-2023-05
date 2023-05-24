object FormDemoMain: TFormDemoMain
  Left = 0
  Top = 0
  Caption = 'Modern Delphi Language Demo'
  ClientHeight = 674
  ClientWidth = 882
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object PanelCommands: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 668
    Align = alLeft
    BevelOuter = bvLowered
    Caption = ' '
    TabOrder = 0
    ExplicitHeight = 659
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 22
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Generic Types'
      Color = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 11
    end
    object btnDemoThreadedQueue: TButton
      AlignWithMargins = True
      Left = 4
      Top = 29
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'Threaded Queue'
      TabOrder = 0
    end
    object btnDemoSuperObject: TButton
      AlignWithMargins = True
      Left = 4
      Top = 60
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'SuperObject'
      TabOrder = 1
    end
    object btnDemoObjectContainer: TButton
      AlignWithMargins = True
      Left = 4
      Top = 91
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'Object Container'
      TabOrder = 2
    end
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 129
      Width = 177
      Height = 22
      Margins.Top = 10
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Anonymous Methods'
      Color = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 12
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 317
      Width = 177
      Height = 22
      Margins.Top = 10
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Spring4D Base'
      Color = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 14
    end
    object btnDemoAnonymousThread: TButton
      AlignWithMargins = True
      Left = 4
      Top = 154
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'Anonymous Thread'
      TabOrder = 3
    end
    object btnDemoDataSetForEach: TButton
      AlignWithMargins = True
      Left = 4
      Top = 185
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'DataSet For Each'
      TabOrder = 4
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 223
      Width = 177
      Height = 22
      Margins.Top = 10
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'Spring4D Collections'
      Color = clMenuHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 13
    end
    object btnDemoEmployeeCollection: TButton
      AlignWithMargins = True
      Left = 4
      Top = 248
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'IList: Employee Collection'
      TabOrder = 5
    end
    object btnDemoWeatherDictionary: TButton
      AlignWithMargins = True
      Left = 4
      Top = 279
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'IDictionary: Weather Client'
      TabOrder = 6
    end
    object btnRunTEnumDemo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 342
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'TEnum<> Demo'
      TabOrder = 7
    end
    object btnNullableDemo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 373
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'Nullable<> Demo'
      TabOrder = 8
    end
    object btnTupleDemo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 435
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'Tuple<> Demo'
      TabOrder = 10
    end
    object btnDemoLazyVariable: TButton
      AlignWithMargins = True
      Left = 4
      Top = 404
      Width = 177
      Height = 25
      Align = alTop
      Caption = 'ILazy<>: Lazy Variable'
      TabOrder = 9
    end
  end
end
