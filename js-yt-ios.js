javascript:(
	function(){
		var script = `
			window.addEventListener("orientationchange", function() {
				if (window.orientation == 90) {
					document.getElementsByTagName("ytd-app")[0].setAttribute( "style", "transform: rotate(-90deg); transform-origin: right top; width: 400px; zoom: 50%");
					document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 5px;font-family: Roboto, Arial, sans-serif;");
				};
				if (window.orientation == -90) {
					document.getElementsByTagName("ytd-app")[0].setAttribute("style", "transform: rotate(90deg) translateY(-100000px); transform-origin: left top; width: 400px; zoom: 50%");
					document.documentElement.scrollLeft = 0 + 100000;
					document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 5px;font-family: Roboto, Arial, sans-serif;");
				};
				if (window.orientation == 0) {
					document.getElementsByTagName("ytd-app")[0].setAttribute("style", "zoom: 100%");
					document.getElementsByTagName("html")[0].setAttribute("style", "font-size: 12px;font-family: Roboto, Arial, sans-serif;");
				}
			});
		`;
		var scriptsheet = document.createElement("script");
		scriptsheet.innerText = script;
		document.head.appendChild(scriptsheet);
		
		document.getElementsByTagName("Input")[0].setAttribute("style", "outline: none; font-size: 21px;");
		
		let v= document.querySelector('video');
		v.addEventListener('webkitpresentationmodechanged',(e)=>e.stopPropagation(), true); 
		setTimeout(()=>v.webkitSetPresentationMode('picture-in-picture'), 3000);completion()
	}
)();
