local inspect = require('mk/uic/lib/inspect');

-- ### Class Properties
--
--   - [`defaultProps`](#defaultprops)
--   - [`displayName`](#displayname)
--
-- ### Instance Properties
--
--   - [`props`](#props)
--   - [`state`](#state)

local Component = {
  defaultProps = {},
  displayName = ''
};

local NoopUpdateQueue = {};
function NoopUpdateQueue:new() end
function NoopUpdateQueue:enqueueSetState(issuer, state, callback, key) end
function NoopUpdateQueue:enqueueForceUpdate(issuer, callback, key) end

function Component:new(props, state, updater)
  props = props or {};
  local component = {};
  setmetatable(component, self);
  self.__index = self;
  component.props = props;
  component.context = context;

  -- Initialize the default updater but the real one gets injected by the
  -- renderer.
  component.updater = updater or NoopUpdateQueue;
  component.state = {};
  component.type = props.type or 'DIV';

  return component;
end;

-- #### Mounting
--
-- These methods are called when an instance of a component is being created and
-- inserted into the DOM:
--
-- - [`constructor()`](#constructor)
-- - [`static getDerivedStateFromProps()`](#static-getderivedstatefromprops)
-- - [`componentWillMount()` / `UNSAFE_componentWillMount()`](#unsafe_componentwillmount)
-- - [`render()`](#render)
-- - [`componentDidMount()`](#componentdidmount)
function Component:componentWillMount()
  print('Component will mount', inspect(self));
end;

function Component:componentDidMount()
  print('Component did mount', inspect(self));
end;

-- #### Unmounting
--
-- This method is called when a component is being removed from the DOM:
--
-- - [`componentWillUnmount()`](#componentwillunmount)
function Component:componentWillUnmount()
  print('Component will unmount', inspect(self));
end;

-- #### Updating
--
-- An update can be caused by changes to props or state. These methods are called
-- when a component is being re-rendered:
--
-- - [`componentWillReceiveProps()` / `UNSAFE_componentWillReceiveProps()`](#unsafe_componentwillreceiveprops)
-- - [`shouldComponentUpdate()`](#shouldcomponentupdate)
-- - [`componentWillUpdate()` / `UNSAFE_componentWillUpdate()`](#unsafe_componentwillupdate)
-- - [`render()`](#render)
-- - [`componentDidUpdate()`](#componentdidupdate)
function Component:componentWillReceiveProps()
  print('Component will receive props', inspect(self));
end;

function Component:shouldComponentUpdate()
  print('Should component update', inspect(self));
end;

function Component:componentWillUpdate()
  print('Component will mount', inspect(self));
end;

function Component:render()
  print('todo, impelement render');
end;

function Component:componentDidUpdate()
  print('Component did update', inspect(self));
end;

-- #### Error Handling
--
-- This method is called when there is an error during rendering, in a lifecycle
-- method, or in the constructor of any child component.
--
-- - [`componentDidCatch()`](#componentdidcatch)
function Component:componentDidCatch()
  print('Component did catch', inspect(self));
end;

-- ### Other APIs
--
-- Each component also provides some other APIs:
--
--   - [`setState()`](#setstate)
--   - [`forceUpdate()`](#forceupdate)
function Component:forceUpdate(callback)
  -- print('Force update', inspect(self));
  self.updater:enqueueForceUpdate(self, callback, 'forceUpdate');
end;

function Component:setState(state, callback)
  -- print('set state', inspect(state));
  self.updater:enqueueSetState(self, state, callback, 'setState');
end;


-- TODO: Let's render to string here, till we finish the implementaiton
function Component:renderToString()
  local props = self.props;
  local state = self.state;

  self:forceUpdate();
  local r = self:render();
  return inspect(r)
end

return Component;
