local Component = require('mk/uic/lib/components/component')
local Frame = Component:new();

function Frame:new()
  local frame = {};
  setmetatable(frame, self);
  self.__index = self;
  return frame;
end;

return Frame
