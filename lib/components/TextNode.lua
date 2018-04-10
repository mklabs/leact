local Component = require('mk/uic/lib/components/component');
local inspect = require('mk/uic/lib/inspect');

local TextNode = Component:new();

-- This creates the game interface world instance
function TextNode:new(root, props)
  local text = {};
  setmetatable(text, self);
  self.__index = self;

  -- Store all the children here
  text.children = {};

  text.root = root;
  text.props = props;

  text.adder = root.ui:createP();
  return text;
end;

function TextNode:appendChild(child)
  self.children[key] = child;
end;

function TextNode:removeChild(child)
  table.remove(self.children, child.key);
end;

-- Todo: See if need to handle nested component here
function TextNode:renderChildren()
  for key, child in pairs(self.children) do
    if type(child) == 'string' then
      self.adder.addText(child);
    end
  end;
end;

function TextNode:render()
  self:renderChildren();
end;

return TextNode;
