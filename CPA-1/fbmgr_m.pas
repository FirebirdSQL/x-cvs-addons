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
 *  Created by:  Artur Anjos <artur@arsoft.pt>
 *
 *  Contributor(s):
 *
 *    Paulo Vaz <paulo@multi-informatica.com.br>
 *       Application Icon and End look;
 *    Thomas Steinmaurer <ts@iblogmanager.com>
 *       German Translation;
 *    Giannis Tsopokis <ogiannhs@yahoo.gr>
 *       Greek Translation;
 *    Philippe Makowski <makowski@firebird-fr.eu.org>
 *       French Translation;
 *    Pirtea Calin <pcalin@rdsor.ro>
 *       Romanian Translation;
 *    Çağatay Tengiz <c.tengiz@etapholding.com>
 *       Turkish Translation;
 *    Ricardo Muñoz V. <rmunoz@enfasis.cl>
 *       Spanish Version;
 *    Robbert-Jan Mittendorff <rjm@xs4all.nl>
 *       Dutch Version;
 *    Marko Trstenjak <trstenjak@volja.net>
 *       Slovenian Version;
 *    Marco Kregar <mkregar@esys.it>
 *       Italian Version
 *    Tsutomu Hayashi <hayashi@apex-jp.com>
 *       Japanese Version
 *
 *    Thanks to Helen Borrie for adding the "legal part"
 *
 ********************* *)
unit fbmgr_m;

interface

{------------------------------------------
- Todas as Notas em Português & Inglês
- You will find comments in Portuguese & English

Administrador de Firebird
Firebird Control

Programadores:
Developers:
  - Artur Anjos, artur@arsoft.pt - Codigo Inicial / Main Code;
  - Paulo Vaz: icon, support on end-look;

Testes/
Testing:

  - Comunidade Firebird de Lingua Portuguesa
    Firebird Portuguese-Spoken Community

Version Control:
  1.01: Versão Pública
        Public Release

Enjoy It
Have Fun!
-------------------------------------------}

// Tire o comentário do que quiser utilizar
// Comment out the one you want to use

{$DEFINE ENGLISH_VERSION}

//{$DEFINE VERSAO_PORTUGUESA}
//{$DEFINE CFLP}  // This is a Specific Version for CFLP
//{$DEFINE GERMAN_VERSION}
//{$DEFINE GREEK_VERSION}
//{$DEFINE FRENCH_VERSION}
//{$DEFINE RUSSIAN_VERSION}
//{$DEFINE ROMANIAN_VERSION}
//{$DEFINE TURKISH_VERSION}
//{$DEFINE SPANISH_VERSION}
//{$DEFINE DUTCH_VERSION}
//{$DEFINE SLOVENIAN_VERSION}
//{$DEFINE ITALIAN_VERSION}
//{$DEFINE JAPANESE_VERSION}

{$IFDEF CFLP}
  {$IFNDEF VERSAO_PORTUGUESA }
    {$UNDEF CFLP}
  {$ENDIF}
{$ENDIF}

uses
  Windows, Messages, SysUtils,Graphics,
  Controls, Forms, Dialogs,
  StdCtrls, jpeg, ShellApi,
  Registry, WinSvc, Classes, ExtCtrls;

type
  SysOps = ( W95, W98, WNT, W2K, WME, WXP, UKnow );

  TFoMain = class(TForm)
    GBSUp: TGroupBox;
    RBSMAuto: TRadioButton;
    RBSMMan: TRadioButton;
    GBRDir: TGroupBox;
    GBStat: TGroupBox;
    BtStartStop: TButton;
    LbStatS: TLabel;
    CBServ: TCheckBox;
    LbVersion: TLabel;
    LbRDir: TLabel;
    CBGuar: TCheckBox;
    BtApply: TButton;
    LbAutoReboot: TLabel;
    Bevel1: TBevel;
    GBFb: TGroupBox;
    ImFb: TImage;
    LbStat: TLabel;
    PanVersion: TPanel;
    PanVisit: TPanel;
    LbUrl: TLabel;
    LbVisit: TLabel;
    CBGOpt: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChangeStartUp(Sender: TObject);
    procedure BtStartStopClick(Sender: TObject);
    procedure BtApplyClick(Sender: TObject);
    procedure CBServClick(Sender: TObject);
    procedure CBGuarClick(Sender: TObject);
    procedure LbUrlClick(Sender: TObject);
    procedure CBGOptClick(Sender: TObject);
  private
    { Private declarations }
    // Funcoes e Procedimentos relacionados com Serviços
    // Functions/Procedures Service Related
    function  ArOpenServices( Service : String )  : Boolean;
    function  ServiceStop ( Service : string ) : Boolean;
    function  ServiceStart( Service : string ) : Boolean;
    function  ServiceAutoMan( Service : string; StartType : DWord ) : Boolean;
    procedure InstallServiceFB;
    procedure InstallServiceFBG;
    procedure RemoveServiceFB;
    procedure RemoveServiceFBG;

    // Versão do Sistema Operativo
    // Get Operating System Version
    function GetOSystem : SysOps;

    // Firebird/Guardian correndo como um Serviço?
    // Is Firebird/Guardian running as a Service?
    function IsService    : Boolean;
    function IsGService  : Boolean;

    // Várias Funcoes de Estado
    // Status Functions
    function IsAutomatic  : Boolean;
    function IsRunning  : Boolean;
    function ToAutomatic : Boolean;
    function ToManual: Boolean;
    procedure UpdateStatus;

    // Não gosto de parar um Servidor Firebird, mas...
    // I don't like to Stop a Firebird Server, but...
    function StopFB : Boolean;

    // 'Prance!, Prance!, do you want a law to dance?'
    //     [The Clash - Sandinista]
    function StartFB : Boolean;

    // Botão Aplicar On/Off
    // Button 'Apply' On/Off
    procedure CheckVisibleButton;

    // Reboot em W2K / NT
    // Reboot in W2K / NT
    procedure Reboot;

  public
    { Public declarations }
  end;


var
  FoMain: TFoMain;
  FB_RDir : string;     // Firebird RootDirectory
  FB_SDir : string;     // Firebird ServerDirectory
  FB_SVer : string;     // Firebird Server Version
  FB_GOpt : string;     // Firebird Guardian Options

implementation


{$R *.DFM}


var
  FB_Auto : Boolean;    // Automatico / Automatic
  FB_IsRun: Boolean;    // Firebird Activo / Firebird is Running
  FB_OSys : SysOps;     // Sistema Operativo / Operating System;
  FB_Serv : Boolean;    // É um Serviço / Running as a service
  FB_Guard: Boolean;    // Guardian está a correr / Guardian is Running

  // Estas 4 apenas para 'KISS'
  // This  4 just to KISS
  MyReg       : TRegistry;
  SvcManager  : SC_HANDLE;
  SvcService  : SC_HANDLE;
  SvcStatus   : TServiceStatus;

const
  RootKey = HKEY_LOCAL_MACHINE;
  RegKey  = 'Software\Borland\InterBase\CurrentVersion';
  RegKeyR = 'Software\Microsoft\Windows\CurrentVersion\Run';

  KRDir   = 'RootDirectory';
  KSDir   = 'ServerDirectory';
  KSVer   = 'Version';
  KSGuard = 'GuardianOptions';
  KRunGN  = 'InterBaseGuardian';
  KRunFN  = 'InterBaseServer';

  KRunG   = 'ibguard.exe';
  KRunF   = 'ibserver.exe';

  KService = 'InterBaseServer';
  KGService= 'InterBaseGuardian';

  KCName  = 'IB_Server';
  KWName  = 'InterBase Server';

  KSName  = 'Firebird Server';
  KSGName = 'Firebird Guardian Service';

  FBMgr_VersionNum   = '1.01';


resourcestring

//*********************************************************
// Localize it
//*********************************************************

{$IFDEF ENGLISH_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Visit';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Startup &Mode';
  FB_LabStartModeA= '&Automatic';
  FB_LabStartModeM= '&Manual';

  FB_LabRootDir   = 'Root &Directory';

  FB_LabStatus    = 'S&tatus';
  FB_LabStatusS   = 'The Firebird Server is currently';

  FB_LabStatusS_SR= 'Running';
  FB_LabStatusS_SS= 'Stopped';

  FB_LabStatusB_SS= '&Stop';
  FB_LabStatusB_SR= '&Start';

  FB_LabVersion   = 'Version';

  FB_LabStatusServ= '&Run as a service on NT/W2K/XP';
  FB_LabStatusGuar= '&Use Guardian';
  FB_LabStatusGOpt= '&Keep Restarting Firebird';
  FB_NotInstalled = 'Firebird Server is not installed on your computer!';

  FB_Apply        = 'Apply';
  FB_Reboot       = 'Automatic Reboot';
{$ENDIF}


{$IFDEF VERSAO_PORTUGUESA}
  FB_Title        = 'Administrador do Servidor Firebird';
  FB_Visit        = 'Visite';

  FB_LabStartMode = 'Inicialização';
  FB_LabStartModeA= '&Automática';
  FB_LabStartModeM= '&Manual';

  FB_LabRootDir   = 'Localização';

  FB_LabStatus    = 'Estado';
  FB_LabStatusS   = 'O Servidor Firebird está';
  FB_LabStatusS_SR= 'Iniciado';
  FB_LabStatusS_SS= 'Parado';

  FB_LabStatusB_SS= '&Parar';
  FB_LabStatusB_SR= '&Iniciar';

  FB_LabVersion   = 'Versão';
  FB_LabStatusServ= '&Instalado como Serviço para NT/W2K/XP';
  FB_LabStatusGuar= '&Utilizar o Guardian';
  FB_LabStatusGOpt= '&Reiniciar sempre o Firebird';

  FB_NotInstalled = 'O Servidor Firebird não está instalado no seu sistema!';

  FB_Apply        = 'A&plicar';
  FB_Reboot       = 'Reinício Automático';

  {$IFDEF CFLP}
    // Versão especifica para a CFLP
    // Apresenta os creditos e muda o Link
    FB_Hint         = 'Cortesia da Comunidade Firebird de Língua Portuguesa';
    FB_Credits       = 'Desenvolvido para a CFLP por' + #13#10 + 'Artur Anjos';
    FB_URL          = 'http://www.comunidade-firebird.org';
  {$ELSE}
    FB_URL          = 'http://www.firebirdsql.org';
  {$ENDIF}
{$ENDIF}


{$IFDEF GERMAN_VERSION}
   FB_Title        = 'Firebird Manager';
   FB_Visit        = 'Besuche';
   FB_URL          = 'http://www.firebirdsql.org';

   FB_LabStartMode = 'Start&typ';
   FB_LabStartModeA= '&Automatisch';
   FB_LabStartModeM= '&Manuell';

   FB_LabRootDir   = 'Stamm&verzeichnis';

   FB_LabStatus    = 'S&tatus';
   FB_LabStatusS   = 'Der Firebird Server ist derzeit';

   FB_LabStatusS_SR= 'Gestartet';
   FB_LabStatusS_SS= 'Gestoppt';

   FB_LabStatusB_SS= '&Stop';
   FB_LabStatusB_SR= '&Start';

   FB_LabVersion   = 'Version';

   FB_LabStatusServ= '&Als Service auf NT/W2K/XP ausführen';
   FB_LabStatusGuar= '&Guardian verwenden';
   FB_LabStatusGOpt= '&Firebird neu starten';
   FB_NotInstalled = 'Firebird Server ist auf Ihrem Computer nicht installiert!';

   FB_Apply        = 'Übernehmen';
   FB_Reboot       = 'Automatisch Wiederhochfahren';
 {$ENDIF}


{$IFDEF GREEK_VERSION}
  FB_Title        = 'Äéá÷åßñéóç Firebird';
  FB_Visit        = 'Åğéóêåöèåßôå';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = '&Ôñüğïò Eêêßíçóçò';
  FB_LabStartModeA= '&Aõôüìáôïò';
  FB_LabStartModeM= '&Xåéñïêßíçôïò';

  FB_LabRootDir   = '&Báóéêüò ÊáôÜëïãïò';

  FB_LabStatus    = '&KáôÜóôáóç';
  FB_LabStatusS   = 'Ç õğçñåóßá Firebird';

  FB_LabStatusS_SR= 'Ôñİ÷åé';
  FB_LabStatusS_SS= '¸÷åé óôáìáôŞóåé';

  FB_LabStatusB_SS= 'Ğáıóç';
  FB_LabStatusB_SR= 'Åêêßíçóç';

  FB_LabVersion   = '¸êäïóç';

  FB_LabStatusServ= 'Ôñİ÷åé ùò õğçñåóßá óôá NT/W2K/XP';
  FB_LabStatusGuar= '×ñŞóç ôïõ Guardian';
  FB_LabStatusGOpt= 'Óõíå÷Şò Åğáíåêêßíçóç ôçò Firebird';
  FB_NotInstalled = 'Ç õğçñåóßá Firebird äåí åßíáé åãêáôåóôçìİíç óôïí õğïëïãéóôŞ óáò!';

  FB_Apply        = 'Êáôá÷şñçóç';
  FB_Reboot       = 'Áõôüìáôç Åğáíåêêßíçóç';
{$ENDIF}

{$IFDEF FRENCH_VERSION}
  FB_Title        = 'Administrateur Services Firebird';
  FB_Visit        = 'Visiter';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = '&Mode de démarage';
  FB_LabStartModeA= '&Automatique';
  FB_LabStartModeM= '&Manuel';

  FB_LabRootDir   = '&Répertoire racine';

  FB_LabStatus    = 'S&tatut';
  FB_LabStatusS   = 'Le serveur Firebird est ';

  FB_LabStatusS_SR= 'en service';
  FB_LabStatusS_SS= 'arrêté';

  FB_LabStatusB_SS= '&Arrêter';
  FB_LabStatusB_SR= '&Démarrer';

  FB_LabVersion   = 'Version';

  FB_LabStatusServ= '&Executer en tant que service NT/W2K/XP';
  FB_LabStatusGuar= '&Utiliser Guardian';
  FB_LabStatusGOpt= '&Redémarrer Firebird';
  FB_NotInstalled = 'Le Serveur Firebird Server n''est pas installé!';

  FB_Apply        = 'Appliquer';
  FB_Reboot       = 'Reboot Automatique';
{$ENDIF}

{$IFDEF RUSSIAN_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Ïîñåòèòå';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Ğ&åæèì çàïóñêà';
  FB_LabStartModeA= '&Àâòîìàòè÷åñêèé';
  FB_LabStartModeM= '&Ğó÷íîé';

  FB_LabRootDir   = '&Êîğíåâàÿ ïàïêà óñòàíîâêè';

  FB_LabStatus    = 'Ñîñ&òîÿíèå';
  FB_LabStatusS   = 'Firebird Server ñåé÷àñ';

  FB_LabStatusS_SR= 'Çàïóùåí';
  FB_LabStatusS_SS= 'Îñòàíîâëåí';

  FB_LabStatusB_SS= '&Îñòàíîâèòü';
  FB_LabStatusB_SR= '&Çàïóñòèòü';

  FB_LabVersion   = 'Âåğñèÿ';

  FB_LabStatusServ= 'Ğàáîòàòü êàê &ñåğâèñ íà NT/W2K/XP';
  FB_LabStatusGuar= '&Èñïîëüçîâàòü Guardian';
  FB_LabStatusGOpt= '&Ïåğåçàïóñêàòü Firebird';
  FB_NotInstalled = 'Firebird Server íå óñòàíîâëåí íà âàøåì êîìïüşòåğå!';

  FB_Apply        = 'Ïğèìåíèòü';
  FB_Reboot       = 'Àâòîìàòè÷åñêàÿ ïåğåçàãğóçêà';
{$ENDIF}

{$IFDEF ROMANIAN_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Visitati';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Modul de &pornire';
  FB_LabStartModeA= '&Automat';
  FB_LabStartModeM= '&Manual';

  FB_LabRootDir   = '&Calea de pornire';

  FB_LabStatus    = 'S&tare';
  FB_LabStatusS   = 'Serverul Firebird este';

  FB_LabStatusS_SR= 'Pornit';
  FB_LabStatusS_SS= 'Oprit';

  FB_LabStatusB_SS= '&Opreste';
  FB_LabStatusB_SR= '&Porneste';

  FB_LabVersion   = 'Versiune';

  FB_LabStatusServ= '&Porneste ca serviciu pe NT/W2K/XP';
  FB_LabStatusGuar= '&Foloseste Guardian';
  FB_LabStatusGOpt= '&Reporneste Firebird la nevoie';
  FB_NotInstalled = 'Serverul Firebird nu este instalat pe acest calculator!';

  FB_Apply        = 'Salveaza';
  FB_Reboot       = 'Reporneste automat';
{$ENDIF}

{$IFDEF TURKISH_VERSION}
  FB_Title        = 'Firebird Yöneticisi';
  FB_Visit        = 'Gözatın';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Başlatma &Yöntemi';
  FB_LabStartModeA= '&Otomatik';
  FB_LabStartModeM= '&Manual';

  FB_LabRootDir   = 'Kök &Dizin';

  FB_LabStatus    = 'D&urum';
  FB_LabStatusS   = 'Firebird sunucusu şu anda';

  FB_LabStatusS_SR= 'Çalışıyor';
  FB_LabStatusS_SS= 'Çalışmıyor';

  FB_LabStatusB_SS= '&Başlat';
  FB_LabStatusB_SR= 'Du&rdur';

  FB_LabVersion   = 'Sürüm';

  FB_LabStatusServ= 'NT/W2K/XP''de &servis olarak çalıştır';
  FB_LabStatusGuar= '&Guardian''ı kullan';
  FB_LabStatusGOpt= '&Firebird''ü sürekli yeniden başlat';
  FB_NotInstalled = 'Firebird Sunucusu kurulu değil!';

  FB_Apply        = 'Uy&gula';
  FB_Reboot       = 'Otomatik Yeniden Başlat';
{$ENDIF}


{$IFDEF SPANISH_VERSION}
  FB_Title        = 'Administrador Firebird';
  FB_Visit        = 'Visite';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = '&Modo de Inicio';
  FB_LabStartModeA= '&Automático';
  FB_LabStartModeM= 'Ma&nual';

  FB_LabRootDir   = 'Di&rectorio Raíz';

  FB_LabStatus    = '&Estado';
  FB_LabStatusS   = 'Firebird está actualmente';

  FB_LabStatusS_SR= 'Ejecutando';
  FB_LabStatusS_SS= 'Detenido';

  FB_LabStatusB_SS= '&Detener';
  FB_LabStatusB_SR= '&Iniciar';

  FB_LabVersion   = 'Versión';

  FB_LabStatusServ= 'E&jecutar como servicio en NT/W2K/XP';
  FB_LabStatusGuar= '&Usar Guardián';
  FB_LabStatusGOpt= 'Man&tener Reiniciando Firebird';
  FB_NotInstalled = 'Servidor Firebird no está instalado en su computador!';

  FB_Apply        = 'Aplicar';
  FB_Reboot       = 'Reinicio Automático';
{$ENDIF}

{$IFDEF DUTCH_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Bezoek';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Opstartwijze';
  FB_LabStartModeA= '&Automatisch';
  FB_LabStartModeM= '&Handmatig';

  FB_LabRootDir   = 'Hoofddirectorie';

  FB_LabStatus    = 'Status';
  FB_LabStatusS   = 'De Firebird Server is momenteel';

  FB_LabStatusS_SR= 'gestart';
  FB_LabStatusS_SS= 'gestopt';

  FB_LabStatusB_SS= '&Stop';
  FB_LabStatusB_SR= '&Start';

  FB_LabVersion   = 'Versie';

  FB_LabStatusServ= '&Als service uitvoeren op NT/W2K/XP';
  FB_LabStatusGuar= '&Guardian gebruiken';
  FB_LabStatusGOpt= '&Firebird steeds opnieuw opstarten';
  FB_NotInstalled = 'Firebird Server is niet geïnstalleerd op uw computer!';

  FB_Apply        = '&Toepassen';
  FB_Reboot       = 'Automatisch de computer opnieuw &opstarten';
{$ENDIF}


{$IFDEF SLOVENIAN_VERSION}
   FB_Title        = 'Firebird upravitelj';
   FB_Visit        = 'Spletna stran';
   FB_URL          = 'http://www.firebirdsql.org';

   FB_LabStartMode = 'Zagon';
   FB_LabStartModeA= 'Samodejno';

   FB_LabStartModeM= 'Manualno';
   FB_LabRootDir   = 'Imenik instalacije';

   FB_LabStatus    = 'Stanje';
   FB_LabStatusS   = 'Trenutno stanje serverja';

   FB_LabStatusS_SR= 'Aktiven';
   FB_LabStatusS_SS= 'Zaustavljen';

   FB_LabStatusB_SS= 'Ustavi';
   FB_LabStatusB_SR= 'Aktiviraj';

   FB_LabVersion   = 'Verzija';

   FB_LabStatusServ= 'Zagon s servisom NT/W2K/XP';
   FB_LabStatusGuar= 'Uporabi Guardian';

   FB_LabStatusGOpt= 'Ponovni zagon serverja';

   FB_NotInstalled = 'Ne najdem instalacije Firebird Serverja!';

   FB_Apply        = 'Uporabi';
   FB_Reboot       = 'Samodejni ponovni zagon';
{$ENDIF}

{$IFDEF ITALIAN_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Visita';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = '&Modalità avvio';
  FB_LabStartModeA= '&Automatico';
  FB_LabStartModeM= '&Manuale';

  FB_LabRootDir   = '&Directory radice';

  FB_LabStatus    = 'S&tatus';
  FB_LabStatusS   = 'Firebird Server è attualmente';

  FB_LabStatusS_SR= 'Attivato';
  FB_LabStatusS_SS= 'Disattivato';

  FB_LabStatusB_SS= '&Disattiva';
  FB_LabStatusB_SR= '&Attiva';

  FB_LabVersion   = 'Versione';

  FB_LabStatusServ= '&Esegui come servizio in NT/W2K/XP';
  FB_LabStatusGuar= '&Usa il Guardian';
  FB_LabStatusGOpt= '&Mantieni attivo il server';
  FB_NotInstalled = 'Firebird Server non risulta installato!';

  FB_Apply        = 'Applica';
  FB_Reboot       = 'Riavvio Automatico';
{$ENDIF}

{$IFDEF JAPANESE_VERSION}
  FB_Title        = 'Firebird Manager';
  FB_Visit        = 'Visit';
  FB_URL          = 'http://www.firebirdsql.org';

  FB_LabStartMode = 'Startup &Mode';
  FB_LabStartModeA= '©“®(&A)';
  FB_LabStartModeM= 'è“®(&M)';

  FB_LabRootDir   = 'ƒ‹[ƒg ƒfƒBƒŒƒNƒgƒŠ(&D)';

  FB_LabStatus    = 'ƒXƒe[ƒ^ƒX(&T)';
  FB_LabStatusS   = 'Firebird Server ‚ÍŒ»İ ';

  FB_LabStatusS_SR= '‹N“®’†';
  FB_LabStatusS_SS= '’â~’†';

  FB_LabStatusB_SS= 'ƒXƒgƒbƒv(&S)';
  FB_LabStatusB_SR= 'ƒXƒ^[ƒg(&S)';

  FB_LabVersion   = 'Version';

  FB_LabStatusServ= 'NT/W2K/XPã‚ÅƒT[ƒrƒX‚Æ‚µ‚Ä‹N“®(&R)';
  FB_LabStatusGuar= 'Guardian‚ğg—p(&U)';
  FB_LabStatusGOpt= 'Firebird‚ğÄ‹N“®‚µ‘±‚¯‚é(&K)';
  FB_NotInstalled = 'FirebirdƒT[ƒo[‚ªƒCƒ“ƒXƒg[ƒ‹‚³‚ê‚Ä‚¢‚Ü‚¹‚ñ!';

  FB_Apply        = '“K—p';
  FB_Reboot       = 'Automatic Reboot';
{$ENDIF}

// ******************************************************


// Funcão Auxiliar para trabalhar com Serviços
// Auxiliary Function to Work with services
function TFoMain.ArOpenServices( Service : string ) : Boolean;
begin
  Result := True;
  SvcManager:= OpenSCManager( nil, nil, SC_MANAGER_ALL_ACCESS);
  if SvcManager<=0 then
    Result := False
  else
    begin
    if Service='FB' then
      SvcService := OpenService( SvcManager, KService, SERVICE_ALL_ACCESS )
    else
      SvcService := OpenService( SvcManager, KGService,SERVICE_ALL_ACCESS );
    if SvcService<=0 then
      begin
      CloseServiceHandle( SvcManager );
      Result := False;
      end;
    end;
end;

// Mariquices...
// Funny
procedure TFoMain.UpdateStatus;
begin
  if FB_IsRun then
    begin
    LbStat.Font.Color   := clGreen;
    LbStat.Caption      := FB_LabStatusS_SR;
    BtStartStop.Caption := FB_LabStatusB_SS;
    end
  else
    begin
    LbStat.Font.Color   := clRed;
    LbStat.Caption      := FB_LabStatusS_SS;
    BtStartStop.Caption := FB_LabStatusB_SR;
    end;

  CBGOpt.Enabled := CBGuar.Checked;
end;


// Create Form
procedure TFoMain.FormCreate(Sender: TObject);
begin
  MyReg := TRegistry.Create;

  // O Firebird está instalado ?
  // Is FireBird Installed ?
  MyReg.RootKey := RootKey;
  if not MyReg.OpenKey( RegKey ,False) then
    begin
    ShowMessage( FB_NotInstalled );
    MyReg.CloseKey;
    MyReg.Free;
    Application.Terminate;
    exit;
    end;


  // Versão Portuguesa/Inglesa
  // Portuguese/English Version/Others....
  Application.Title    := FB_Title;
  FoMain.Caption       := FB_Title;

  // Versão da CFLP possui creditos
  // A portuguese version with some credits inside
  {$IFDEF CFLP}
    GBFb.Hint     := FB_Hint;
    PanVersion.Hint   := FB_Credits;
  {$ELSE}
    GBFb.ShowHint       := False;
    PanVersion.ShowHint := False;
  {$ENDIF}

  GBSUp.Caption     := ' ' + FB_LabStartMode + ' ';
  RBSMAuto.Caption  := FB_LabStartModeA;
  RBSMMan.Caption   := FB_LabStartModeM;
  GBRDir.Caption    := ' ' + FB_LabRootDir + ' ';
  GBStat.Caption    := ' ' + FB_LabStatus + ' ';
  LBStatS.Caption   := FB_LabStatusS;
  CBServ.Caption    := FB_LabStatusServ;
  CBGuar.Caption    := FB_LabStatusGuar;
  CBGOpt.Caption    := FB_LabStatusGOpt;

  BtApply.Caption   :=  FB_Apply;
  LbAutoReboot.Caption := FB_Reboot;
  LbVisit.Caption   := FB_Visit;
  LbUrl.Caption     := FB_URL;

  PanVersion.Caption:= FB_LabVersion+' '+FBMgr_VersionNum;

  // Inicialização de algumas variáveis Globais
  // Initialize some Global Variables
  FB_RDir := MyReg.ReadString( KRDir );
  FB_SDir := MyReg.ReadString( KSDir );
  try
    FB_SVer := MyReg.ReadString( KSVer );
    except
      // "Que se lixe"
      // Do nothing, it's a bad installation
    end;

  // Ver Versão
  // Show Version
  LbVersion.Caption := FB_LabVersion +  ': ' + FB_SVer;

  // Se as opções do Guardian não estão definidas,
  // eu crio umas. Este é um erro do script de instalação
  // If the Guardian Options is not defined, I will create
  // it with a '0' option
  if not MyReg.ValueExists( KsGuard ) then
    begin
      try
        MyReg.WriteString( KSGuard,'0' );
      except
        // Se falhar, 'que se lixe'
        // Not important if it fails
      end;
    end;

  // Ler as opções do Guardian
  // Read the Guardian Options
  try
    FB_GOpt := MyReg.ReadString( KSGuard );
    except
    end;
  MyReg.CloseKey;

  CBGOpt.Checked := FB_GOpt='1';

  // Verificar Sistema Operativo e Serviço/Aplicação
  // Let's check Operating System and Service/Application
  FB_OSys := GetOSystem;
  if  (FB_OSys=W95) or
      (FB_OSys=W98) or
      (FB_OSys=WME) then begin
      CBServ.Enabled  := False;
      FB_Serv         := False;
      end
  else
    begin
    // Let's see if it is a service or not
    FB_Serv := IsService;
    if IsService then begin
      CBServ.Checked := True;
      end;
    end;


  // Determinar o uso do Guardian
  // Check if Guardian is used or not
  if not FB_Serv then
    begin
    FB_Guard := False;
    if MyReg.OpenKey( RegKeyR, False ) then
      begin
      try
        if MyReg.ReadString( KRunGN )<>'' then
          FB_Guard := True;
        except
          // Do Nothing
        end;
      MyReg.CloseKey;
      end;
    end
  else
    FB_Guard := IsGService;

  CBGuar.Checked  := FB_Guard;

  //  Status
  FB_Auto           := IsAutomatic;
  RBSMAuto.Checked  := FB_Auto;
  RBSMMan.Checked   := not FB_Auto;
  CBGuar.Checked    := FB_Guard;

  // Root Directory
  LbRDir.Caption := FB_RDir;

  FB_IsRun:= IsRunning;

  UpdateStatus;

  CheckVisibleButton;
end;


// Ver SO
// Get OS
function TFoMain.GetOSystem() : SysOps;
var
  Osys  : TOSVERSIONINFO;
begin
  osys.dwOSVersionInfoSize:=sizeof(osys);

  Result := UKnow;
  if GetVersionEx( osys )=True then
    begin
    if (osys.dwPlatformID = VER_PLATFORM_WIN32_WINDOWS) then
      begin
      if ((osys.dwMajorVersion = 4) and (Osys.dwMinorVersion = 0)) then
        Result := W95
      else if (osys.dwMajorVersion > 4) Or
            ((osys.dwMajorVersion = 4) And (osys.dwMinorVersion > 0)) then
        Result := W98
      else if ((osys.dwMajorVersion = 4) and (Osys.dwMinorVersion = 90)) then
        Result := WME
      end
    else
      begin
      if (Osys.dwMajorVersion = 4) then
        Result := WNT
      else if ((Osys.dwMajorVersion = 5) and (osys.dwMinorVersion = 0)) then
        Result := W2K
      else if ((Osys.dwMajorVersion=5) and (Osys.dwMinorVersion=1)) then
        Result := WXP;
      end;
    end;
end;

// Corre como um Serviço ?
// Is running as a Service ?
function TFoMain.IsService  : Boolean;
begin
  Result := False;
  if ArOpenServices( 'FB' ) then
    begin
    Result := True;
    CloseServiceHandle( SvcManager );
    CloseServiceHandle( SvcService );
    end;
end;

// O mesmo para o Guardian
// Same thing for the Guardian
function TFoMain.IsGService  : Boolean;
begin
  Result := False;

  // Open Services
  if ArOpenServices( 'Guardian' ) then
    begin
    Result := True;
    CloseServiceHandle( SvcManager );
    CloseServiceHandle( SvcService );
    end;
end;

// Automatico ou Manual?
// Automatic or Manual?
function TFoMain.IsAutomatic  : Boolean;
var
  SizeB     : DWord;
  PSvcQuery : PQueryServiceConfig;
  Ok        : Boolean;
begin
  Result := False;

  // Se não é um serviço, é controlado pelo Guardian
  // Verificar o Registo
  // If it ins't a service, is controlled by the guardian
  // Check if exists in Registry
  if not(FB_Serv) then
    begin
    if MyReg.OpenKey( RegKeyR, False ) then
      begin
        try
        if MyReg.ReadString( KRunGN )<>'' then
          Result := True
        else
          Result := MyReg.ReadString( KRunFN )<>'';
        except
          // Nothing
        end;
      MyReg.CloseKey;
      end;
    end
  else
    // Check Service Status
    begin
    if ArOpenServices( 'FB' ) then
      begin
      SizeB := 0;
      GetMem( PSvcQuery, 512 );
      Ok := QueryServiceConfig( SvcService, PSvcQuery, 512, SizeB );
      if not Ok then
        begin
        GetMem( PSvcQuery, SizeB );
        Ok := QueryServiceConfig( SvcService, PSvcQuery, SizeB, SizeB );
        end;
      if Ok then
        begin
        Result := PSvcQuery.dwStartType =SERVICE_AUTO_START;
        end;
      FreeMem( PSvcQuery );
      CloseServiceHandle( SvcService );
      CloseServiceHandle( SvcManager );
      end;
    end;
end;


// O Firebird está activo ?
// Is Firebird Running ?
function TFoMain.IsRunning(): boolean;
begin
  Result := False;
  if not FB_Serv then
    begin
    if FindWindow(KCName,KWName)>0 then
      Result := true;
    end
  else
    begin
    if ArOpenServices( 'FB' ) then
      begin
      if QueryServiceStatus( SvcService, SvcStatus ) then
        Result := SvcStatus.dwCurrentState=SERVICE_RUNNING;
      CloseServiceHandle( SvcService );
      CloseServiceHandle( SvcManager );
      end;
    end;
end;

// This is the End.... [The Doors]
procedure TFoMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if assigned(MyReg) then
    MyReg.Free;
end;

// Definir Serviço como Automatico ou Manual
// Define service as automatic or Manual
function TFoMain.ServiceAutoMan( Service : string; StartType : DWord ) : Boolean;
begin
  Result := False;
  if ArOpenServices( Service ) then
    begin
    if ChangeServiceConfig( SvcService,SERVICE_NO_CHANGE,
        StartType,SERVICE_NO_CHANGE,nil,nil,nil,nil,nil,nil,nil) then
        Result := True;
    CloseServiceHandle( SvcService );
    CloseServiceHandle( SvcManager );
    end;
end;


// Definir como Automatico
// Set it to Automatic
function TFoMain.ToAutomatic : Boolean;
begin
  Result := False;

  if not FB_Serv then
    begin
    if MyReg.OpenKey( RegKeyR, False ) then
      begin
      try
        if FB_Guard then
          begin
          MyReg.WriteString( KRunGN, FB_RDir + '\bin\' + KRunG + ' -a' );
          if MyReg.ValueExists( KRunFN ) then
            MyReg.DeleteValue( KRunFN );
          end
        else
          begin
          MyReg.WriteString( KRunFN, FB_RDir + '\bin\' + KRunF + ' -a' );
          if MyReg.ValueExists( KRunGN ) then
            MyReg.DeleteValue( KRunGN );
          end;
        MyReg.CloseKey;
        Result := True;
        except
          // Do Nothing
        end;
      MyReg.CloseKey;
      end;
    end
  else
    begin
    // Change The Service
    if FB_Guard then
      ServiceAutoMan( 'Guardian', SERVICE_AUTO_START );
    Result := ServiceAutoMan( 'FB', SERVICE_AUTO_START );
    end;
end;

// Definir como Manual
// Set it to Manual
function TFoMain.ToManual : Boolean;
begin
  Result := False;
  if not FB_Serv then
    begin
    // Open the Registry Key
    if MyReg.OpenKey( RegKeyR, False ) then
      begin
      try
        if MyReg.ValueExists( KRunGN ) then
          MyReg.DeleteValue( KRunGN )
        else
          if MyReg.ValueExists( KRunFN ) then
            MyReg.DeleteValue( KRunFN );
        Result := True;
        except
        // Do Nothing
        end;
      MyReg.CloseKey;
      end;
    end
  else
    begin
    if FB_Guard then
      ServiceAutoMan( 'Guardian', SERVICE_DEMAND_START );
    Result := ServiceAutoMan( 'FB', SERVICE_DEMAND_START );
    end;
end;

procedure TFoMain.ChangeStartUp(Sender: TObject);
begin

  if ( (RBSMAuto.Checked and FB_Auto) ) or
     ( (not RBSMAuto.Checked and not FB_Auto) ) then
    exit;

  if RBSMAuto.Checked then
    RBSMAuto.Checked := ToAutomatic
  else
    RBSMMan.Checked := ToManual;

  FB_Auto := RBSMAuto.Checked;
end;


// Should I stay or Should I go? [The Clash]
procedure TFoMain.BtStartStopClick(Sender: TObject);
begin
  if FB_IsRun then
    FB_IsRun := not StopFB
  else
    FB_IsRun := StartFB;
  UpdateStatus;
end;

// Parar o Serviço
// Stop the Service
function TFoMain.ServiceStop( Service : string ) : Boolean;
begin
  Result := False;
  if ArOpenServices( Service ) then
    begin
    if ControlService( SvcService,SERVICE_CONTROL_STOP,SvcStatus) then
      begin
      Sleep(1000);
      while (QueryServiceStatus(SvcService,SvcStatus)) do
        begin
        Application.ProcessMessages;
        if SvcStatus.dwCurrentState=SERVICE_STOP_PENDING then
            Sleep(1000)
          else
            break;
        end;
      if SvcStatus.dwCurrentState=SERVICE_STOPPED then
        Result := True;
      end;
    end;
end;

// Firebird Stop
function TFoMain.StopFB : Boolean;
var
  WHand   : HWND;
begin

  Screen.Cursor := crHourglass;
  Result := False;

  if not FB_Serv then
    begin
    WHand := FindWindow(KCName,KWName);
    if PostMessage( WHand, WM_CLOSE, 0, 0) then
      Result := True;
    Application.ProcessMessages;
    end
  else
    begin
    if FB_Guard then
      Result := ServiceStop( 'Guardian' )
    else
      Result := ServiceStop( 'FB' );
    end;

  Screen.Cursor := crDefault;
end;

function TFoMain.ServiceStart( Service : string ) : Boolean;
var
  Argv    : PChar;
begin
  Result := False;
  if ArOpenServices( Service ) then
    begin
    if StartService(SvcService,0,Argv) then
      begin
      Sleep(1000);
      while (QueryServiceStatus(SvcService,SvcStatus)) do
        begin
        Application.ProcessMessages;
        if SvcStatus.dwCurrentState=SERVICE_START_PENDING then
          Sleep(1000)
        else
          break;
        end;
      if SvcStatus.dwCurrentState=SERVICE_RUNNING then
        Result := True;
      end;
    end;
end;



function TFoMain.StartFB  : Boolean;
var
  ExeName : array[0..255] of char;
begin

  Screen.Cursor := crHourglass;
  Result := False;

  if not FB_Serv then
    begin
    if FB_Guard then
      StrPCopy( ExeName, FB_SDir + KRunG + ' -a' )
    else
      StrPCopy( ExeName, FB_SDir + KRunF + ' -a' );
    if WinExec( ExeName,1 ) > 31 then
      Result := true;
    end
  else
    begin
    if FB_Guard then
      Result := ServiceStart( 'Guardian' )
    else
      Result := ServiceStart( 'FB' );
    end;
  Screen.Cursor := crDefault;
end;


procedure TFoMain.InstallServiceFB;
var
  ShortN  : array[0..255] of char;
  SType   : DWORD;
begin
  if GetShortPathName( PChar(FB_SDir), ShortN, 254 )>0 then
    begin
    SvcManager := OpenSCManager( nil, nil, SC_MANAGER_ALL_ACCESS);
    if SvcManager>0 then
      begin
      if RBSMAuto.Checked then
        SType := SERVICE_AUTO_START
      else
        SType := SERVICE_DEMAND_START;
      StrCat( ShortN, KRunF + ' -s' );
      SvcService := CreateService( SvcManager,
        KService, KSName,
        SERVICE_ALL_ACCESS,272,SType,SERVICE_ERROR_NORMAL,
        ShortN,nil,nil,nil,nil,nil);
      if SvcService>0 then
        CloseServiceHandle( SvcService );
      CloseServiceHandle( SvcManager );
      end;
    end;
end;

procedure TFoMain.InstallServiceFBG;
var
  ShortN  : array[0..255] of char;
begin
  if GetShortPathName( PChar(FB_SDir), ShortN, 254 )>0 then
    begin
    SvcManager := OpenSCManager( nil, nil, SC_MANAGER_ALL_ACCESS);
    if SvcManager>0 then
      begin
      StrCat( ShortN, KRunG + ' -s' );
      SvcService := CreateService( SvcManager,
        KGService, KSGName,
        SERVICE_ALL_ACCESS,272,SERVICE_AUTO_START,SERVICE_ERROR_NORMAL,
        ShortN,nil,nil,nil,nil,nil);
      if SvcService>0 then
        CloseServiceHandle( SvcService );
      CloseServiceHandle( SvcManager );
      end;
    end;
end;

procedure TFoMain.RemoveServiceFB;
begin
  if ArOpenServices( 'FB' ) then
    begin
    if not DeleteService( SvcService ) then
      CloseServiceHandle( SvcService );
    CloseServiceHandle( SvcManager );
    end;
end;

procedure TFoMain.RemoveServiceFBG;
begin
  if ArOpenServices( 'Guardian' ) then
    begin
    if not DeleteService( SvcService ) then
      CloseServiceHandle( SvcService );
    CloseServiceHandle( SvcManager );
    end;
end;



procedure TFoMain.Reboot;
var
  token   : THandle;
  rlen     : DWORD;
  tpPrev,
  tp      : TOKEN_PRIVILEGES;
begin
  OpenProcessToken( GetCurrentProcess,
    TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, token);
  tp.PrivilegeCount := 1;
  if LookupPrivilegeValue( nil,'SeShutdownPrivilege',
    tp.Privileges[0].LUID ) then
    begin
    tp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
    rlen := 0;
    AdjustTokenPrivileges(token, false, tp, SizeOf(tpPrev),
      tpPrev, rlen);
    end;
  ExitWindowsEx(EWX_REBOOT, 0);
end;

// Remover ou Instalar Serviço em W2K / NT
// Remove or Install the Service in W2K/NT
procedure TFoMain.BtApplyClick(Sender: TObject);
var
  Install : Boolean;
begin

  Install := False;

  // Vamos instalar Serviços ?
  // Let's install some services?
  if( (not FB_Serv) and (CBServ.Checked) ) then
    begin
    if FB_Auto then
      begin
      StopFB;
      ToManual;
      end;
    InstallServiceFB;
    ServiceStart( 'FB' );
    Install := True;
    end;

  if( (not FB_Guard) and (CBGuar.Checked) ) then
    begin
    InstallServiceFBG;
    if FB_IsRun then
      ServiceStart( 'Guardian' );
    Install := True;
    end;

  if( Install ) then
    begin
    // Start All Over again [The Clash - London Calling]
    FormCreate(nil);
    exit;
    end;

  // Reboot is a must
  if( FB_Serv and not CBServ.Checked ) then
    begin
    RemoveServiceFB;
    RemoveServiceFBG;

    // If the user still wants it automatic,
    // let's put it on
    if FB_Auto then
      begin
      FB_Serv := False;
      ToAutomatic;
      end;

    end
  else
    RemoveServiceFBG;

  // Reboot - You ask for it!
  Reboot;
end;

procedure TFoMain.CheckVisibleButton;
begin

  BtApply.Visible :=
        (CBServ.Checked<>FB_Serv) or
        (CBGuar.Checked<>FB_Guard);
  LbAutoReboot.Visible :=
        (FB_Serv and not CBServ.Checked) or
        (FB_Guard and FB_Serv and not CBGuar.Checked);

end;

procedure TFoMain.CBServClick(Sender: TObject);
begin
  CheckVisibleButton;
end;

procedure TFoMain.CBGuarClick(Sender: TObject);
begin
  if  (FB_OSys=W95) or
      (FB_OSys=W98) or
      (FB_OSys=WME) or
      (not FB_Serv) then
      begin
      FB_Guard := CBGuar.Checked;
      ToAutomatic;
      CBGOpt.Enabled := FB_Guard;
      end
  else
    CheckVisibleButton;
end;

procedure TFoMain.LbUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(FB_URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TFoMain.CBGOptClick(Sender: TObject);
begin
  if MyReg.OpenKey( RegKey, False ) then
    begin
    try
      if CBGOpt.Checked then
        MyReg.WriteString( KSGuard, '1' )
      else
        MyReg.WriteString( KSGuard, '0' );
      except
        CBGOpt.Checked := not CBGOpt.Checked;
      end;
    MyReg.CloseKey;
    end
  else
    CBGOpt.Checked := not CBGOpt.Checked;
end;

end.
