program EventBusDemo;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Frame.Memo in 'Frame.Memo.pas' {FrameMemo: TFrame},
  DataModule.Main in 'DataModule.Main.pas' {DataModuleMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModuleMain, DataModuleMain);
  Application.Run;
end.
