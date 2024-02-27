unit class_libstring;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Variants,StrUtils,DateUtils,LCLType,MyAccess,DB,fpjson,jsonparser,LazFileUtils,Dialogs;

procedure getvardatabase;

var
   g_HostName     : string;
   g_Port         : integer;
   g_database_name : string;
   g_UserName     : string;
   g_Password     : string;
   g_protocol     : string;

   //Setingan Database
   g_db1          : String;
   g_db2          : String;
   g_db3          : String;

   //Setingan Lib connection
   g_dir_linux       : String;
   g_dir_windows     : String;
   g_dir_ca_file     : String;


implementation

procedure getvardatabase;
var
  JsonData: TJSONData;
  jsonFile: TFileStream;
begin
  jsonFile := TFileStream.Create('SetVar.json', fmOpenRead);
  JsonData := GetJSON(jsonFile);
  try
    if Assigned(JsonData) then
    begin
      g_HostName := JsonData.FindPath('host').AsString;
      g_Port := JsonData.FindPath('port').AsInteger;
      g_database_name := JsonData.FindPath('database').AsString;
      g_UserName := JsonData.FindPath('username').AsString;
      g_Password := JsonData.FindPath('password').AsString;
      g_protocol := JsonData.FindPath('protocol').AsString;

      g_db1 := JsonData.FindPath('database1').AsString;
      g_db2 := JsonData.FindPath('database2').AsString;
      g_db3 := JsonData.FindPath('database3').AsString;

      g_dir_linux := JsonData.FindPath('dirlinux').AsString;
      g_dir_windows := JsonData.FindPath('dirLibwin').AsString;
      g_dir_ca_file:=JsonData.FindPath('cafile').AsString;;
    end
    else
    begin
      // Handle error when JSON data is not available
      // For example:
      // ShowMessage('Error: JSON data is not available');
    end;
  finally
    JsonData.Free;
    jsonFile.Free;
  end;

end;

end.

