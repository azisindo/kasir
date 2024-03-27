unit unit_list_of_values;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  RxDBGrid, unitRMKPanelStandard;

type

  { Tform_list_of_values }

  Tform_list_of_values = class(TForm)
    dbg_list_of_values: TRxDBGrid;
    ed_search: TEdit;
    pnl_all: TRMKPanelStandard;
    pnl_tengah: TRMKPanelStandard;
    pnl_bottom: TRMKPanelStandard;
    pnl_top: TRMKPanelStandard;
    SpeedButton1: TSpeedButton;
  private

  public

  end;

var
  form_list_of_values: Tform_list_of_values;

implementation

{$R *.lfm}

end.

