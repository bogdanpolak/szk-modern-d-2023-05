unit Demo.Generics.ThreadQueue;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  {-}
  DemoConsole;

type
  IDemoThreadQueue = interface
    ['{361C3D17-4433-441F-A927-A0624F45527D}']
    procedure Execute;
  end;

  TDemoThreadQueue = class(TInterfacedObject, IDemoThreadQueue)
  private
    fConsole: IConsole;
    fQueue: TThreadedQueue<string>;
    fThread: TThread;
    procedure OnThreadTeminate(Sender: TObject);
  public
    constructor Create(aConsole: IConsole);
    destructor Destroy; override;
    procedure Execute;
  end;

implementation

constructor TDemoThreadQueue.Create(aConsole: IConsole);
begin
  if (aConsole = nil) then
    raise Exception.Create('IConsole is required');
  fConsole := aConsole;
end;

destructor TDemoThreadQueue.Destroy;
begin
  if (fQueue <> nil) then
  begin
    fThread.Terminate;
    FreeAndNil(fThread);
    fQueue.Free;
  end;
  inherited;
end;

procedure TDemoThreadQueue.Execute;
begin
  if fQueue = nil then
  begin
    fQueue := TThreadedQueue<string>.Create;

    fThread := TThread.CreateAnonymousThread(
      procedure
      begin
        while not TThread.CheckTerminated do
        begin
          fQueue.PushItem(Format('Bogdan Polak %s', [TimeToStr(Now)]));
          Sleep(1000);
        end;
      end);
    fThread.Start;
  end
  else
    fConsole.Writeln('queue.PopItem: %s', [fQueue.PopItem]);
end;

procedure TDemoThreadQueue.OnThreadTeminate(Sender: TObject);
begin
end;

end.
