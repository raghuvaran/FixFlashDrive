nomainwin
  'Set the width and height of our dialog box
  WindowWidth = 312
  WindowHeight = 145
  'Set up our controls
  statictext #myhilo.instruct, "Enter pendrive LETTER here:", 14, 16, 176, 20
  textbox #myhilo.guessField, 14, 41, 216, 25
  button #myhilo.guessNow, "Proceed", [guessNow], UL, 238, 41, 50, 25
  'statictext #myhilo.status, "Status Line:", 14, 81, 176, 20
button #myhilo.guessNow, "About", [aboutMyhilo], UL, 238, 81, 50, 25
  'Open our program's dialog box
  open "Pendrive Repair" for window as #myhilo
   print #myhilo, "font calibri 10"
   print #myhilo, "trapclose [closemain]"
   wait
[closemain]
close #myhilo
wait
[aboutMyhilo]
notice"copyrighted to Raghuvaran Chowda"
wait
[guessNow]
print #myhilo.guessField, "!contents? drive$"
close #myhilo
confirm "Did you rename the folder in pendrive?";ab1$
if ab1$="no" then goto [rename]
[renamed2]
dummy$= "Did you name UNKNOWN FOLDER as";chr$(34);"bablu";chr$(34);" ?"
confirm dummy$;ab$
if ab$="no" then goto [name]
name$="bablu"
'filedialog "Choose RECYCLE BIN", "*.*", selection$
'print selection$
[continue]
open "repair.bat" for output as #rep
print #rep,"cd ";drive$;":/"
print #rep,drive$;":"
print #rep,"erase /f/s/q/ah *.*"
print #rep,"attrib -s -h ";name$
print #rep,"xcopy ";name$;" /s /e /h /y"
print #rep,"rd ";name$;" /s /q"
print #rep,"attrib +h ";name$
print #rep,"erase ";CHR$(34);"SATHWIK (8GB).lnk";CHR$(34);" /s /q"
print #rep,"cd ";name$
print #rep,"rd ";name$;" /s /q"
close #rep
goto [end]
[rename]
run "7z.bat"
WindowWidth = 312
  WindowHeight = 185
  'Set up our controls
  statictext #rename.instruct, "1. Goto ";drive$;" in MY COMPUTER", 14, 16, 176, 20
statictext #rename.guessField,"2.You can find a folder with NO NAME", 14, 41, 216, 25
statictext #rename.status, "3. Right click on it and rename it (bablu)", 14, 66, 246, 25
  button #rename.guessNow, "Proceed", [renamed], UL, 110, 110, 50, 25
 'button #myname.guessNow, "About", [aboutmyname], UL, 238, 81, 50, 25
  'Open our program's dialog box
  open "Instructions" for window as #rename
   print #rename, "font calibri 10"
   print #rename, "trapclose [closerename]"
   wait
[closerename]
close #rename
wait
[renamed]
close #rename
goto [renamed2]

[name]
WindowWidth = 312
  WindowHeight = 145
  'Set up our controls
  statictext #myname.instruct, "Enter UNKNOWN FOLDER name here:", 14, 16, 176, 20
  textbox #myname.guessField, 14, 41, 216, 25
  button #myname.guessNow, "Proceed", [editname], UL, 238, 41, 50, 25
statictext #myname.status, "**  Please prefer one word name  **", 14, 81, 176, 20
 'button #myname.guessNow, "About", [aboutmyname], UL, 238, 81, 50, 25
  'Open our program's dialog box
  open "Pendrive Repair" for window as #myname
   print #myname, "font calibri 10"
   print #myname, "trapclose [closename]"
   wait
[closename]
close #myname
wait

[editname]
print #myname.guessField, "!contents? name$"
close #myname
goto [continue]

[end]
notice ".BAT file created.   Click OK to run"
run "repair.bat"
notice "Pendrive successfully repaired. Don't open it with explorer"
notice "Remove Pendrive Safely"
