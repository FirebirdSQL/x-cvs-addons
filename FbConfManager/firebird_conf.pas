(*
 * This unit and its corresponding DFM or XFM file are free software;
 * you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License (LPGL) as published by the Free Software Foundation; either
 * version 2.1 of the License, or any later version.
 * You may obtain a copy of the Licence at
 * http://www.gnu.org/licences/lgpl.html
 *
 * As a special exception this file can also be included in modules
 * with other source code as long as that source code has been
 * released under an Open Source Initiative certified licence.
 * More information about OSI certification can be found at:
 * http://www.opensource.org
 *
 * This module is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public Licence for more details.
 *
 * This module was created by members of the Firebird development
 * team.  All individual contributions remain the Copyright (C) of
 * those individuals and all rights are reserved.  Contributors to
 * this file are either listed below or can be obtained from a CVS
 * history command.
 *
 *  Created by:  Calin Pirtea <pcalin@rdsor.ro>
 *
 ********************* *)

unit firebird_conf;

interface

  uses windows, classes, dialogs, inifiles, registry,
      sysutils;

//There is a section called GENERAL in FBConfManager.lang that contains
//         CurrentLanguage = The language that will be loaded on start
//         FirebirdConf = The Firebird.conf fullpath like 'C:\Firebird\firebird.conf'
//  If anyone thinks there should be more properties added to this section feel
//  free to make sugestions
var
   LanguageFileName : String;   // This will hold the full name of FBConfManager.lang
   LanguageFile     : TIniFile; // This is the object used to manipule FBConfManager.lang

   CurrentLanguage: String; // Current language used when loading application
   Languages: TStringList; // Lists all implemented languages from FBConfManager

   StartupCompleted: Boolean; // If false application won't start

   FirebirdReg: TRegistry; // In case firebirdconf is not set within FBConfManager.lang then
                           // we read from registry. This way several Managers can be used for
                           // several instalations of firebird 1.5
   Firebird_Conf_File:String; // This will hold the full name of firebird.conf
                              // It will be read from FBConfManager.lang first
                              // If that fails then it will try the registry
                              // from 'FirebirdSQL/Firebird/CurrentVersion'
   FB_NotInstalled: String; // This Is only a placeholder for Item 'FB_NotInstalled' found
                            // in FBConfManager.lang. It will display when Firebird.conf
                            // cannot be found nor in FBConfManager.lang nor in registry.


   FirebirdConf_Items: TStringList; // This will be the container of firebird.conf

Const
  FBRegKey = 'Software\FirebirdSQL\Firebird\CurrentVersion';
  FB_ItemCount = 36;
  // This one should contain more info if we want to be acting as a helper
  // something like Value Type (aka: numeric, ip_address, file_name... bla bla
  FB_Items:array[1..FB_ItemCount,1..2] of string
      =(('RootDirectory',''),
        ('ExternalTablesDirs',''),
        ('DefaultDbCachePages','2048'),
        ('SortMemBlockSize','1048576'),
        ('SortMemUpperLimit','67108864'),
        ('OldParameterOrdering','0'),
        ('CompleteBooleanEvaluation','0'),
        ('DeadlockTimeout','10'),
        ('EventMemSize','65536'),
        ('MaxUnflushedWrites','100'),
        ('MaxUnflushedWriteTime','5'),
        ('ConnectionTimeout','180'),
        ('DummyPacketInterval','60'),
        ('RemoteServiceName','gds_db'),
        ('RemoteServicePort','3050'),
        ('RemoteAuxPort','0'),
        ('TcpRemoteBufferSize','8192'),
        ('TcpNoNagle','0'),
        ('RemoteBindAddress',''),
        ('LockMemSize','262144'),
        ('LockSemCount','32'),
        ('LockGrantOrder','1'),
        ('LockRequireSpins','0'),
        ('LockHashSlots','101'),
        ('CpuAffinityMask','1'),
        ('PrioritySwitchDelay','100'),
        ('DeadThreadsCollection','50'),
        ('PriorityBoost','5'),
        ('GuardianOption','1'),
        ('ProcessPriorityLevel','0'),
        ('IpcMapSize','4096'),
        ('IpcName','FirebirdIPI'),
        ('RemotePipeName','interbas'),
        ('CreateInternalWindow','1'),
        ('LockSignal','16'),
        ('RemoteFileOpenAbility','0'));


procedure Load_Firebird_conf;
procedure Load_Comment(ItemList: TStrings; Item: String);

implementation

procedure Load_Comment(ItemList: TStrings; Item: String);
var
  s : string;
begin
  s := LanguageFile.ReadString(CurrentLanguage,Item,'');
  while true do
    begin
    if pos('\n',s)>0 then
      begin
      ItemList.Add(copy(s,1,pos('\n',s)-1));
      Delete(s,1,pos('\n',s)+1);
      end
    else
      begin
      ItemList.Add(s);
      s:='';
      end;
    if s='' then exit;
    end;
end;

// Load Firebird.conf
procedure Load_Firebird_conf;
var
  i : integer;
  s : string;
begin
  FirebirdConf_Items.LoadFromFile(Firebird_Conf_File);
  for i:=0 to FirebirdConf_Items.Count-1 do
    if copy(FirebirdConf_Items.Strings[i],1,1)<>'#' then
      while pos(' =',FirebirdConf_Items.Strings[i])>0 do
        begin
        s:=FirebirdConf_Items.Strings[i];
        Delete(s,pos(' =',s),1);
        FirebirdConf_Items.Strings[i]:=s;
        end;

  for i:=0 to FirebirdConf_Items.Count-1 do
    if copy(FirebirdConf_Items.Strings[i],1,1)<>'#' then
    while pos('= ',FirebirdConf_Items.Strings[i])>0 do
      begin
      s := FirebirdConf_Items.Strings[i];
      Delete(s,pos('= ',s)+1,1);
      FirebirdConf_Items.Strings[i]:=s;
      end;
end;


// Code initialization
initialization

  // We expect the language file to be in the same folder as our application.
  // Since all strings are herein it should better be!!!
  StartupCompleted := False;
  LanguageFileName := ExtractFilePath(ParamStr(0)) + 'FBConfManager.lang';

  if not FileExists(LanguageFileName) then
    begin
    MessageBox( 0, 'Missing Language file. Please copy FBConfManager.lang ' +
      'in the same directory as the application.',
      'Error !!!',16);
      exit;
    end;
  LanguageFile   := TIniFile.Create(LanguageFileName);
  CurrentLanguage:= LanguageFile.ReadString('GENERAL','CurrentLanguage','');
  if CurrentLanguage='' then
    CurrentLanguage:='ENGLISH';
  FB_NotInstalled := LanguageFile.ReadString(CurrentLanguage,'FBConf_FB_NotInstalled','Firebird Server 1.5 is not found! Please edit FBConfManager.lang manualy');
  Languages:=TStringList.Create;
  LanguageFile.ReadSections(Languages);

  // I have to erase the section GENERAL as it is not a language section
  if Languages.IndexOf('GENERAL')>=0 then
    Languages.Delete(Languages.IndexOf('GENERAL'));

  // Searching for firebird.conf file
  // First we look for it as a command line parameter
  FirebirdConf_Items := TStringList.Create;
  if ParamCount>0 then
    begin
    Firebird_Conf_File := ParamStr(1);
    if not FileExists(Firebird_Conf_File) then
      Firebird_Conf_File := ExtractFilePath(ParamStr(0)) + 'Firebird.conf';
    end
  // If there is no parameter, we will try to find it at current path
  else
    Firebird_Conf_File := ExtractFilePath(ParamStr(0)) + 'Firebird.conf';

  if not FileExists(Firebird_Conf_File) then
    Firebird_Conf_File := '';

  // Keep looking... This time using the registry
  if Firebird_Conf_File='' then
    begin
    FirebirdReg := TRegistry.Create;
    FirebirdReg.RootKey := HKEY_LOCAL_MACHINE;
    if not FirebirdReg.OpenKey( FBRegKey ,False) then
      begin
      ShowMessage( FB_NotInstalled );
      FirebirdReg.CloseKey;
      FirebirdReg.Free;
      exit;
      end;
    Firebird_Conf_File := FirebirdReg.ReadString('RootDirectory')+'Firebird.conf';
    FirebirdReg.CloseKey;
    FirebirdReg.Free;
    end;

  if not FileExists(Firebird_Conf_File) then
    begin
    MessageBox(0,PChar('Missing '+Firebird_Conf_File+' file. '+
      'Please verify that your firebird server is properly installed.'),
      'Error !!!',16);
    exit;
    end;

  // We've completed all startup operation, so we may proceed.
  StartupCompleted:=True;

finalization
  // It seems that Delphi is taking good care of releasing all objects without
  // my intervention
end.

