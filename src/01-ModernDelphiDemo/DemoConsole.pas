unit DemoConsole;

interface

uses
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  IConsole = interface(IInvokable)
    ['{EB55A4AA-1F41-436E-9883-D769ED7CEFE2}']
    procedure WriteTitle(
      const aTitle: string;
      const aBaseCharacter: char = '-';
      const aLength: integer = 72);
    procedure Writeln(const aMessage: string); overload;
    procedure Writeln(
      const aMessage: string;
      const aFormatArgs: array of const); overload;
  end;

  TDemoInitializer = class
    class function Init(const aMainForm: TForm; const aFontSize: integer = 10): IConsole;
  end;

  EDemoFormNotInitialized = class(Exception);

implementation

type
  TConsoleVcl = class(TInterfacedObject, IConsole)
  private
    fMemo: TMemo;
  public
    constructor Create(aMemo: TMemo);
    procedure WriteTitle(
      const aTitle: string;
      const aBaseCharacter: char = '-';
      const aLength: integer = 72);
    procedure Writeln(const aMessage: string); overload;
    procedure Writeln(
      const aMessage: string;
      const aFormatArgs: array of const); overload;
  end;


class function TDemoInitializer.Init(const aMainForm: TForm; const aFontSize: integer = 10): IConsole;
var
  idx: integer;
  mainMemo: TMemo;
begin
  mainMemo := TMemo.Create(aMainForm);
  Result := TConsoleVcl.Create(mainMemo);
  with mainMemo do
  begin
    Name := 'MainMemo';
    Align := alClient;
    AlignWithMargins := True;
    Font.Name := 'Consolas';
    Font.Size := aFontSize;
    ScrollBars := ssVertical;
    Parent := aMainForm;
    Clear;
  end;
end;

{ TVclConsole }

constructor TConsoleVcl.Create(aMemo: TMemo);
begin
  fMemo := aMemo;
end;

procedure TConsoleVcl.Writeln(const aMessage: string);
begin
  fMemo.Lines.Add(aMessage);
end;

procedure TConsoleVcl.Writeln(
  const aMessage: string;
  const aFormatArgs: array of const);
begin
  fMemo.Lines.Add(Format(aMessage, aFormatArgs));
end;

procedure TConsoleVcl.WriteTitle(
  const aTitle: string;
  const aBaseCharacter: char;
  const aLength: integer);
begin
  Self.Writeln('*** %s ***',[aTitle]);
  Self.Writeln(StringOfChar(aBaseCharacter, aLength));
end;

end.
