unit class_unit_usaha;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,class_dbconnection,unit_libstring,Dialogs;

type

  { TUnitUsaha }

  TUnitUsaha=class
    private
      FConnection : TMyConnection;
      function IsConnected:Boolean;
    public
      constructor create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;
      function CheckStoreCode(StoreId:string):Boolean;
      function ValidasiStoreCode (fieldId:string;paramId:string):TMyQuery;

  end;


implementation

{ TUnitUsaha }

function TUnitUsaha.IsConnected: Boolean;
begin
   Result:= FConnection.Connected;
end;

constructor TUnitUsaha.create(DatabaseConnection: TDBConnection);
begin
  FConnection:=DatabaseConnection.Connection;
end;

destructor TUnitUsaha.Destroy;
begin
  inherited Destroy;
end;

function TUnitUsaha.CheckStoreCode(StoreId: string): Boolean;
var
  QryStore : TMyQuery;
begin
  Result := False; // default value

  try
    QryStore := TMyQuery.Create(nil);
    try
      QryStore.Close;
      QryStore.Connection := FConnection;
      QryStore.SQL.Text := 'SELECT mt_kode FROM ' + g_db1 + '.m_toko WHERE mt_kode = :StoreId';
      QryStore.ParamByName('StoreId').AsString := StoreId;
      QryStore.Open;

      if not QryStore.IsEmpty then
        Result := True;
    except
      on E: Exception do
      begin
        // Debug
        ShowMessage('Error occurred in CheckStoreCode: ' + E.Message);
        // Handle exception here, such as logging
      end;
    end;
  finally
    QryStore.Free;
  end;
end;

function TUnitUsaha.ValidasiStoreCode(fieldId: string; paramId: string
  ): TMyQuery;
begin
  Result := TMyQuery.Create(nil);
  try
    Result.Close;
    Result.Connection := FConnection;
    Result.SQL.Text := 'SELECT * FROM ' + g_db1 + '.m_toko WHERE '+fieldId+' = :paramId';
    Result.ParamByName('paramId').AsString := paramId;
    Result.Open;
  except
    on E: Exception do
    begin
      ShowMessage('Error occurred in CheckStoreCode: ' + E.Message);
      Result.Free;
      Result := nil;
    end;
  end;
end;

end.

