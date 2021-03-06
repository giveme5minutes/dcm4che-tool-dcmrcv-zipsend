@echo off
echo **
echo ** Sends all files in FilesB directory in a random order
echo ** and repeats this after an interval of 5 seconds
echo **

setlocal EnableDelayedExpansion

:loop
for /R FilesB %%f in (*) do (
	java -jar dcmsnd.jar STORESCP@127.0.0.1:104 %%f
	set new=!Random!
	ren %%f !new!
	echo Sent %%f renamed !new!
)
echo Waiting ...
@ping 10.2.8.55 -n 5 -w 1000 > nul
goto loop

PAUSE