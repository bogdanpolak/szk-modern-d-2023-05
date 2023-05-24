unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  {-}
  DemoConsole;

type
  TFormDemoMain = class(TForm)
    PanelCommands: TPanel;
    btnDemoThreadedQueue: TButton;
    btnDemoSuperObject: TButton;
    btnDemoObjectContainer: TButton;
    btnDemoDataSetForEach: TButton;
    btnDemoAnonymousThread: TButton;
    btnDemoEmployeeCollection: TButton;
    btnDemoWeatherDictionary: TButton;
    btnRunTEnumDemo: TButton;
    btnNullableDemo: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnDemoLazyVariable: TButton;
    procedure FormCreate(Sender: TObject);
  private
    fConsole: IConsole;
  public
  end;

var
  FormDemoMain: TFormDemoMain;

implementation

{$R *.dfm}

procedure TFormDemoMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  fConsole := TDemoInitializer.Init(Self);
end;

end.
