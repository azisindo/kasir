unit model_one_forms_dtl;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,class_dbconnection,unit_libstring,Dialogs;

type

  { TModelOneFormsDtl }

  TModelOneFormsDtl=class
    private
      FConnection:TMyConnection;
      function IsConnected: Boolean;
    public
      constructor Create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;
      procedure baru(QryHead:TMyQuery;QryDet:TMyQuery);
      function IsavailableHdr(OfKode:string;UuKode:string):TMyQuery;
      function ReturnSql:string;

  end;

implementation


{ TModelOneFormsDtl }

function TModelOneFormsDtl.IsConnected: Boolean;
begin
    Result := FConnection.Connected;
end;

constructor TModelOneFormsDtl.Create(DatabaseConnection: TDBConnection);
begin
   FConnection:=DatabaseConnection.Connection;
end;

destructor TModelOneFormsDtl.Destroy;
begin
  inherited Destroy;
end;

procedure TModelOneFormsDtl.baru(QryHead: TMyQuery; QryDet: TMyQuery);
begin
  QryHead.Close;
  QryHead.Connection:= FConnection;
  QryHead.SQL.Text:='select * from '+g_db1+'.one_forms where of_pk=0';
  QryHead.Open;

  QryDet.Close;
  QryDet.Connection:= FConnection;
  QryDet.SQL.Text:='select * from '+g_db1+'.one_forms_det where ofd_of_pk=0';
  QryDet.Open;

end;

function TModelOneFormsDtl.IsavailableHdr(OfKode: string; UuKode: string
  ): TMyQuery;
begin
  Result:=TMyQuery.Create(nil);
  Try
    Result.Close;
    Result.SQL.Text:='';
  except
    on E:Exception do
    begin
       ShowMessage('Error occurred in CheckStoreCode: ' + E.Message);
       Result.Free;
       Result := nil;
    end;
  end;
end;

function TModelOneFormsDtl.ReturnSql: string;
begin
  Result :='sql';
end;

end.

