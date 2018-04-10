local inspect = require('mk/uic/lib/inspect');
local reconcilier = require('mk/uic/lib/reconcilier').reconcilier;
assert(reconcilier, 'reconciler ok');

local Renderer = require('mk/uic/lib/reconcilier').Renderer;
assert(Renderer, 'Renderer ok');

local rr = Renderer:new();
assert(rr, 'renderer ok');
local instance = rr.createInstance('Dialog', { foo = 'bar' });
print(inspect(instance));
assert(instance, 'rr:createInstance');
assert(instance.key == 'key_1', 'rr:createInstance.key');
assert(instance.type, 'rr:createInstance.type');
assert(inspect(instance.props) == inspect({ foo = 'bar' }), 'rr:createInstance.props');
assert(instance.typeof == 'UI_ELEMENT_TYPE', 'rr:createInstance.typeof');
