unit Demo.Spring.Nullable;

interface

uses
  System.Classes,
  System.Types,
  System.SysUtils,
  System.StrUtils,
  Spring,
  DemoConsole;

type
  TSpringNullableDemo = class
    class procedure Run(aConsole: IConsole);
  end;

implementation

class procedure TSpringNullableDemo.Run(aConsole: IConsole);
var
  date: Nullable<TDateTime>;
begin
  if date.hasValue then
    aConsole.Writeln('  date = ' + DateToStr(date.Value))
  else
    aConsole.Writeln('  date is null');

  date := EncodeDate(2023, 01, 15);
  aConsole.Writeln('  date = ' + DateToStr(date));

  date := nil;
  aConsole.Writeln('  date %s', [IfThen(date.hasValue, 'is not null',
    'is null')]);
  // date.Value - should throw EInvalidOperationException
end;

end.
