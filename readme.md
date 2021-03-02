
test vimdiff if th econflict below wasnt actually a conflict
this perhaps is

here is a conflict for merging

ADDED A LINE

## powershell one liner toggle windows theme
```powershell
reg query "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"  /v SystemUsesLightTheme | 
Select-Object -first 3 | 
Select-Object -last 1 | 
%{
   if($_ -match "0x1"){
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force;
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
   }
   else{
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 1 -Type Dword -Force;
       New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force
   }
}
```

## autohotkey toggle window titlebar
```autohotkey
WinSet, Style, ^0xC00000, A
```

## windows registry default shell
`Computer\HKEY_CLASSES_ROOT\batfile\shell\open\command`<br>
default `"%1" %*`

## windows registry custom desktop context menu
add key `HKEY_CLASSES_ROOT\Directory\Background\shell\name-in-menu\command`<br>
edit value of key (Default) to `path\to\executable`

## windows explorer add files into strart menu
`C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs`

## windows registry win+druck screenshot save dir
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`<br>
edit value for key `{B7BEDE81-DF94-4682-A7D8-57A52620B86F}`

## windows registry remove services
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services`<br>
get name of service by opening properties

## windows registry remove ghosts from task man startup list
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`

## windows registry titlebar size
`HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics`<br>
deafults CaptionHeigt -330,CaptionWidth -330,ScrollHeigt -255,ScrollWidth -255,PaddedBorder -60
