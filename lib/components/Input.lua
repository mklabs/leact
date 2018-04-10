local Component = require('mk/uic/lib/components/component');

local World = Component:new();

local function uiroot()
  local root = {}
  return root;
end;

-- This creates the game interface world instance
function World:new()
  local world = {};
  setmetatable(world, self);
  self.__index = self;
  -- mock for now
  self.ui_root = uiroot();
  return world;
end;

return World
