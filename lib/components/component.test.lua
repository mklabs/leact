local inspect = require('mk/uic/lib/inspect');
local Component = require('mk/uic/lib/components/component');

local c = Component:new();
local methods = {
  'render',
  'componentWillUpdate',
  'componentDidUpdate',
  'componentWillMount',
  'componentWillUnmount',
  'componentDidMount',
  'componentWillReceiveProps',
  'shouldComponentUpdate',
  'componentWillUpdate',
  'componentDidUpdate',
  'componentDidCatch',
  'componentWillReceiveProps'
};
assert(c, 'component without props');

c = Component:new({ name = 'foo' });
print(inspect(c));
assert(c, 'component with props');
assert(c.props.name == 'foo', 'component with props.name');

for i, m in ipairs(methods) do
  local method = c[m];
  assert(method, m .. ' exists in prototype')
end
