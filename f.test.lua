local f = require('mk/uic/lib/F');

local d = 99
local c = (d - 32) / 9 * 5

local click = function(e)
  print('omgad');
end;

print(f[[
  <Document>
    <Text onClick={click}>Hell yeah! The new renderer api is working.</Text>
    <Text>Congrats! You've successfully completed the tutorial. I'm excited to see what you build</Text>
  </Document>
]])
