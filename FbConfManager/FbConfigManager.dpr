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
 *
 ********************* *)

program FbConfigManager;

uses
  Forms,
  MainU in 'MainU.pas' {MainForm},
  firebird_conf in 'firebird_conf.pas';

{$R *.RES}

begin
  if not StartupCompleted then exit;
  Application.Initialize;
  Application.Title := 'Firebird Config Manager';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
