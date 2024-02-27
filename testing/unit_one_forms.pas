unit unit_one_forms;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  MyAccess, unitRMKDBEdit, unitRMKDBCalendar, unitRMKPanelWarna,
  unitRMKDBDateEdit, UnitRMKEdit, DB, class_dbconnection, unit_libstring,
  model_one_forms;

type

  { Tform_one_form }

  Tform_one_form = class(TForm)
    ds_one_form: TMyDataSource;
    ed_no: TRMKEdit;
    lbl_kode_form: TLabel;
    lbl_nama_form: TLabel;
    lbl_tgl_form: TLabel;
    mydbconn: TMyConnection;
    qry_m_form: TMyQuery;
    qry_m_formof_kode: TLongintField;
    qry_m_formof_nama: TStringField;
    qry_m_formof_tgl_form: TDateField;
    RMKDBDateEdit1: TRMKDBDateEdit;
    RMKDBEdit1: TRMKDBEdit;
    RMKPanelWarna1: TRMKPanelWarna;
    procedure ed_noExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RMKPanelWarna1Click(Sender: TObject);
  private
    FDBConnection: TDBConnection;
    FModelOneForms:TModelOneForms;

  public

  end;

var
  form_one_form: Tform_one_form;

implementation

{$R *.lfm}

{ Tform_one_form }

procedure Tform_one_form.RMKPanelWarna1Click(Sender: TObject);
begin

  qry_m_form.FieldByName('of_kode').AsInteger :=StrToInt(ed_no.Text);

  if not FModelOneForms.SaveData(qry_m_form) then
  begin
    ShowMessage('gagal di simpan');
    Abort;
  end;

  ShowMessage('Save Berhasil');
end;

procedure Tform_one_form.FormShow(Sender: TObject);
begin
  FDBConnection:= TDBConnection.Create;

  if not FDBConnection.connect then
  begin
    ShowMessage(FDBConnection.logger);
    exit;
  end;

  FModelOneForms:=TModelOneForms.Create(FDBConnection);
  FModelOneForms.GetDataBaru(qry_m_form);


end;

procedure Tform_one_form.ed_noExit(Sender: TObject);
begin

  //validasi forms
  if trim(ed_no.Text)='' then
  begin
    ShowMessage('Nomor Forms harus di isi');
    ed_no.SetFocus;
    Abort;
  end;

  //validasi jika sudah ada atu belum di database
  FModelOneForms.GetEdNO(qry_m_form,ed_no.Text);

end;

end.

