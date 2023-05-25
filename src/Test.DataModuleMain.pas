unit Test.DataModuleMain;

interface

uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TestDataModuleMain = class
  public
    // [Setup] procedure Setup;
    // [TearDown] procedure TearDown;
    [Test]
    procedure Test1;
    // [Test]
    // [TestCase('TestA','1,2')]
  end;

implementation

procedure TestDataModuleMain.Test1;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TestDataModuleMain);

end.
