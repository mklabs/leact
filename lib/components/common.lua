local Component = require('mk/uic/lib/component');

local Common = Component:new();

function Common:new()
  local foobar = {};
  setmetatable(foobar, self);
  self.__index = self;

  return foobar;
end;

return Common
