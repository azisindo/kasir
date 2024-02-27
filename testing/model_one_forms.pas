unit model_one_forms;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,class_dbconnection,Dialogs;
type

  { TModelOneForms }

  TModelOneForms=class
    private
      FConnection : TMyConnection;
      function IsConnected : Boolean;
    public
      constructor Create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;
      procedure GetDataBaru(Query:TMyQuery);
      function SaveData(Query:TMyQuery): Boolean;
      procedure GetEdNO(Query:TMyQuery;EdNoValid:string);
  end;

implementation

{ TModelOneForms }

function TModelOneForms.IsConnected: Boolean;
begin
   Result := FConnection.Connected;
end;

constructor TModelOneForms.Create(DatabaseConnection: TDBConnection);
begin
  FConnection:= DatabaseConnection.Connection;
end;

destructor TModelOneForms.Destroy;
begin
  inherited Destroy;
end;

procedure TModelOneForms.GetDataBaru(Query: TMyQuery);
begin
  //nilai awal
  Query.Close;
  Query.Connection:= FConnection;
  Query.SQL.Text:='select * from laz.one_forms where of_kode=1';
  Query.Open;
  //
  Query.Append;

end;

function TModelOneForms.SaveData(Query: TMyQuery): Boolean;
begin
  result:= False;
  Query.Connection.StartTransaction;
  try
    Query.Post;
    Query.Connection.Commit;
    Result:= True;
  except
    Result:= False;
  end;

end;

procedure TModelOneForms.GetEdNO(Query: TMyQuery; EdNoValid: string);
begin
    Query.Close;
    Query.Connection:= FConnection;
    Query.SQL.Text:='select * from laz.one_forms where of_kode='+EdNoValid;
    Query.Open;

    if query.IsEmpty then
       Query.Append;
end;

end.

