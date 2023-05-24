program ModernDelphiLanguage;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {FormDemoMain},
  DemoConsole in 'DemoConsole.pas',
  superdate in 'SuperObjects\superdate.pas',
  superobject in 'SuperObjects\superobject.pas',
  supertimezone in 'SuperObjects\supertimezone.pas',
  supertypes in 'SuperObjects\supertypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDemoMain, FormDemoMain);
  Application.Run;
end.
