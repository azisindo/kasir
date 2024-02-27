program OneFormsDtl;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, rxnew, unit_one_forms_dtl, class_dbconnection,
  mydac10, model_one_forms_dtl, class_init_db, unit_libstring
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tform_one_form_dtl, form_one_form_dtl);
  Application.Run;
end.

