unit model_list_of_values;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,DB,class_dbconnection,unit_libstring,
  Dialogs;//,class_init_db;
type

  { TModelListOfValues }

  TModelListOfValues=class
    private
      FConnection :TMyConnection;
      //FDbInit:TInitDB;
      function IsConnected: Boolean;

    public
      constructor Create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;
      function RunQuery(SqlText:string):TDataSource;

  end;

implementation

{ TModelListOfValues }

function TModelListOfValues.IsConnected: Boolean;
begin
  Result := FConnection.Connected;
end;

constructor TModelListOfValues.Create(DatabaseConnection: TDBConnection);
begin
  //inisialisasi connection
  FConnection:=DatabaseConnection.Connection;
end;

destructor TModelListOfValues.Destroy;
begin
  inherited Destroy;
end;

function TModelListOfValues.RunQuery(SqlText: string): TDataSource;
var
  MyQuery:TMyQuery;
begin
  Result:= Nil;
  MyQuery:=TMyQuery.Create(Nil);
  try
    MyQuery.Close;
    MyQuery.Connection:= FConnection;
    MyQuery.SQL.Text:=SqlText;
    MyQuery.Open;
    Result:=TDataSource.Create(Nil);
    Result.DataSet:=MyQuery;
  except
    on E:Exception do
    begin
      ShowMessage('Error : '+E.Message);
      MyQuery.Free;
      Result.Free;
    end;
  end;
end;

end.

