unit model_one_forms_dtl;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,MyAccess,DB,class_dbconnection,unit_libstring,Dialogs,class_unit_usaha,class_init_db;

type

  { TModelOneFormsDtl }

  TModelOneFormsDtl=class
    private
      FConnection:TMyConnection;
      FunitUsaha:TUnitUsaha;
      FDbInit:TInitDB;


      function IsConnected: Boolean;

    public
      constructor Create(DatabaseConnection:TDBConnection);
      destructor Destroy; override;

      procedure baru(QryHead:TMyQuery;QryDet:TMyQuery);
      function IsavailableHdr(OfKode:string;UuKode:string):TMyQuery;
      function ReturnSql:string;
      procedure testcallmodel;
      procedure InisialisasiUser(UserId:String;UuId:String);
      procedure EdNoExit(QryHead:TMyQuery;QryDet:TMyQuery);
      procedure save(QryHead:TMyQuery;QryDet:TMyQuery);
      procedure NewRecordHdr(DataSet: TDataSet);
      procedure NewRecordDtl(DataSet: TDataSet);

  end;

implementation
 uses

 unit_one_forms_dtl;

{ TModelOneFormsDtl }

function TModelOneFormsDtl.IsConnected: Boolean;
begin
    Result := FConnection.Connected;
end;

constructor TModelOneFormsDtl.Create(DatabaseConnection: TDBConnection);
begin

  //inisialisasi connection
  FConnection:=DatabaseConnection.Connection;

  //inisialisasi database
  FDBInit    :=TInitDB.Create(DatabaseConnection);

  //inisialisasi unit usaha
  FUnitUsaha :=TUnitUsaha.create(DatabaseConnection);

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

procedure TModelOneFormsDtl.testcallmodel;
begin
  //testing call dari view
  //message di message di model
  ShowMessage('sini error brow...');
  //set focus ke view dari controler
  form_one_form_dtl.edt_of_no.SetFocus;

end;

procedure TModelOneFormsDtl.InisialisasiUser(UserId: String; UuId: String);
begin
  if not FDBInit.InitDB(UserId,UuId) then
    begin
      ShowMessage(FDBInit.InitLoger);
      Abort;
    end;
end;

procedure TModelOneFormsDtl.EdNoExit(QryHead: TMyQuery; QryDet: TMyQuery);
var
  StoreQuery: TMyQuery;
begin
  //cek data di database
  QryHead.Close;
  QryHead.Connection:= FConnection;
  QryHead.SQL.Text:='SELECT * FROM '+g_db1+'.one_forms WHERE of_kode=:edOfNo';
  QryHead.ParamByName('edOfNo').AsString:=form_one_form_dtl.edt_of_no.Text;
  QryHead.Open;

  if QryHead.IsEmpty then
  begin
    showMessage('Nomor Tidak di temukan ');
    form_one_form_dtl.ed_edit_name.Text:='';

    baru(QryHead,QryDet);
  end
  else
  begin
    StoreQuery :=FunitUsaha.ValidasiStoreCode('MT_KODE',form_one_form_dtl.dbe_of_uu.Text);

    if Assigned(StoreQuery) and (not StoreQuery.IsEmpty) then
    begin
     form_one_form_dtl.ed_edit_name.Text:=StoreQuery.FieldByName('MT_NAMA').AsString;
      // Lanjutkan dengan penggunaan dataset di sini jika perlu
    end
    else
    begin
      form_one_form_dtl.dbe_of_uu.SetFocus;
      ShowMessage('Tidak berhasil atau tidak ada data.');
    end;
    StoreQuery.Free; // Pastikan untuk membebaskan dataset setelah selesai menggunakannya


    //ShowMessage(IntToStr(Qry_one_forms.FieldByName('of_kode').AsInteger));
    QryDet.Close;
    QryDet.Connection:= FConnection;
    QryDet.SQL.Text:='SELECT * FROM '+g_db1+'.one_forms_det WHERE  ofd_of_pk=:ofPk';
    QryDet.ParamByName('ofPk').AsInteger:=QryHead.FieldByName('of_pk').AsInteger;
    QryDet.Open;

  end;


end;

procedure TModelOneFormsDtl.save(QryHead: TMyQuery; QryDet: TMyQuery);
begin
  QryHead.Connection:= FConnection;
  QryHead.Edit;
  QryHead.FieldByName('of_kode').AsString:=form_one_form_dtl.edt_of_no.Text;

  QryHead.Connection.StartTransaction;
  try
    QryHead.Post;
    QryHead.Connection.Commit;
  except
    on E:Exception do
    begin
      ShowMessage('Error gagal save '+E.Message );
    end;
  end;

  QryDet.Connection:=FConnection;
  QryDet.Edit;
  QryDet.Connection.StartTransaction;
  try
    QryDet.Post;
    QryDet.Connection.Commit;
  except
    on E:Exception do
    begin
      ShowMessage('Error gagal save dtl '+E.Message );
    end;
  end;

end;

procedure TModelOneFormsDtl.NewRecordHdr(DataSet: TDataSet);
begin
  DataSet.FieldByName('OF_PK').AsInteger:=FDBInit.GetPrimaryKey;
end;

procedure TModelOneFormsDtl.NewRecordDtl(DataSet: TDataSet);
begin
  DataSet.FieldByName('OFD_OF_PK').AsInteger:=form_one_form_dtl.Qry_one_forms.FieldByName('OF_PK').AsInteger;
  DataSet.FieldByName('OFD_PK').AsInteger:=FDBInit.GetPrimaryKey;
end;

end.

