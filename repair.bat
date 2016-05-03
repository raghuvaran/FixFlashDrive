cd k:/
k:
erase /f/s/q/ah *.*
attrib -s -h bablu
xcopy bablu /s /e /h /y
rd bablu /s /q
attrib +h bablu
erase "SATHWIK (8GB).lnk" /s /q
cd bablu
rd bablu /s /q
