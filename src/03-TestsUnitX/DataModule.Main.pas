unit DataModule.Main;

interface

uses
  System.SysUtils, System.Classes, System.Messaging,
  System.DateUtils,
  System.TimeSpan,
  Spring.Collections;

type
  TDataModuleMain = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    fMessages: IList<TDateTime>;
    fDataTimeMessageSubId: Integer;
    { Private declarations }
  public
    function GetMessageAvgInterval(): TTimeSpan;
  end;

var
  DataModuleMain: TDataModuleMain;

type
  TIntervalCalculator = class
    class function GetAvgInterval(const aMessages: IList<TDateTime>): TTimeSpan;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

class function TIntervalCalculator.GetAvgInterval(const aMessages
  : IList<TDateTime>): TTimeSpan;
var
  idx: Integer;
  sum: Double;
begin
  if aMessages.Count < 2 then
    Exit(TTimeSpan.Zero);

  sum := 0;
  for idx := 1 to aMessages.Count - 1 do
    sum := sum + MilliSecondsBetween(aMessages[idx - 1], aMessages[idx]);

  Result := TTimeSpan.FromMilliseconds(sum / (aMessages.Count - 1));
end;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
begin
  fMessages := TCollections.CreateList<TDateTime>();
  fDataTimeMessageSubId := TMessageManager.DefaultManager.SubscribeToMessage
    (TMessage<TDateTime>,
    procedure(const Sender: TObject; const M: TMessage)
    begin
      fMessages.Add(TMessage<TDateTime>(M).Value)
    end);
end;

procedure TDataModuleMain.DataModuleDestroy(Sender: TObject);
begin
  TMessageManager.DefaultManager.Unsubscribe(TMessage<TDateTime>,
    fDataTimeMessageSubId);
end;

function TDataModuleMain.GetMessageAvgInterval: TTimeSpan;
begin
  Result := TIntervalCalculator.GetAvgInterval(fMessages);
end;

end.
