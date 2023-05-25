program ModernDelphiLanguage;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {FormDemoMain},
  DemoConsole in 'DemoConsole.pas',
  Demo.Generics.ThreadQueue in 'Demo.Generics.ThreadQueue.pas',
  Demo.Anonymous.DataSetForEach in 'Demo.Anonymous.DataSetForEach.pas',
  Demo.Spring4D.Collections in 'Demo.Spring4D.Collections.pas',
  Demo.Spring.Nullable in 'Demo.Spring.Nullable.pas',
  Exercises.Spring4D.Base in 'Exercises.Spring4D.Base.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormDemoMain, FormDemoMain);
  Application.Run;
end.
