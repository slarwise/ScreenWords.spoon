local M = {}

local logger = hs.logger.new("screencomplete", "debug")
logger.d("yoooo")
local eventtap = hs.eventtap

local chooser = hs.chooser.new(function(selection)
  if not selection then return end
  eventtap.keyStrokes(selection.text)
end)

M.run = function()
  local output, status = hs.execute(
    "/Users/arvidbjurklint/projects/hammerspoon/screencomplete/screencomplete",
    true
  )
  if not status then
    logger.e(string.format("command exited with error: %s"), output)
    return
  end

  local choices = {}
  for line in output:gmatch("%S+") do
    table.insert(choices, { text = line })
  end
  chooser:choices(choices)
  chooser:show()
end

return M
