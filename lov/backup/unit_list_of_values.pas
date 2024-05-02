unit unit_list_of_values;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  RxDBGrid, unitRMKPanelStandard,LCLType,unit_libstring,class_dbconnection,
  class_init_db,model_list_of_values;


type

  { Tform_list_of_values }
  TLOVSelectValuesEvent = function: TStringList of object;

  Tform_list_of_values = class(TForm)
    dbg_list_of_values: TRxDBGrid;
    ed_search: TEdit;
    pnl_all: TRMKPanelStandard;
    pnl_tengah: TRMKPanelStandard;
    pnl_bottom: TRMKPanelStandard;
    pnl_top: TRMKPanelStandard;
    SpeedButton1: TSpeedButton;
    procedure dbg_list_of_valuesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_searchExit(Sender: TObject);
    procedure ed_searchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_searchKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    FDBConnection: TDBConnection;
    FModelListOfValues:TModelListOfValues;
    FOnSelectValues: TLOVSelectValuesEvent;
    FSQLQuery: String;
    Fambil:string;
    FJudulLov: String;

    procedure  CustomSplitString(const InputStr, Delimiter: string; var SubStr1, SubStr2: string);
    function GetSelectedValues: TStringList; // Ubah menjadi function yang mengembalikan TStringList

  public
    property OnSelectValues: TLOVSelectValuesEvent read FOnSelectValues write FOnSelectValues;
    property SqlLov:string read  FSQLQuery write FSQLQuery;
    property SetJudulLov:string  read  FJudulLov write FJudulLov;
    Procedure Reresh_caption;
    property LovSelectedValues: TStringList read GetSelectedValues; // Property untuk mengambil nilai yang dipilih


  end;

var
  form_list_of_values: Tform_list_of_values;

implementation

{$R *.lfm}

{ Tform_list_of_values }

procedure Tform_list_of_values.dbg_list_of_valuesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  VSelectedValues: TStringList;
begin
  Fambil :='F';
  if key=VK_RETURN then
    begin
//      PnlAtas.Visible:=True;
      ed_search.SetFocus;
    end;
  if key=  VK_ADD then
    begin
      Fambil :='T';
      if dbg_list_of_values.DataSource.DataSet.RecordCount> 0 then
      begin
        if Assigned(FOnSelectValues) then
          VSelectedValues := FOnSelectValues(); // Memanggil function OnSelectValues untuk mendapatkan TStringList
        Close;
      end;
    end;

  if key= VK_ESCAPE  then
     begin
       Fambil:='F';
       Close;
     end;

  if ((Key=VK_F1)  and (ssShift in Shift)) then
     begin
      ShowMessage('F1 on dev');
     end;
end;

procedure Tform_list_of_values.ed_searchExit(Sender: TObject);
  var
   vKey: Word;
begin
  vKey:=VK_RETURN;
  ed_searchKeyDown(Sender,vKey,[]);
end;

procedure Tform_list_of_values.ed_searchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    vSqlLov : string;
    v_cur, v_pos : integer ;
    v_temp : string ;
  begin
    v_temp:='';
    if Key=VK_ESCAPE then
      begin
        dbg_list_of_values.SetFocus;
        //PnlAtas.Visible := False;
      end;
    if Key=VK_UP then
      dbg_list_of_values.DataSource.DataSet.Prior
    else if Key=VK_DOWN then
      dbg_list_of_values.DataSource.DataSet.Next
    else if key=VK_ADD then
      dbg_list_of_valuesKeyDown(Sender,Key,Shift)
    else if Key=VK_RETURN then
      begin
        if vSqlLov ='' then
           vSqlLov := FSQLQuery;

        v_pos := length(vSqlLov);
        if posisi_str(lowercase(vSqlLov),'order by') > 0 then
          v_pos := posisi_str(lowercase(vSqlLov),'order by') ;

        if posisi_str(lowercase(vSqlLov),'group by') > 0 then
          v_pos := posisi_str(lowercase(vSqlLov),'group by') ;

        if posisi_str(lowercase(vSqlLov),'where') > 0 then
           v_temp := copy(vSqlLov,1,v_pos - 1)+' and '+
           dbg_list_of_values.Columns.Items[dbg_list_of_values.SelectedIndex].FieldName+' like ''%'+ed_search.Text+'%'' '+
                    copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1)
        else
          v_temp := copy(vSqlLov,1,v_pos - 1)+' where '+
                    dbg_list_of_values.Columns.Items[dbg_list_of_values.SelectedIndex].FieldName+' like ''%'+ed_search.Text+'%'' '+
                    copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1) ;

        v_cur:=dbg_list_of_values.SelectedIndex;
        //ShowMessage(v_temp);
        dbg_list_of_values.DataSource:=FModelListOfValues.RunQuery(v_temp);

        //FConnect:=TConnect.Create();
        //try
        //  if FConnect.Connect then
        //  begin
        //    Query:=FConnect.ExecuteQuery(v_temp);
        //    if Query<> nil then
        //    begin
        //      FConnect.DataSource.DataSet:= Query;
        //      DbgLov.DataSource:=FConnect.DataSource;
        //    end
        //  end
        //  else
        //   ShowMessage(FConnect.Logger);
        //finally
        // FConnect.Free;
        //end;

        dbg_list_of_values.SelectedIndex:=v_cur;
        Reresh_caption;

      end;
  end;

procedure Tform_list_of_values.ed_searchKeyPress(Sender: TObject; var Key: char
  );
begin
  Key:=UpCase(Key);
end;

procedure Tform_list_of_values.FormShow(Sender: TObject);
begin

  FDBConnection:=TDBConnection.Create;
  if not FDBConnection.connect then
  begin
    ShowMessage(FDBConnection.logger);
    Abort;
  end;
  FModelListOfValues:=TModelListOfValues.Create(FDBConnection);
  dbg_list_of_values.DataSource:= FModelListOfValues.RunQuery(FSQLQuery);
  Reresh_caption;
  dbg_list_of_values.SetFocus;
end;

procedure Tform_list_of_values.Reresh_caption;
  var
    v_lebar, v_kolom : integer ;
    v_hdr2  : string;
    v_hdr1  : string ;
  begin
    v_hdr1               := FJudulLov;
    v_lebar              := 0 ;
    v_kolom              := 0 ;

    CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;

    while v_hdr1<>'' do
    begin
      CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;
      dbg_list_of_values.Columns[v_kolom].Title.caption := v_hdr2 ;
      CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;
      dbg_list_of_values.Columns[v_kolom].Width := strtoint(v_hdr2) ;

      v_lebar                       := v_lebar + strtoint(v_hdr2) ;
      CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;
      if v_hdr2 = 'R' then dbg_list_of_values.Columns[v_kolom].Alignment := taRightJustify
      else if v_hdr2 = 'C' then dbg_list_of_values.Columns[v_kolom].Alignment := taCenter
           else dbg_list_of_values.Columns[v_kolom].Alignment := taLeftJustify ;

      v_kolom := v_kolom + 1 ;
    end ;


    v_lebar := v_lebar + 39 ;
    if v_lebar < 600 then Width := v_lebar else width := 600 ;

end;

procedure Tform_list_of_values.CustomSplitString(const InputStr,
  Delimiter: string; var SubStr1, SubStr2: string);
  var
    DelimIdx: Integer;
  begin
    DelimIdx := Pos(Delimiter, InputStr);

    if DelimIdx > 0 then
    begin
      SubStr1 := Copy(InputStr, 1, DelimIdx - 1);
      SubStr2 := Copy(InputStr, DelimIdx + Length(Delimiter), Length(InputStr));
    end
    else
    begin
      SubStr1 := InputStr;
      SubStr2 := '';
    end;
end;

function Tform_list_of_values.GetSelectedValues: TStringList;
var
  SelectedValues: TStringList;
  I: Integer;
begin
  SelectedValues := TStringList.Create;
  try
    If Fambil='T' Then
      begin
        for I := 0 to dbg_list_of_values.Columns.Count - 1 do
        begin
            if dbg_list_of_values.Columns[I].Field <> nil then
              SelectedValues.Add(dbg_list_of_values.Columns[I].Field.AsString)
            else
              SelectedValues.Add('');
        end;
      end
    else
       SelectedValues.Add('');

    Result := SelectedValues;
  except
    SelectedValues.Free;
    //raise;
  end;
end;

end.

