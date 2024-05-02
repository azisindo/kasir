unit unit_libstring;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,Types,Variants,StrUtils,
  DateUtils,LCLType,MyAccess,DB,fpjson,jsonparser,LazFileUtils,Dialogs;


procedure getvardatabase;
function getdirectory:string;
Function posisi_str(teks, kt : string ; posisi : integer = 1 ) : integer ;

var

  //setingan koneksi
  g_logger    : string;
  g_hostname  : string;
  g_port      : integer;
  g_database_name: string;
  g_username  : string;
  g_password  : string;
  g_protocl   : string;

  //setingan database

  g_db1: string;
  g_db2: string;
  g_db3: string;

  //setingan lib connectioan

  g_dir_lx  :string;
  g_dir_win :string;
  g_dir_ca_file   : string;  //file cetifikat ssl.

  //setingan user

  g_me_nik   : string;
  g_uu_aktif : string;
  jsonString : string;


implementation

procedure getvardatabase;
var
  jsonFile: TFileStream;
  jsonData: TJSONData;
  jsonObject: TJSONObject;

  {
     "host": "localhost",
     "port": 3306,
     "database": "hrms",
     "username": "root",
     "password": "password",
     "protocol": "mysql",
     "database1": "hrms",
     "database2": "hrms",
     "database3": "hrms",
     "dirLiblx": "//usr//lib//x86_64-linux-gnu//libmariadb.so.3",
     "dirLibwin": "C:\\Program Files\\MariaDB 11.1\\lib\\libmariadb.dll"
   }
begin
  // Membuka file JSON untuk dibaca
  jsonFile := TFileStream.Create('setvar.json', fmOpenRead);
  try
    // Membaca data JSON dari file
    jsonData := GetJSON(jsonFile);
    try
      // Memastikan data yang dibaca adalah objek JSON
      if jsonData is TJSONObject then
      begin
        jsonObject := TJSONObject(jsonData);
        // Mengakses nilai JSON berdasarkan key-nya
        // Misalnya, jika Anda memiliki key "name" di JSON
        // dan Anda ingin mengakses nilai yang terkait dengannya
        // Anda bisa melakukannya seperti ini:
        //jsonString := jsonObject.Get('host');

        g_hostname:= jsonObject.Get('host');
        g_port:=jsonObject.Get('port');
        g_database_name:=jsonObject.Get('database');
        g_username:=jsonObject.Get('username');
        g_password:=jsonObject.Get('password');

        g_db1:=jsonObject.Get('database1');
        g_db2:=jsonObject.Get('database2');
        g_db3:=jsonObject.Get('database3');

        g_dir_lx:=jsonObject.Get('dirlinux');
        g_dir_win:=jsonObject.Get('dirwindows');

        g_dir_ca_file:=jsonObject.Get('cafile');
       //ShowMessage('Nilai JSON untuk key "name": ' + g_hostname);
      end
      else
      begin
        // Data JSON yang dibaca bukan objek, mungkin berbeda dari yang Anda harapkan
        ShowMessage('Data JSON tidak berupa objek.');
      end;
    finally
      // Pastikan untuk membebaskan memori yang dialokasikan untuk data JSON
      jsonData.Free;
    end;
  finally
    // Jangan lupa untuk menutup file JSON setelah selesai membacanya
    jsonFile.Free;
  end;
end;

function getdirectory: string;
begin
  {$IFDEF UNIX}
    Result:= g_dir_lx;
  {$ENDIF}

  {$IFDEF WINDOWS$}
    Result:=g_dir_win;
  {$ENDIF$}
end;

function posisi_str(teks, kt: string; posisi: integer): integer;
begin
  var
    hasil, aposisi, plenteks : integer ;
  begin
    hasil        := 0 ;
    teks         := trim(teks) ;
    plenteks     := length(kt) ;

    for aposisi := posisi to length(teks) do
    begin
      if ( copy(teks,aposisi,plenteks) = kt ) and (hasil = 0) then hasil := aposisi ;
    end ;
    result := hasil ;
end;

end.

