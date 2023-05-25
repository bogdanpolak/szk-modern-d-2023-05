unit Test.DataModuleMain;

interface

uses
  DUnitX.TestFramework,
  System.TimeSpan,
  System.Messaging,
  System.SysUtils,
  System.DateUtils,
  DataModule.Main;

type

  [TestFixture]
  TestDataModuleMain = class
  public
    // [Setup] procedure Setup;
    // [TearDown] procedure TearDown;
    [Test]
    procedure WhenIntervalZero_ThenAvgTispanZero;
    [Test]
    [TestCase('2Dates_Span1000', '1000, 00:00:10:0000 00:00:11:000')]
    [TestCase('3Dates_Span800',
      '800, 00:00:10:0000 00:00:11:0000 00:00:11:600')]
    procedure TestManyDates(const expecedMiliSecs: integer;
      const aData: string);
    // [Test]
  end;

implementation

procedure TestDataModuleMain.WhenIntervalZero_ThenAvgTispanZero;
var
  sut: TDataModuleMain;
  actualInterval: TTimeSpan;
begin
  // Arrange
  sut := TDataModuleMain.Create(nil);

  // Act
  actualInterval := sut.GetMessageAvgInterval;

  // Asset
  Assert.AreEqual(0.0, actualInterval.TotalMilliseconds, 0.1);
end;

procedure TestDataModuleMain.TestManyDates(const expecedMiliSecs: integer;
  const aData: string);
var
  sut: TDataModuleMain;
  actualInterval: TTimeSpan;
  actualMilisecs: integer;
  times: TArray<string>;
  idx: integer;
  items: TArray<string>;
begin
  // Arrange
  sut := TDataModuleMain.Create(nil);

  times := Trim(aData).Split([' ']);
  for idx := 0 to Length(times) - 1 do
  begin
    items := times[idx].Split([':']);
    TMessageManager.DefaultManager.SendMessage(Self,
      TMessage<TDateTime>.Create(EncodeTime(StrToInt(items[0]),
      StrToInt(items[1]), StrToInt(items[2]), StrToInt(items[3]))));
  end;
  // Act
  actualMilisecs := Round(sut.GetMessageAvgInterval.TotalMilliseconds);

  // Asset
  Assert.AreEqual(expecedMiliSecs, actualMilisecs);
end;

initialization

TDUnitX.RegisterTestFixture(TestDataModuleMain);

end.
