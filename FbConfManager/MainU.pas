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
 *  Contributor(s):
 *
 *    Artur Anjos <artur@arsoft.pt>
 *       Some minor arrangements and some code comments; icon;
 *       Portuguese Translation; readme File's
 *
 ********************* *)
unit MainU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ShellApi, ComCtrls, Buttons, Menus;

type
  TMainForm = class(TForm)
    PTools: TPanel;
    PanVersion: TPanel;
    PanVisit: TPanel;
    LbUrl: TLabel;
    LbVisit: TLabel;
    PButtons: TPanel;
    Panel3: TPanel;
    Panel1: TPanel;
    ImFb: TImage;
    LFirebirdLabel: TLabel;
    Panel4: TPanel;
    FB_List: TListView;
    BReadConfig: TBitBtn;
    BWriteConfig: TBitBtn;
    BLanguage: TBitBtn;
    PLanguage: TPanel;
    PModified: TPanel;
    Panel6: TPanel;
    Item_Comments: TMemo;
    ItemValue: TEdit;
    LItemValue: TLabel;
    BSaveValue: TBitBtn;
    BCancelValue: TBitBtn;
    PMLanguage: TPopupMenu;
    LbConfFile: TLabel;
    LbVersion: TLabel;
    procedure LbUrlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FB_ListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure BReadConfigClick(Sender: TObject);
    procedure BWriteConfigClick(Sender: TObject);
    procedure BCancelValueClick(Sender: TObject);
    procedure ItemValueChange(Sender: TObject);
    procedure FB_ListKeyPress(Sender: TObject; var Key: Char);
    procedure ItemValueKeyPress(Sender: TObject; var Key: Char);
    procedure BLanguageClick(Sender: TObject);
  private
    { Private declarations }
    procedure OnLanguageClick(Sender: TObject);
    procedure ChangeLanguage;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

const
  // If you are going to update this,
  // please update version_info.txt as well
  // dpcumenting the changes
  VersionInfo : string = 'Version 1.00';


implementation

{$R *.DFM}

uses firebird_conf;
{FBConfManager.lang}

procedure TMainForm.LbUrlClick(Sender: TObject);
begin
  // Open URL on the browser
  if Sender is TLabel then
    ShellExecute(Handle, 'open', PChar(TLabel(Sender).Caption), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.OnLanguageClick(Sender: TObject);
begin
  LanguageFile.WriteString('GENERAL','CurrentLanguage',TMenuItem(Sender).Caption);
  CurrentLanguage :=  TMenuItem(Sender).Caption;
  ChangeLanguage;
  FB_ListSelectItem(FB_List, FB_List.Selected, True);
end;

procedure TMainForm.ChangeLanguage;
Var LanguageName:String;
begin
  BReadConfig.Caption   := LanguageFile.ReadString(CurrentLanguage,'FBConf_BReadConfig','Read configuration file');
  BWriteConfig.Caption  := LanguageFile.ReadString(CurrentLanguage,'FBConf_BWriteConfig','Save configuration file to disk');
  BLanguage.Caption     := LanguageFile.ReadString(CurrentLanguage,'FBConf_BLanguage','Change language');
  LItemValue.Caption    := LanguageFile.ReadString(CurrentLanguage,'FBConf_LItemValue','Modify the value here:');
  BSaveValue.Caption    := LanguageFile.ReadString(CurrentLanguage,'FBConf_BSaveValue','Save');
  BCancelValue.Caption  := LanguageFile.ReadString(CurrentLanguage,'FBConf_BCancelValue','Cancel');
  LbVisit.Caption       := LanguageFile.ReadString(CurrentLanguage,'FBConf_LbVisit','Visit');
  if PModified.Caption<>'' then
    PModified.Caption := LanguageFile.ReadString(CurrentLanguage,'FBConf_PModified','Don''t forget to save!');
  LanguageName  := LowerCase(CurrentLanguage);
  Delete(LanguageName,1,1);
  LanguageName      := CurrentLanguage[1]+LanguageName;
  PLanguage.Caption := LanguageName + ' Language';
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i : integer;
begin
  // Showing Version Info and Path to firebird.conf
  LbVersion.Caption  := VersionInfo;
  LbConfFile.Caption := Firebird_Conf_File;
  BReadConfigClick(BReadConfig);
  for i:=0 to Languages.Count-1 do
    PMLanguage.Items.Add(NewItem(Languages.Strings[i],0,False,True,
      OnLanguageClick,0,Languages.Strings[i]));
  ChangeLanguage;
end;

procedure TMainForm.FB_ListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  Item_Comments.ReadOnly:=False;
  Item_Comments.Clear;
  Item_Comments.ReadOnly:=True;
  Load_Comment( Item_Comments.Lines, Item.Caption );
  ItemValue.Text:=FirebirdConf_Items.Values[Item.Caption];
end;

procedure TMainForm.BReadConfigClick(Sender: TObject);
var
  i:integer;
  CurrentItem: TListItem;
begin
  // I'm loading the contents of Firebird.conf into the TStringList
  Load_Firebird_conf;

  // And the fill up the ListView
  FB_List.ReadOnly:=False;
  FB_List.Items.BeginUpdate;
  FB_List.Items.Clear;
  for i:=1 to FB_ItemCount do
    begin
    CurrentItem:=FB_List.Items.Add;
    CurrentItem.Caption:=FB_Items[i,1];
    CurrentItem.SubItems.Add(FirebirdConf_Items.Values[FB_Items[i,1]]);
    CurrentItem.SubItems.Add(FB_Items[i,2]);
    end;
  FB_List.Items.EndUpdate;
  FB_List.ReadOnly:=True;
  FB_List.Selected:=FB_List.TopItem;
  FB_List.ItemFocused:=FB_List.Selected;
  if Visible then FocusControl(FB_List);
end;

// Save the contents of the TStringList to disk (Firebird.conf)
procedure TMainForm.BWriteConfigClick(Sender: TObject);
begin
  FirebirdConf_Items.SaveToFile(Firebird_Conf_File);
  FocusControl(FB_List);
  PModified.Caption:='';
end;

procedure TMainForm.BCancelValueClick(Sender: TObject);
begin
  if Sender=BSaveValue then
    begin
    // If we want we can perform here aditional check to ensure correctness
    FirebirdConf_Items.Values[FB_List.Selected.Caption]:=ItemValue.Text;
    FB_List.Selected.SubItems[0]:=ItemValue.Text;
    PModified.Caption:=LanguageFile.ReadString(CurrentLanguage,'FBConf_PModified','Don''t forget to save!');
    end;
  FB_ListSelectItem(FB_List, FB_List.Selected, True);
  FB_List.Enabled :=  True;
  FocusControl(FB_List);
  BReadConfig.Enabled   := True;
  BWriteConfig.Enabled  := True;
  BLanguage.Enabled     := True;
  BSaveValue.Enabled    := False;
  BCancelValue.Enabled  := False;
end;

procedure TMainForm.ItemValueChange(Sender: TObject);
begin
  if ActiveControl<>sender then exit;
  FB_List.Enabled:=False;
  BReadConfig.Enabled:=False;
  BWriteConfig.Enabled:=False;
  BLanguage.Enabled:=False;
  BSaveValue.Enabled:=True;
  BCancelValue.Enabled:=True;
end;

procedure TMainForm.FB_ListKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then FocusControl(ItemValue);
end;

procedure TMainForm.ItemValueKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) and not BSaveValue.Enabled then FocusControl(FB_List);
end;

procedure TMainForm.BLanguageClick(Sender: TObject);
var
  Coordinates: TPoint;
  PopupHeight: Integer;
begin
  Coordinates.x:=0;
  Coordinates.y:=0;
  Coordinates:=BLanguage.ClientToScreen(Coordinates);
  PopupHeight:=PMLanguage.Items.Count*GetSystemMetrics(SM_CYMENUSIZE);
  PMLanguage.Popup(Coordinates.x, Coordinates.y-PopupHeight);
end;

end.
