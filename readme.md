## js alert vids
```javascript
javascript:( function(){
	var arr = [], l = document.getElementsByTagName('source');
	for(var i=0; i<l.length; i) { arr.push(l[i].src); }
	alert(arr);
} )();
```

## js alert links
```javascript
javascript:( function(){
	var arr = [], l = document.links; 
	for(var i=0; i<l.length; i) { arr.push(l[i].href); } 
	alert(arr);
} )();
```

## js edit website
```javascript
javascript:document.body.contentEditable = true; void 0;
```

## js new tab with link
```javascript
javascript:( function(){ var a=window.open('about:blank').document; a.write('
	<!DOCTYPE html>
		<html>
			<head><meta name="viewport" content="width=device-width" /></head>
			<body><p><a href="https://google.com">CLICKABLETEXT</a></p></body>
		</html>
');a.close(); })();
```

## js show source code
```javascript
javascript:( function(){
	var a=window.open('about:blank').document;
	a.write('<title>Source of '+location.href+'</title><meta name="viewport" content="width=device-width">');
	a.close();
	var b=a.body.appendChild(a.createElement('pre'));
	b.style.overflow='auto';
	b.style.whiteSpace='pre-wrap';
	b.appendChild(a.createTextNode(document.documentElement.innerHTML))
} )();
```

## js for yt.com rotation-lock no-input-zoom p-in-p
```javascript
javascript:( function(){ 
	var script = `window.addEventListener("orientationchange", function() {
		if (window.orientation == 90) {
			document.getElementsByTagName("ytd-app")[0].setAttribute( "style", "transform: rotate(-90deg); transform-origin: right top; width: 400px; zoom: 50%");
			document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 5px;font-family: Roboto, Arial, sans-serif;");
		}; if (window.orientation == -90) {
			document.getElementsByTagName("ytd-app")[0].setAttribute("style", "transform: rotate(90deg) translateY(-100000px); transform-origin: left top; width: 400px; zoom: 50%");
			document.documentElement.scrollLeft = 0 + 100000;
			document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 5px;font-family: Roboto, Arial, sans-serif;");
		}; if (window.orientation == 0) {
			document.getElementsByTagName("ytd-app")[0].setAttribute("style", "zoom: 100%");
			document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 12px;font-family: Roboto, Arial, sans-serif;");
		}
	}); `;
	var scriptsheet = document.createElement("script");
	scriptsheet.innerText = script;
	document.head.appendChild(scriptsheet);
	
	document.getElementsByTagName("Input")[0].setAttribute("style", "outline: none; font-size: 21px;");
	
	let v= document.querySelector('video');
	v.addEventListener('webkitpresentationmodechanged',(e)=>e.stopPropagation(), true); 
	setTimeout(()=>v.webkitSetPresentationMode('picture-in-picture'), 3000);completion()
} )();
```

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

