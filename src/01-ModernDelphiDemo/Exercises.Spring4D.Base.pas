unit Exercises.Spring4D.Base;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  System.StrUtils,
  Spring,
  DemoConsole;

type
  TSpringBaseDemo = class
    class procedure RunLazyVariableDemo(aConsole: IConsole);
    class procedure RunTuppleDemo(aConsole: IConsole);
  end;

implementation

{ TDataModule1 }

type
  TDataModule1 = class
  strict private
    function GetBalanceOfAccountId(aAccoutId: integer): Currency;
  public
    OnCalculateBalance: TProc;
    function BalanceFor(id: integer): ILazy<Currency>;
  end;

function TDataModule1.GetBalanceOfAccountId(aAccoutId: integer): Currency;
begin
  if Assigned(OnCalculateBalance) then
    OnCalculateBalance();
  case aAccoutId of
    1:
      Result := 12034.00;
    2:
      Result := 29001.00
  else
    Result := 9500.00;
  end;
end;

function TDataModule1.BalanceFor(id: integer): ILazy<Currency>;
var
  dm: TDataModule1;
begin
  dm := Self;
  Result := TLazy<Currency>.Create(
    function: Currency
    begin
      Result := Self.GetBalanceOfAccountId(id);
    end);
end;

var
  DataModule1: TDataModule1;


{ TSpringBaseDemo }

class procedure TSpringBaseDemo.RunLazyVariableDemo(aConsole: IConsole);
var
  balanceOf1: ILazy<Currency>;
  balanceOf2: ILazy<Currency>;
begin
  DataModule1 := TDataModule1.Create;
  DataModule1.OnCalculateBalance := procedure
    begin
      aConsole.Writeln('  Balance calculator was called');
    end;
  // - get lazy vaules
  balanceOf1 := DataModule1.BalanceFor(1);
  balanceOf2 := DataModule1.BalanceFor(2);
  aConsole.Writeln('  Lazy variables was created');
  // - use lazy values (in another part of codebase)
  aConsole.Writeln('  Balanace of CustomerId=1 is %f', [balanceOf1.Value]);
  aConsole.Writeln('  Balanace of CustomerId=2 is %f', [balanceOf2.Value]);
  // -
  DataModule1.Free;
end;

class procedure TSpringBaseDemo.RunTuppleDemo(aConsole: IConsole);
var
  pair1: Tuple<integer, string>;
  pair2: Tuple<integer, string>;
  employee: Tuple<integer, string, Currency, TDateTime>;
  empId: integer;
  empName: string;
  empSalary: Currency;
  empHireDate: TDateTime;
begin
  pair1 := Tuple<integer, string>.Create(43, 'Jan Kowalski');
  pair2 := [41, 'Adam'];
  employee := [21, 'Paweł Branko', 8500, EncodeDate(2017, 06, 01)];
  employee.Unpack(empId, empName, empSalary, empHireDate);
  // -
  aConsole.Writeln('  (%d, %s) ', [pair1.value1, pair1.value2]);
  aConsole.Writeln('  pair1' + IfThen(pair1.Equals(pair2), ' = ', ' ≠ ')
    + 'pair2');
  aConsole.Writeln('  Unpacked employee: (%d, %s, %f, %s)',
    [empId, empName, empSalary, DateToStr(empHireDate)]);
end;

end.
