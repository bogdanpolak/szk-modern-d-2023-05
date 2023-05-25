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
  Demo.Anonymous.DataSetForEach,
  Exercises.Spring4D.Base;

type
  TFormDemoMain = class(TForm)
    PanelCommands: TPanel;
    btnDemoThreadedQueue: TButton;
    btnDemoObjectContainer: TButton;
    btnDemoDataSetForEach: TButton;
    btnDemoEmployeeCollection: TButton;
    btnDemoWeatherDictionary: TButton;
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
    procedure btnDemoEmployeeCollectionClick(Sender: TObject);
    procedure btnDemoWeatherDictionaryClick(Sender: TObject);
    procedure btnNullableDemoClick(Sender: TObject);
    procedure btnDemoLazyVariableClick(Sender: TObject);
    procedure btnTupleDemoClick(Sender: TObject);
  private
    fConsole: IConsole;
    fDemoThreadQueue: IDemoThreadQueue;
  end;

var
  FormDemoMain: TFormDemoMain;

implementation

{$R *.dfm}

uses
  Demo.Generics.ObjectContainer,
  Demo.Spring4D.Collections,
  Demo.Spring.Nullable;

{ ------------------------------------------------------- }
{ RTL: Generics, Anonymous Methods }

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

{ ------------------------------------------------------- }
{ Spring4D: Collections }

procedure TFormDemoMain.btnDemoEmployeeCollectionClick(Sender: TObject);
begin
  TSpringCollectionsDemo.RunEmployeeCollection(fConsole);
end;

procedure TFormDemoMain.btnDemoLazyVariableClick(Sender: TObject);
begin
  TSpringBaseDemo.RunLazyVariableDemo(fConsole);
end;

procedure TFormDemoMain.btnDemoWeatherDictionaryClick(Sender: TObject);
begin
  TSpringCollectionsDemo.RunWeatherDictionary(fConsole);
end;

procedure TFormDemoMain.btnNullableDemoClick(Sender: TObject);
begin
   TSpringNullableDemo.Run(fConsole);
end;

procedure TFormDemoMain.btnTupleDemoClick(Sender: TObject);
begin
  TSpringBaseDemo.RunTuppleDemo(fConsole);
end;

procedure TFormDemoMain.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
  fConsole := TDemoInitializer.Init(Self);
  fDemoThreadQueue := TDemoThreadQueue.Create(fConsole);
end;

end.
