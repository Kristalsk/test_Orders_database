program TestKomarov;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {fMain},
  DataModule in 'DataModule.pas' {DataModule2: TDataModule},
  AddEditForm in 'AddEditForm.pas' {fAddEditModal},
  editDetail in 'editDetail.pas' {fEditDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
