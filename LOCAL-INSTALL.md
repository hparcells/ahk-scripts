## Local Install

*This is mainly reference for me when installing things on a new system.*

Install [Interception drivers](https://github.com/oblitum/Interception).

- I want to change this, as this is a weird setup, but Corsair needs to add per-keyboard profiles first.

Use and adjust `keyremap.ini` to use the desired keyboard device.

Install the following tools.

- [Node.js](https://nodejs.org/en)
- [AutoHotkey v1.1](https://www.autohotkey.com/)
- [7-Zip](https://www.7-zip.org/)
- [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)

Run the following within WSL.

- `sudo apt-get install nodejs` 
- `sudo apt-get install apcalc` 

Install [Node.js](https://nodejs.org/en) with NPM. Run the following commands.

- `cd js && npm i`
- `npm i -g chromix-too lorem-ipsum`

`chromix-too` CLI does not work on Windows for two reasons:
1. A missing environment variable (`USERPROFILE`).
2. Windows does not support `.sock` files. To fix this make a change to the following file. Replace the commented line with the uncommented line.

```js
// %appdata%/npm/node_modules/chromix-too/utils.js

// sock: require("path").join(process.env["HOME"], ".chromix-too.sock"),
sock: process.platform === "win32" ? "\\\\.\\pipe\\chromix-too" : require("path").join(process.env["HOME"], ".chromix-too.sock"),
```

- This change was made to reduce the delay when interacting with `chromix-too`. `chromix-too` was designed to be used on Unix systems, meaning a new Bash instance would have to be made for every `chromix-too` request from AutoHotkey.

Ensure `chromix-too-server` runs on startup. This can be achieved using an AutoHotkey script in your startup directory.

```ahk
; %appdata%/Microsoft/Windows/Start Menu/Programs/Startup
Run, chromix-too-server
```

The `chromix-too` Google Chrome extension was removed from the Chrome Web Store, and the bundled extension included with the NPM package uses Manifest V2 which is no longer supported. In this repository is `chromix-too-extension-mv3` with the following changes.

- Bump manifest version in `manifest.json`.
- Replace `background.scripts` array with `background.service_worker` in `manifest.json`.
- Move `<all_urls>` from `permissions` to `host_permissions` in `manifest.json`.
- Add `importScripts('utils.js')` to top of `background.js`.
- Replace `window` with `self` in `background.js` and `utils.js`.

Load the unpacked extension in Chrome. "Developer mode" must be enabled.

On first run, Spotify.ahk may ask for some permissions.
