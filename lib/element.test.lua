local inspect = require('mk/uic/lib/inspect');
local uic = require('mk/uic/lib/element');

local eq = function(a, b, msg)
  msg = msg or '';
  return assert(a == b, 'AssertionError: ' .. msg);
end


print('Everything went fine');
