local Component = require('mk/uic/lib/components/component');

local Div = Component:new();
function Div:new(root, props)
  local div = {};
  setmetatable(div, self);
  self.__index = self;

  -- Store all the children here
  div.children = {};

  div.root = root;
  div.props = props;

  return div;
end;

function Div:appendChild(child)
  self.children[key] = child;
end;

function Div:removeChild(child)
  table.remove(self.children, child.key);
end;

function Div:renderChildren()
  for key, child in pairs(self.children) do
    if type(child) == 'string' then
      -- not a component, render as a paragraph
      self.root.ui:mainContainer():addText(child);
    elseif type(child) == 'table' then
      -- thats a component, so we just call render() on it
      child:render();
    end;
  end;
end;

function Div:render()
  self:renderChildren();
end;

return Div;
