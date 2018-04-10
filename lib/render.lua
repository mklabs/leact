local e = require('mk/uic/lib/createElement');
local WorldRenderer = require('mk/uic/lib/reconcilier').Renderer;
local parse = require('mk/uic/lib/parse');
local inspect = require('mk/uic/lib/inspect');

local function writeToFile(filename, text)
  local log = io.open(filename, 'w');
  log:write(text..'\n');
  log:flush();
  log:close();
end

-- Renders the input component to the given filepath
local function render(element, filepath)
  -- Create root container instance
  local container = e('ROOT');

  -- returns the current fiber (flushed fiber)
  local node = WorldRenderer:createContainer(container);

  -- Schedules a top level update with current fiber and a priority level
  -- (depending upon the context)
  WorldRenderer:updateContainer(element, node, null);

  -- Parse the input component and return the output
  local output = parse(node).toBuffer();
  return writeToFile(filepath, output.root:renderToString());
end;

return render;
