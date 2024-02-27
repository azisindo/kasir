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
  QryDet.SQL.Text:='select * from '+g_db1+'.one_forms_det whre ofd_of_pk=0';
  QryDet.Open;

end;

end.

