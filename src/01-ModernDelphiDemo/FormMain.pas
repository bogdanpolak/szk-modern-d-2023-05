unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  System.Generics.Collections,
  {-}
  DemoConsole,
  Demo.Generics.ThreadQueue,
  Demo.Anonymous.DataSetForEach;

type
  TFormDemoMain = class(TForm)
    PanelCommands: TPanel;
    btnDemoThreadedQueue: TButton;
    btnDemoObjectContainer: TButton;
    btnDemoDataSetForEach: TButton;
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
    procedure btnDemoThreadedQueueClick(Sender: TObject);
    procedure btnDemoObjectContainerClick(Sender: TObject);
    procedure btnDemoDataSetForEachClick(Sender: TObject);
  private
    fConsole: IConsole;
    fDemoThreadQueue: IDemoThreadQueue;
  end;

var
  FormDemoMain: TFormDemoMain;

implementation

{$R *.dfm}

uses
  Demo.Generics.ObjectContainer;

procedure TFormDemoMain.btnDemoDataSetForEachClick(Sender: TObject);
begin
  TAnonymousDataSetForEach.Run(fConsole, Self);
end;

procedure TFormDemoMain.btnDemoObjectContainerClick(Sender: TObject);
begin
  TObjectContainer.Run(fConsole, Self);
end;

procedure TFormDemoMain.btnDemoThreadedQueueClick(Sender: TObject);
begin
  fDemoThreadQueue.Execute;
end;

procedure TFormDemoMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  fConsole := TDemoInitializer.Init(Self);
  fDemoThreadQueue := TDemoThreadQueue.Create(fConsole);
end;

end.
