unit Demo.Generics.ThreadQueue;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  System.Types,
  System.Generics.Collections,
  {-}
  DemoConsole;

type
  IDemoThreadQueue = interface
    ['{361C3D17-4433-441F-A927-A0624F45527D}']
    procedure Execute;
    procedure Terminate;
  end;

  TDemoThreadQueue = class(TInterfacedObject, IDemoThreadQueue)
  private
    fConsole: IConsole;
    fQueue: TThreadedQueue<string>;
    fThread: TThread;
    fIsActive: Boolean;
    procedure OnThreadTeminate(Sender: TObject);
  public
    constructor Create(aConsole: IConsole);
    procedure Terminate;
    destructor Destroy; override;
    procedure Execute;
  end;

implementation

constructor TDemoThreadQueue.Create(aConsole: IConsole);
begin
  if (aConsole = nil) then
    raise Exception.Create('IConsole is required');
  fConsole := aConsole;
  fQueue := TThreadedQueue<string>.Create(10, 4294967295, 10);
end;

destructor TDemoThreadQueue.Destroy;
begin
  Terminate();
  fQueue.Free;
  inherited;
end;

procedure TDemoThreadQueue.Execute;
var
  item: string;
  waitResult: TWaitResult;
begin
  if fThread = nil then
  begin
    fThread := TThread.CreateAnonymousThread(
      procedure
      begin
        while not TThread.CheckTerminated do
        begin
          fQueue.PushItem(Format('%d %s', [1000 + random(1000),
            TimeToStr(Now)]));
          Sleep(1500);
        end;
      end);
    fThread.OnTerminate := OnThreadTeminate;
    fThread.Start;
  end;
  waitResult := fQueue.PopItem(item);
  fConsole.Writeln(IfThen((waitResult = wrSignaled), Format('queue.PopItem: %s',
    [item]), 'Queue is empty ...'));
end;

procedure TDemoThreadQueue.OnThreadTeminate(Sender: TObject);
begin
  fIsActive := false;
end;

procedure TDemoThreadQueue.Terminate;
begin
  if (fThread <> nil) then
  begin
    fThread.Terminate;
    FreeAndNil(fThread);
  end;
end;

end.
