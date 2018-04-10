local inspect = require('mk/uic/lib/inspect');
local createElement = require('mk/uic/lib/element').createElement;
local e = require('mk/uic/lib/element').createReactElement;

local Renderer = {};

function Renderer:new()
  local r = {};
  setmetatable(r, self);
  self.__index = self;
  return r;
end;

function Renderer:createContainer(component)
  local children = component.props.children;
  local root = e(component.type, component.props, children);
  local container = e(component.type, component.props, root);
  return container.ui:createContainer();
end;

function Renderer:updateContainer(element, node, priority)
  -- node:renderChildren();
  element:render();
end;

return Renderer;
