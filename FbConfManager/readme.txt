FbConfigManager

This is an utility to easily change parameters
in the new firebird.conf file (Version 1.5).

Install:

1. Single Server Environment
If you are running a single server, just copy the two files to some place
you want, and you ready to go. If you are looking to some 'standard' place,
[Firebird Path]/bin is the place. 
When it starts, the utility will search in the registry for the Firebird Path to locate firebird.conf.

2. Multiple Servers Environment
Firebird 1.5 brings you the possibility to run multiple servers 
on the same box. In this way, you have two choices for using FbConfManager:

a) Copy the files for the same directory that the firebird.conf you want to 
   use is located. FbConfManager will use this one instead of the registry 
   settings;
b) Send the full path as a parameter. For example:
   FbConfManager "C:\Program Files\Firebird\Server4\firebird.conf"


FbConfManager will find firebird.conf file in this order:

1. Use the one that was sended as parameter, if any;
2. Use the one on the same directory that FbConfManager;
3. Search the Registry for Firebird root path.

---

You can translate this utility to your own language
by just changing FbConfigManager.lang.


April 2003

Utility created by Calin Pirtea

Source code available (- Delphi 5 - ) in the AddOns module on the SourceForge Firebird Tree.
Contributions and suggestions welcome.  
Please use firebird-tools to discuss it: 
[http://groups.yahoo.com/group/firebird-tools/]
