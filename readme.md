## autohotkey toggle window titlebar
```autohotkey
WinSet, Style, ^0xC00000, A
```

## plink for ssh sach

## windows registry custom desktop context menu
add key `HKEY_CLASSES_ROOT\Directory\Background\shell\name-in-menu\command`<br>
edit value of key (Default) to `path\to\executable`

## windows explorer add files into strart menu
`C:\Users\u-s-e-r\AppData\Roaming\Microsoft\Windows\Start Menu\Programs`

## windows registry win+druck screenshot save dir
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`<br>
edit value for key `{B7BEDE81-DF94-4682-A7D8-57A52620B86F}`

## windows registry remove services
`HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services`<br>
get name of service by opening properties

## windows registry remove ghost from task man startup list
`Computer\HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`

## windows registry titlebar size
`HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics`<br>
__deafults__ CaptionHeigt -330,CaptionWidth -330,ScrollHeigt -255,ScrollWidth -255,PaddedBorder -60

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
