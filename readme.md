## autohotkey toggle window titlebar
```autohotkey
WinSet, Style, ^0xC00000, A
```

## plink for ssh sach

## windows registry titlebar size
`HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics`
__deafults__ 
   CaptionHeigt deafult -330
	CaptionWidth deafult -330
	ScrollHeigt deafult -255
	ScrollWidth deafult -255
   PaddedBorder deafult -60

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
