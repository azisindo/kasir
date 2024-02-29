unit unit_one_forms_dtl;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RxDBGrid, MyAccess, unitRMKDBEdit, UnitRMKEdit, unitRMKDBDateEdit,
  unitRMKPanelStandard,class_dbconnection,class_init_db,unit_libstring,model_one_forms_dtl,
  class_unit_usaha,LCLType,StrUtils;

type

  { Tform_one_form_dtl }

  Tform_one_form_dtl = class(TForm)
    Button1: TButton;
    ConnMyDb: TMyConnection;
    dbe_ofNama: TRMKDBEdit;
    dbe_of_tgl_form: TRMKDBDateEdit;
    Ds_Form_Head: TMyDataSource;
    ds_one_forms_det: TMyDataSource;
    edt_of_no: TRMKEdit;
    ed_edit_name: TRMKEdit;
    lbl_nama_form: TLabel;
    lbl_no_form: TLabel;
    lbl_of_tgl_form: TLabel;
    pnl_atas: TRMKPanelStandard;
    pnl_bawah: TRMKPanelStandard;
    Qry_one_forms: TMyQuery;
    Qry_one_formsof_ins_date: TDateField;
    Qry_one_formsof_ins_user: TStringField;
    Qry_one_formsof_kode: TLongintField;
    Qry_one_formsof_nama: TStringField;
    Qry_one_formsof_pk: TLongintField;
    Qry_one_formsof_tgl_form: TDateField;
    qry_one_form_dtl: TMyQuery;
    qry_one_form_dtlofd_ins_date: TDateField;
    qry_one_form_dtlofd_ins_user: TStringField;
    qry_one_form_dtlofd_jumlah: TLongintField;
    qry_one_form_dtlofd_ket_forms: TStringField;
    qry_one_form_dtlofd_of_pk: TLongintField;
    qry_one_form_dtlofd_pk: TLongintField;
    rdbg_one_forms_det: TRxDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure edt_of_noExit(Sender: TObject);
    procedure KeyDownAll(Sender: TObject; var Key: Word; Shift:TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Qry_one_formsNewRecord(DataSet: TDataSet);
    procedure qry_one_form_dtlNewRecord(DataSet: TDataSet);
  private
    FDBConnection: TDBConnection;
    FDBInit:TInitDB;
    FModelOneFormsDtl:TModelOneFormsDtl;
    FunitUsaha:TUnitUsaha;

  public

  end;

var
  form_one_form_dtl: Tform_one_form_dtl;

implementation

{$R *.lfm}
{ Tform_one_form_dtl }

procedure Tform_one_form_dtl.FormShow(Sender: TObject);
begin
  FDBConnection:=TDBConnection.Create;
  if not FDBConnection.connect then
  begin
    ShowMessage(FDBConnection.logger);
    exit;
  end;
  //inisialisasi seting db
  FDBInit:=TInitDB.Create(FDBConnection);
  if not FDBInit.InitDB('1234','2000') then
    begin
      ShowMessage(FDBInit.InitLoger);
      Abort;
    end;

  //form model dtl.
  FModelOneFormsDtl:=TModelOneFormsDtl.Create(FDBConnection);
  FModelOneFormsDtl.baru(Qry_one_forms,qry_one_form_dtl);

  //inisilisasi master Store
  FUnitUsaha:=TUnitUsaha.create(FDBConnection);
end;

procedure Tform_one_form_dtl.Qry_one_formsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('OF_PK').AsInteger:=FDBInit.GetPrimaryKey;
end;

procedure Tform_one_form_dtl.qry_one_form_dtlNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('OFD_OF_PK').AsInteger:=Qry_one_forms.FieldByName('OF_PK').AsInteger;
  DataSet.FieldByName('OFD_PK').AsInteger:=FDBInit.GetPrimaryKey;
end;

procedure Tform_one_form_dtl.edt_of_noExit(Sender: TObject);
var
  StoreQuery: TMyQuery;
begin
  StoreQuery :=FunitUsaha.ValidasiStoreCode('MT_KODE',edt_of_no.Text);

  if Assigned(StoreQuery) and (not StoreQuery.IsEmpty) then
  begin
    ed_edit_name.Text:=StoreQuery.FieldByName('MT_NAMA').AsString;
    // Lanjutkan dengan penggunaan dataset di sini jika perlu
  end
  else
  begin
    edt_of_no.SetFocus;
    ShowMessage('Tidak berhasil atau tidak ada data.');
  end;

  StoreQuery.Free; // Pastikan untuk membebaskan dataset setelah selesai menggunakannya
  qry_one_form_dtl.Edit;

end;

procedure Tform_one_form_dtl.Button1Click(Sender: TObject);
begin
  Qry_one_forms.Connection.StartTransaction;
  try
    Qry_one_forms.Post;
    Qry_one_forms.Connection.Commit;
  except
    on E:Exception do
    begin
      ShowMessage('Error gagal save '+E.Message );
    end;
  end;

  qry_one_form_dtl.Connection.StartTransaction;
  try
    qry_one_form_dtl.Post;
    qry_one_form_dtl.Connection.Commit;
  except
    on E:Exception do
    begin
      ShowMessage('Error gagal save dtl '+E.Message );
    end;
  end;
end;

procedure Tform_one_form_dtl.KeyDownAll(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key Of
      VK_RETURN:
      begin
        if (Sender=rdbg_one_forms_det) then

        else
          SelectNext(ActiveControl,True,True);
      end;

      VK_F2: ShowMessage('F2');
      VK_F3: ShowMessage('F3');
  end;
end;

end.

