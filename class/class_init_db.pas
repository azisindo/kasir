unit class_init_db;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,class_dbconnection,unit_libstring;

type

  { TInitDB }

  TInitDB=Class
    private
      FConnection:TMyConnection;
      FInitlogger: string;
      function IsConnected:Boolean;
    public
      constructor Create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;
      function InitDB(G_Nik:string;G_Uu_Code_Aktif:string):Boolean;
      function InitLoger:string;
      function GetPrimaryKey:Integer;



  end;

implementation

{ TInitDB }

function TInitDB.IsConnected: Boolean;
begin
   Result:=FConnection.Connected;
end;

constructor TInitDB.Create(DatabaseConnection: TDBConnection);
begin
  FConnection:=DatabaseConnection.Connection;
end;

destructor TInitDB.Destroy;
begin
  inherited Destroy;
end;

function TInitDB.InitDB(G_Nik: string; G_Uu_Code_Aktif: string): Boolean;
begin
  Result:= True;
  try
    FConnection.ExecSQL('CALL '+g_db1+'.P_INIT("'+G_Nik+'","'+G_Uu_Code_Aktif+'") ',[null]);
  Except
    on E: Exception do
    begin
      FInitlogger:='Info Error CALL P_INIT : '+E.Message;
      Result:= False;
    end;
  end;
end;

function TInitDB.InitLoger: string;
begin
  Result:= FInitlogger;
end;

function TInitDB.GetPrimaryKey: Integer;
var
  QryGetPk : TMyQuery;
begin
  try
    QryGetPk:= TMyQuery.Create(nil);
    try
      QryGetPk.Close;
      QryGetPk.Connection:= FConnection;
      QryGetPk.SQL.Text:='SELECT '+g_db1+'.f_get_pk() pk';
      QryGetPk.Open;
      if not QryGetPk.IsEmpty then
         Result:=StrToInt(QryGetPk.FieldByName('pk').AsString);

    except
      on E: Exception do
      begin
        FInitlogger:='Info Error Call get pk '+E.Message;
        Raise;
      end;
    end;
  finally
    QryGetPk.Free;
  end;
end;

end.

