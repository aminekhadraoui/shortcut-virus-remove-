program remove;
uses
  crt,
  Windows,   // for constant SW_NORMAL
  ShellApi;  // for function ShellExecute
var
  name:AnsiString;
x:integer;
k:string;
procedure rootname (k:string;x:integer);
begin
textcolor(x);
writeln(k);
end;
procedure menu;
begin
     clrscr;
     rootname('  __',7);
     rootname(' (  /   __/_  _/    ''_    _  _ _ _      _',7);
     rootname('__)/)()/ /( (//  \/// (/_)  / (-//)()\/(-',7);
end;

procedure remove(var name: AnsiString);
var
  comand: AnsiString;
  si: STARTUPINFOA;
  pi: PROCESS_INFORMATION;
begin
     writeln;
   writeln('Put the name of flash disk :');
   readln(name);
   comand := 'attrib -r -a -s -h /s /d '+name+':\*.*';

  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  si.dwFlags := STARTF_USESHOWWINDOW;
  si.wShowWindow := SW_NORMAL;

  if CreateProcessA(nil, PAnsiChar(comand), nil, nil, False, 0, nil, nil, @si, @pi) then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
  clrscr;
  end else
  begin
    // error handling, use GetLastError() to find out why CreateProcess() failed...
  end;
end;

procedure removefinal(name: AnsiString);
var
  comand: AnsiString;
  si: STARTUPINFOA;
  pi: PROCESS_INFORMATION;
begin

  comand :='cmd /c del /q '+name+':\*.lnk';

  ZeroMemory(@si, sizeof(si));
  si.cb := sizeof(si);
  si.dwFlags := STARTF_USESHOWWINDOW;
  si.wShowWindow := SW_NORMAL;

  if CreateProcessA(nil, PAnsiChar(comand), nil, nil, False, 0, nil, nil, @si, @pi) then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
  clrscr;
  end else
  begin
    // error handling, use GetLastError() to find out why CreateProcess() failed...
  end;
end;





begin
menu;
remove(name);
removefinal(name);
end.
