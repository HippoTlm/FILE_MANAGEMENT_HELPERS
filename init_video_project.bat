@ECHO OFF

SETLOCAL
setlocal enabledelayedexpansion
set /p ProjectName="Please provide project name: "
IF [!ProjectName!]==[] (
ECHO Please provide a project name
PAUSE

) ELSE (

ECHO Building folders
CALL :UpCase ProjectName
MKDIR !ProjectName!
CD !ProjectName!

MKDIR 01_FOOTAGE
MKDIR 02_MUSICS
MKDIR 03_SOUNDS
MKDIR 04_EDITED_PHOTOS
MKDIR 05_OTHER_MEDIA
MKDIR 06_DOCUMENTS
MKDIR 07_AFTER_EFFECTS
MKDIR 08_PREMIERE_PRO
MKDIR 09_EXPORTS


CD 01_FOOTAGE
MKDIR G85
MKDIR MAVIC
MKDIR PIXEL3
MKDIR GOPRO

CD G85
MKDIR PHOTOS
MKDIR VIDEOS

CD ../MAVIC
MKDIR PHOTOS
MKDIR VIDEOS

CD ../PIXEL3
MKDIR PHOTOS
MKDIR VIDEOS

CD ../GOPRO
MKDIR PHOTOS
MKDIR VIDEOS


CD ../../04_EDITED_PHOTOS
MKDIR PSD
MKDIR JPG

CD ../
CALL :LoCase ProjectName
copy ..\TEMPLATES\template.prproj "08_PREMIERE_PRO/!ProjectName!.prproj"
ECHO Folder !ProjectName! has been created! Make a good edit bro!
PAUSE
DIR ..
)
ENDLOCAL
GOTO:EOF


:LoCase
:: Subroutine to convert a variable VALUE to all lower case.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i" "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r" "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z" "-=_" " =_") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF

:UpCase
:: Subroutine to convert a variable VALUE to all UPPER CASE.
:: The argument for this subroutine is the variable NAME.
FOR %%i IN ("a=A" "b=B" "c=C" "d=D" "e=E" "f=F" "g=G" "h=H" "i=I" "j=J" "k=K" "l=L" "m=M" "n=N" "o=O" "p=P" "q=Q" "r=R" "s=S" "t=T" "u=U" "v=V" "w=W" "x=X" "y=Y" "z=Z" "-=_" " =_") DO CALL SET "%1=%%%1:%%~i%%"
GOTO:EOF
