unit class_dbconnection;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,unit_libstring
type

  { TDBConnection }

  TDBConnection = class
    private
      FConnection: TMyConnection;
      Flogger: string;
    public
      constructor Create;
      destructor Destroy; override;
      function connect:Boolean;
      procedure Disconnect;
      function IsConnected:Boolean;
      property Connection:TMyConnection read FConnection;
      function logger:string;
  end;

implementation

{ TDBConnection }

constructor TDBConnection.Create;
begin
  getvardatabase;

  FConnection:= TMyConnection.Create(Nil);

  FConnection.Server:=g_hostname;
  FConnection.Username:=g_username;
  FConnection.Password:=g_password;
  FConnection.Port:=g_port;
  FConnection.Database:=g_database_name;

  FConnection.SSLOptions.CACert:=g_dir_ca_file;
  FConnection.LoginPrompt:=False;

end;

destructor TDBConnection.Destroy;
begin
  Disconnect;
  FConnection.Free;
  inherited Destroy;
end;

function TDBConnection.connect: Boolean;
begin
  try
    FConnection.Open;
    Result:= FConnection.Connected;
  Except
    on E: Exception do
    begin
      Flogger:='Gagal Koneksi '+E.Message;
      Result:= False;
    end;
  end;
end;

procedure TDBConnection.Disconnect;
begin
  if FConnection.Connected then
     FConnection.Close;
end;

function TDBConnection.IsConnected: Boolean;
begin
  Result:= FConnection.Connected;
end;

function TDBConnection.logger: string;
begin
  Result:= Flogger;
end;

end.

