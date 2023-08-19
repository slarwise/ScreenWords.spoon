local M = {}

function M:init()
  M.logger = hs.logger.new("ScreenWords", "debug")
  M.chooser = hs.chooser.new(function(selection)
    if not selection then return end
    hs.eventtap.keyStrokes(selection.text)
  end)
  M.script = hs.spoons.resourcePath("extract-words")
end

function M:bindHotKeys(mapping)
  local spec = {
    chooseWord = hs.fnutils.partial(self.chooseWord, self)
  }
  hs.spoons.bindHotkeysToSpec(spec, mapping)
  return self
end

function M:chooseWord()
  local output, status = hs.execute(M.script, true)
  if not status then
    M.logger.e(string.format("command exited with error: %s", output))
    return
  end

  local choices = {}
  for line in output:gmatch("%S+") do
    table.insert(choices, { text = line })
  end
  M.chooser:choices(choices)
  M.chooser:show()
end

return M
