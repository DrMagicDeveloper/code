program TestClasses;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uAboutBox in 'C:\3rdParty\General\uAboutBox.pas' {frmAboutBox},
  uGlobalHelper in 'C:\3rdParty\General\uGlobalHelper.pas',
  Stringy in '..\Delphi7Apps\Stringy.pas',
  HotLog in 'C:\3rdParty\Logging\HotLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmAboutBox, frmAboutBox);
  Application.Run;
end.
