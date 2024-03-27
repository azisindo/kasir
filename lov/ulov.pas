{

--------------------------------------------------------------
- Cara pemanggilan LOV dari Forms lain                       -
- Uses tambahan di form pemanggi LOV -> uconnect,Db,ZDataset,uSetVarGlobal;-
- By Azis - dev2023                                          -
--------------------------------------------------------------

procedure TForm1.Button1Click(Sender: TObject);
var
  FrmLov:TFrmLov;
  ButtonPos: TPoint;
  vSqlForms:string;
  LValues: TStringList;
  //uses uconnect,Db,ZDataset,uSetVarGlobal;
begin
  ButtonPos := Button1.ClientToScreen(Point(0, 0));
  FrmLov    := TFrmLov.Create(Self);
  try
    //Judul LOV
    vSqlForms :='Select msf_id,ms_descp from '+SetVarGlobal.Db1  +'.ms_forms ';

    FrmLov.Caption :='Lov Master Barang';
    FrmLov.SqlLov  := vSqlForms;
    FrmLov.SetJudulLov :='Judul Lov;Id Forms;150;L;Desc;300;L';
    FrmLov.Left    := ButtonPos.X;
    FrmLov.Top     := ButtonPos.Y + Button3.Height;
    FrmLov.ShowModal;

    LValues:=FrmLov.LovSelectedValues;
    get nilai dari LOV
    ShowMessage(LValues[0]);

  finally
    FrmLov.Free;
  end;

 end;

}

unit ULov;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, StrUtils,
  DBGrids,Db, LCLType,uconnect,ZDataset,uSetVarGlobal,libstring  ;

type
  { TFrmLov }
  //TLOVSelectValuesEvent = procedure(const Values: TStringList) of object;
  TLOVSelectValuesEvent = function: TStringList of object;

  TFrmLov = class(TForm)
    DbgLov: TDBGrid;
    EdCariLov: TEdit;
    PnlAtas: TPanel;
    PnlBawah: TPanel;
    PnlEdLov: TPanel;
    PnlTengah: TPanel;
    Query: TZQuery;
    procedure DbgLovKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdCariLovExit(Sender: TObject);
    procedure EdCariLovKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCariLovKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private
    FOnSelectValues: TLOVSelectValuesEvent;
    FConnect:Tconnect;
    FSQLQuery: String;
    FJudulLov: String;
    Fambil:string;
    function GetSelectedValues: TStringList; // Ubah menjadi function yang mengembalikan TStringList
    Procedure Reresh_caption;
    procedure  CustomSplitString(const InputStr, Delimiter: string; var SubStr1, SubStr2: string);

  public
     property OnSelectValues: TLOVSelectValuesEvent read FOnSelectValues write FOnSelectValues;
     property SetJudulLov:string  read  FJudulLov write FJudulLov;
     property SqlLov:string read  FSQLQuery write FSQLQuery;
     property LovSelectedValues: TStringList read GetSelectedValues; // Property untuk mengambil nilai yang dipilih
  end;

var
  FrmLov: TFrmLov;

implementation

{$R *.lfm}

{ TFrmLov }

procedure TFrmLov.DbgLovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 vSelectedValues: TStringList;
begin
  Fambil:='F';
  if key=VK_RETURN then
    begin
      PnlAtas.Visible:=True;
      EdCariLov.SetFocus;
    end;
  if key=  VK_ADD then
    begin
      Fambil :='T';
      if DbgLov.DataSource.DataSet.RecordCount> 0 then
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

  if (Key=VK_F1)  and (ssShift in Shift) then
    ShowMessage('F1 on dev');

end;

procedure TFrmLov.EdCariLovExit(Sender: TObject);
var
 vKey: Word;
begin
  vKey:=VK_RETURN;
  EdCariLovKeyDown(Sender,vKey,[]);
end;

procedure TFrmLov.EdCariLovKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vSqlLov : string;
  v_cur, v_pos : integer ;
  v_temp : string ;
begin
  v_temp:='';
  if Key=VK_ESCAPE then
    begin
      DbgLov.SetFocus;
      PnlAtas.Visible := False;
    end;
  if Key=VK_UP then
    DbgLov.DataSource.DataSet.Prior
  else if Key=VK_DOWN then
    DbgLov.DataSource.DataSet.Next
  else if key=VK_ADD then
    DbgLovKeyDown(Sender,Key,Shift)
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
         DbgLov.Columns.Items[DbgLov.SelectedIndex].FieldName+' like ''%'+EdCariLov.Text+'%'' '+
                  copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1)
      else
        v_temp := copy(vSqlLov,1,v_pos - 1)+' where '+
                  DbgLov.Columns.Items[DbgLov.SelectedIndex].FieldName+' like ''%'+EdCariLov.Text+'%'' '+
                  copy(vSqlLov,v_pos,length(vSqlLov)-v_pos + 1) ;

      v_cur:=DbgLov.SelectedIndex;

      FConnect:=TConnect.Create();
      try
        if FConnect.Connect then
        begin
          Query:=FConnect.ExecuteQuery(v_temp);
          if Query<> nil then
          begin
            FConnect.DataSource.DataSet:= Query;
            DbgLov.DataSource:=FConnect.DataSource;
          end
        end
        else
         ShowMessage(FConnect.Logger);
      finally
       FConnect.Free;
      end;

      DbgLov.SelectedIndex:=v_cur;
      Reresh_caption

    end;
end;

procedure TFrmLov.EdCariLovKeyPress(Sender: TObject; var Key: char);
begin
  Key:=UpCase(Key);
end;

procedure TFrmLov.FormShow(Sender: TObject);
begin
  FConnect:=TConnect.Create();
  try
    if FConnect.Connect then
    begin
      Query:=FConnect.ExecuteQuery(FSQLQuery);
      if Query<> nil then
      begin
        FConnect.DataSource.DataSet:= Query;
        DbgLov.DataSource:=FConnect.DataSource;
      end
    end
    else
     ShowMessage(FConnect.Logger);
  finally
   FConnect.Free;
  end;
  Reresh_caption;
  DbgLov.SetFocus;
end;

function TFrmLov.GetSelectedValues: TStringList;
var
  SelectedValues: TStringList;
  I: Integer;
begin

    SelectedValues := TStringList.Create;
    try
      If Fambil='T' Then
        begin
          for I := 0 to DbgLov.Columns.Count - 1 do
          begin
              if DbgLov.Columns[I].Field <> nil then
                SelectedValues.Add(DbgLov.Columns[I].Field.AsString)
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

procedure TFrmLov.Reresh_caption;
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
    DbgLov.Columns[v_kolom].Title.caption := v_hdr2 ;
    CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;
    DbgLov.Columns[v_kolom].Width := strtoint(v_hdr2) ;

    v_lebar                       := v_lebar + strtoint(v_hdr2) ;
    CustomSplitString( v_hdr1,';',v_hdr2,v_hdr1) ;
    if v_hdr2 = 'R' then DbgLov.Columns[v_kolom].Alignment := taRightJustify
    else if v_hdr2 = 'C' then DbgLov.Columns[v_kolom].Alignment := taCenter
         else DbgLov.Columns[v_kolom].Alignment := taLeftJustify ;

    v_kolom := v_kolom + 1 ;
  end ;


  v_lebar := v_lebar + 39 ;
  if v_lebar < 600 then Width := v_lebar else width := 600 ;


end;

procedure TFrmLov.CustomSplitString(const InputStr, Delimiter: string;
  var SubStr1, SubStr2: string);
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


{
procedure TLOVForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  I: Integer;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Text := 'SELECT * FROM your_table WHERE ';

  for I := 0 to dbGrid.Columns.Count - 1 do
  begin
    if I > 0 then
      query.SQL.Add(' OR ');

    query.SQL.Add(dbGrid.Columns[I].FieldName + ' LIKE :search');
    query.Params.ParamByName('search').AsString := SearchText;
  end;

  query.Open;
end;

---ver 2
procedure TLOVForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  I: Integer;
  ColumnNames: TStringList;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Text := 'SELECT * FROM your_table WHERE ';

  ColumnNames := TStringList.Create;
  try
    for I := 0 to dbGrid.Columns.Count - 1 do
      ColumnNames.Add(dbGrid.Columns[I].FieldName);

    for I := 0 to ColumnNames.Count - 1 do
    begin
      if I > 0 then
        query.SQL.Add(' OR ');

      query.SQL.Add(ColumnNames[I] + ' LIKE :search');
      query.Params.ParamByName('search').AsString := SearchText;
    end;

    query.Open;
  finally
    ColumnNames.Free;
  end;
end;

--ver 3
procedure TLOVForm.PerformSearch;
var
  SearchText: string;
  I: Integer;
  Field: TField;
  SQLQuery: string;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM your_table WHERE 1=0'); // Mendapatkan struktur kolom dari tabel

  // Loop melalui semua kolom dalam dataset dan menambahkan klausa LIKE ke dalam query
  for I := 0 to query.Fields.Count - 1 do
  begin
    Field := query.Fields[I];
    if Field.DataType in [ftString, ftMemo, ftWideString, ftFmtMemo] then
    begin
      SQLQuery := SQLQuery + ' OR ' + Field.FieldName + ' LIKE :search';
      query.Params.ParamByName('search').AsString := SearchText;
    end;
  end;

  query.Open;
end;
--ver 4
procedure TSearchForm.btnSearchClick(Sender: TObject);
var
  SearchText: string;
  SQLQuery: string;
  TableFields: TFieldDefs;
  Field: TFieldDef;
  I: Integer;
begin
  SearchText := '%' + edtSearch.Text + '%';

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('SELECT * FROM produk WHERE 1 = 0'); // Menampilkan struktur kolom dari tabel

  TableFields := query.Fields.Definitions;
  for I := 0 to TableFields.Count - 1 do
  begin
    Field := TableFields.Items[I];
    if (Field.DataType in [ftString, ftMemo, ftWideString, ftFmtMemo]) then
    begin
      if SQLQuery <> '' then
        SQLQuery := SQLQuery + ' OR ';
      SQLQuery := SQLQuery + Field.Name + ' LIKE :search';
      query.Params.ParamByName('search').AsString := SearchText;
    end;
  end;

  if SQLQuery <> '' then
  begin
    query.SQL.Add('AND (' + SQLQuery + ')');
    query.Open;
  end;
end;

}

end.

