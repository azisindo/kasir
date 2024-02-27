unit unit_one_forms_dtl;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RxDBGrid, MyAccess, unitRMKDBEdit, UnitRMKEdit, unitRMKDBDateEdit,
  unitRMKPanelStandard,class_dbconnection,class_init_db,unit_libstring,model_one_forms_dtl;

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
    procedure FormShow(Sender: TObject);
  private
    FDBConnection: TDBConnection;
    FDBInit:TInitDB;
    FModelOneFormsDtl:TModelOneFormsDtl;

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
  FModelOneFormsDtl:=TModelOneFormsDtl.Create(FDBConnection);

  if not FDBConnection.connect then
    begin
      ShowMessage(FDBConnection.logger);
      exit;
    end;

  FDBInit:=TInitDB.Create(FDBConnection);


  if not FDBInit.InitDB('1234','2000') then
    begin
      ShowMessage(FDBInit.InitLoger);
      Abort;
    end;

  FModelOneFormsDtl.baru(Qry_one_forms,qry_one_form_dtl);

end;

end.

