program ModernDelphiLanguage;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {FormDemoMain},
  DemoConsole in 'DemoConsole.pas',
  Demo.Generics.ThreadQueue in 'Demo.Generics.ThreadQueue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDemoMain, FormDemoMain);
  Application.Run;
end.
