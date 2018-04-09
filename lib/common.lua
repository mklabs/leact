local element = require('mk/uic/lib/element');

local function common(...)
  return element('common', table.unpack(arg));
end;

return common;
