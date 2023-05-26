unit Test.DataModuleMain;

interface

uses
  DUnitX.TestFramework,
  System.TimeSpan,
  System.Messaging,
  System.SysUtils,
  System.StrUtils,
  System.DateUtils,
  Spring.Collections,
  DataModule.Main;

type

  [TestFixture]
  TestDataModuleMain = class
  private
    fMessages: IList<TDateTime>;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure WhenIntervalZero_ThenAvgTispanZero;
    [Test]
    [TestCase('2Dates_Span1000', '1000, 00:00:10 00:00:11')]
    [TestCase('3Dates_Span800',
      '7500, 00:00:10  00:00:20 00:00:25')]
    procedure TestManyDates(const expecedMiliSecs: integer;
      const aData: string);
  end;

implementation

procedure TestDataModuleMain.Setup;
begin
  fMessages := TCollections.CreateList<TDateTime>();
end;

procedure TestDataModuleMain.WhenIntervalZero_ThenAvgTispanZero;
var
  actualInterval: TTimeSpan;
begin
  // Act
  actualInterval := TIntervalCalculator.GetAvgInterval(fMessages);
  // Asset
  Assert.AreEqual(0.0, actualInterval.TotalMilliseconds, 0.1);
end;

function RemoveDupSpaces(const Input : String) : String;
var
  P : Integer;
begin
  Result := Input;
  repeat
    P := Pos('  ', Result);
    if P > 0 then
      Delete(Result, P + 1, 1);
  until P = 0;
end;

function ParseTimeStrInputToDateTimeList(const aInput: string): TArray<TDateTime>;
var
  times: TArray<string>;
  idx: integer;
  items: TArray<string>;
  input: string;
begin
  input := RemoveDupSpaces(Trim(aInput));
  times := input.Split([' ']);
  SetLength(Result, Length(times));
  for idx := 0 to Length(times) - 1 do
  begin
    items := times[idx].Split([':']);
    if Length(items)<>3 then
      raise Exception.Create(Format('Invalid DateTime item. Expected text hh:mm:ss, but actual is %s',[times[idx]]));
    Result[idx] := EncodeTime(StrToInt(items[0]), StrToInt(items[1]),
      StrToInt(items[2]), 0);
  end;
end;


procedure TestDataModuleMain.TestManyDates(const expecedMiliSecs: integer;
  const aData: string);
var
  actualInterval: TTimeSpan;
  actualMilisecs: integer;
  dates: TArray<TDateTime>;
begin
  // Arrange
  dates := ParseTimeStrInputToDateTimeList(aData);
  fMessages.AddRange(dates);

  // Act
  actualMilisecs := Round(TIntervalCalculator.GetAvgInterval(fMessages)
    .TotalMilliseconds);

  // Asset
  Assert.AreEqual(expecedMiliSecs, actualMilisecs);
end;

initialization

TDUnitX.RegisterTestFixture(TestDataModuleMain);

end.
