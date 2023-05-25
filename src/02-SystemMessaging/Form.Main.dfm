object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 359
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 158
    Height = 334
    Align = alLeft
    Caption = ' '
    TabOrder = 0
    ExplicitHeight = 344
    object btnSendMessage: TButton
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 150
      Height = 25
      Align = alTop
      Caption = 'btnSendMessage'
      TabOrder = 1
      OnClick = btnSendMessageClick
    end
    object btnAddMemo: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 150
      Height = 25
      Align = alTop
      Caption = 'btnAddMemo'
      TabOrder = 0
      OnClick = btnAddMemoClick
    end
    object btnStartTask: TButton
      AlignWithMargins = True
      Left = 4
      Top = 66
      Width = 150
      Height = 25
      Align = alTop
      Caption = 'btnStartTask'
      TabOrder = 2
      OnClick = btnStartTaskClick
    end
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 167
    Top = 3
    Width = 472
    Height = 334
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 466
    ExplicitHeight = 344
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 340
    Width = 642
    Height = 19
    Panels = <
      item
        Width = 200
      end>
    ExplicitLeft = 328
    ExplicitTop = 192
    ExplicitWidth = 0
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 56
    Top = 128
  end
end
