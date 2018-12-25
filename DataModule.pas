unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList, Vcl.Controls, IniFiles;

type
  TDataModule2 = class(TDataModule)
    MainConnection: TADOConnection;
    ImageList1: TImageList;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses MainForm, ModOrdersForm, AddEditForm, editDetail;

{$R *.dfm}


procedure TDataModule2.DataModuleCreate(Sender: TObject);
var
ini : TiniFile;
ServerIP, ServerName: string;
begin
 ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
 ServerIP := ini.ReadString('Connection','ServerIP', '');
 ServerName := ini.ReadString('Connection', 'ServerName', '');
 MainConnection.ConnectionString := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=SalesDB;Data Source='+ServerIP+'\'+ServerName;
 MainConnection.Connected := true;
end;

end.
