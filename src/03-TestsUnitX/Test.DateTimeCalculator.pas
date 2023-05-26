unit Test.DateTimeCalculator;

interface

uses
  System.Classes,
  System.SysUtils,
  System.DateUtils,
  Spring,
  Spring.Collections,
  Spring.Mocking,
  DUnitX.TestFramework;

type
  IClock = interface(IInvokable)
    ['{4C1A623F-7EDE-4184-B16C-612C793895AC}']
    function GetNow: TDateTime;
  end;

  TSystemClock = class(TInterfacedObject, IClock)
    function GetNow: TDateTime;
  end;

  TDateTimeCalculator = class
  private
    fPoints: IList<TDateTime>;
    fClock: IClock;
  public
    constructor Create(const aClock: IClock);
    destructor Destroy; override;
    procedure AddPointIf(const isTrue: boolean);
    function GetAvgInterval: integer;
  end;

  [TestFixture]
  TestDataModuleMain = class
  public
    [Test]
    procedure When__;
  end;

implementation

{ TDateTimeCalculator }

procedure TDateTimeCalculator.AddPointIf(const isTrue: boolean);
begin
  if (isTrue) then
    fPoints.Add(fClock.GetNow);
end;

constructor TDateTimeCalculator.Create(const aClock: IClock);
begin
  fPoints := TCollections.CreateList<TDateTime>();
  Guard.CheckNotNull(aClock, 'IClock');
  fClock := aClock;
end;

destructor TDateTimeCalculator.Destroy;
begin
  inherited;
end;

function TDateTimeCalculator.GetAvgInterval: integer;
var
  idx: integer;
  sum: Double;
begin
  if fPoints.Count < 2 then
    exit(0);
  sum := 0;
  for idx := 1 to fPoints.Count - 1 do
    sum := sum + MilliSecondsBetween(fPoints[idx - 1], fPoints[idx]);
  Result := Round(sum / (fPoints.Count - 1) / 1000);
end;

{ TestDataModuleMain }

procedure TestDataModuleMain.When__;
var
  sut: TDateTimeCalculator;
  clockMock: Mock<IClock>;
begin
  clockMock := Mock<IClock>.Create(TMockBehavior.Strict);
  clockMock.Setup.Returns([
    { } EncodeDate(2023, 01, 01) + EncodeTime(16, 30, 0, 0),
    { } EncodeDate(2023, 01, 01) + EncodeTime(16, 30, 10, 0),
    { } EncodeDate(2023, 01, 01) + EncodeTime(16, 30, 16, 0)]).When.GetNow;
  sut := TDateTimeCalculator.Create(clockMock);

  sut.AddPointIf(true);
  sut.AddPointIf(true);
  sut.AddPointIf(false);
  sut.AddPointIf(true);

  clockMock.Received(3).GetNow;
  Assert.AreEqual(8, sut.GetAvgInterval);

  sut.Free;
end;

{ TSystemClock }

function TSystemClock.GetNow: TDateTime;
begin
  Result := Now;
end;

end.
