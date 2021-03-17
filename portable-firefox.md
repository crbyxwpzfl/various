## personal portable firefox 86.0.1

#### start with .bat
```batch
cd %DESKTOP%\firefox-portable
start firefox\firefox.exe -Profile personal-profile
```

#### setup
extract [source](https://ftp.mozilla.org/pub/firefox/candidates/86.0.1-candidates/build1/win64/en-US/) zip to `%DESKTOP%\firefox-portable\firefox`
open url about:profiles
create profile in `%DESKTOP%\firefox-portable\firefox\profile-name` and make it the default
delete all other profiles and remove files
optionaly copy existing profile in created profile folder

#### caveats
in %AppData%\Roaming mozilla is created but nothing importand is stored there
perhaps there are even more dirs created not sure jet

#### enable userChrome.css
open url about:config
search for toolkit.legacyUserProfileCustomizations.stylesheets
set to ture
make dir chrome in profile folder
make file userChrome.css

for live debugging press Strg+Shift+i
go to settings advanced settings
check enable browser chrome and addon debugging toolboxes
check enable remote debugging
to live test userChrome.css open new tab and press Strg+Shift+Alt+i

#### vim vixen setup
open url about:addons and paste json

```json
{
"keymaps": {
  "0": { "type": "scroll.home" },
  ":": { "type": "command.show" },
  "o": { "type": "command.show.open", "alter": false },
  "O": { "type": "command.show.open", "alter": true },
  "t": { "type": "command.show.tabopen", "alter": false },
  "T": { "type": "command.show.tabopen", "alter": true },
  "w": { "type": "command.show.winopen", "alter": false },
  "W": { "type": "command.show.winopen", "alter": true },
  "b": { "type": "command.show.buffer" },
  "a": { "type": "command.show.addbookmark", "alter": true },
  "k": { "type": "scroll.vertically", "count": -1 },
  "j": { "type": "scroll.vertically", "count": 1 },
  "h": { "type": "scroll.horizonally", "count": -1 },
  "l": { "type": "scroll.horizonally", "count": 1 },
  "<C-U>": { "type": "scroll.pages", "count": -0.5 },
  "<C-D>": { "type": "scroll.pages", "count": 0.5 },
  "<C-B>": { "type": "scroll.pages", "count": -1 },
  "<C-F>": { "type": "scroll.pages", "count": 1 },
  "gg": { "type": "scroll.top" },
  "G": { "type": "scroll.bottom" },
  "$": { "type": "scroll.end" },
  "d": { "type": "tabs.close" },
  "D": { "type": "tabs.close", "select": "left" },
  "x$": { "type": "tabs.close.right" },
  "!d": { "type": "tabs.close.force" },
  "u": { "type": "tabs.reopen" },
  "K": { "type": "tabs.prev" },
  "J": { "type": "tabs.next" },
  "gT": { "type": "tabs.prev" },
  "gt": { "type": "tabs.next" },
  "g0": { "type": "tabs.first" },
  "g$": { "type": "tabs.last" },
  "<C-6>": { "type": "tabs.prevsel" },
  "r": { "type": "tabs.reload", "cache": false },
  "R": { "type": "tabs.reload", "cache": true },
  "zp": { "type": "tabs.pin.toggle" },
  "zd": { "type": "tabs.duplicate" },
  "+": { "type": "zoom.in" },
  "-": { "type": "zoom.out" },
  "zz": { "type": "zoom.neutral" },
  "f": { "type": "follow.start", "newTab": false },
  "F": { "type": "follow.start", "newTab": true, "background": false },
  "m": { "type": "mark.set.prefix" },
  "'": { "type": "mark.jump.prefix" },
  "H": { "type": "navigate.history.prev" },
  "L": { "type": "navigate.history.next" },
  "[[": { "type": "navigate.link.prev" },
  "]]": { "type": "navigate.link.next" },
  "gu": { "type": "navigate.parent" },
  "gU": { "type": "navigate.root" },
  "gi": { "type": "focus.input" },
  "gf": { "type": "page.source" },
  "gh": { "type": "page.home" },
  "gH": { "type": "page.home", "newTab": true },
  "y": { "type": "urls.yank" },
  "p": { "type": "urls.paste", "newTab": false },
  "P": { "type": "urls.paste", "newTab": true },
  "/": { "type": "find.start" },
  "n": { "type": "find.next" },
  "N": { "type": "find.prev" },
  ".": { "type": "repeat.last" },
  "<S-Esc>": { "type": "addon.toggle.enabled" }
},
"search": {
  "default": "google",
  "engines": {
    "google": "https://google.com/search?q={}"
  }
},
"properties": {
  "hintchars": "abcdeghijklmnopqrstuvwxyz",
  "smoothscroll": false,
  "complete": "sbh",
  "colorscheme": "system"
},
"blacklist": [
]
}
```

## [source from](https://ftp.mozilla.org/pub/firefox/candidates/86.0.1-candidates/build1/win64/en-US/)
## [vim vixen](https://github.com/ueokande/vim-vixen)
## [ublock](https://github.com/gorhill/uBlock)

