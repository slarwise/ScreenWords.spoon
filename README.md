# ScreenWords.spoon

A [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) spoon (plugin) that
extracts all words on screen and lets you choose and input one of them into
whatever is currently focused. Hammerspoon is an automation software for MacOS.

TODO: Add image/gif of example usage.

## Installation

Clone this repository into the Spoons directory:

```sh
mkdir -p ~/.hammerspoon/Spoons
git clone https://github.com/slarwise/ScreenWords.spoon ~/.hammerspoon/Spoons
```

## Usage

Add the following to your `~/.hammerspoon/init.lua`:

```lua
hs.loadSpoon("ScreenWords")
spoon.ScreenWords:bindHotKeys({
  chooseWord = { { "cmd", "alt" }, "w" },
})
```

Replace the hotkey for `chooseWord` to whatever you prefer.
