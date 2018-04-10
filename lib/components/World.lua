local Component = require('mk/uic/lib/components/component');
local Div = require('mk/uic/lib/components/Div');
local inspect = require('mk/uic/lib/inspect');
local e = require('mk/uic/lib/createElement');

local World = Component:new();

local renderToString = function (element)
  local rendered = element:render();

  if type(rendered) == 'string' then
    return rendered;
  elseif type(rendered) == 'table' then
    element:renderToString();
  end;
end;

local function uiroot(component)
  local root = {}

  root.createContainer = function()
    -- TODO: implement main mod logic for creating main panel
    return Div:new(component, {
      className = 'hey'
    });
  end;

  root.render = function()
    component:render();
    return component;
  end;


  root.renderToString = function()
    local res = component:render();
    return renderToString(component);
  end;

  return root;
end;

-- This creates the game interface world instance
function World:new()
  local world = {};
  setmetatable(world, self);
  self.__index = self;
  -- mock for now
  world.ui = uiroot(self);
  return world;
end;

function World:render()
  local props = self.props;
  local state = self.state;
  return self:fiber();
end;

function World:fiber()
  -- TODO: See how to batch changes in a scheduler and get back the state here, for now generating something static
  return e('DIV', { className = 'yo' }, {
    e('TEXT', { onClick = click }, 'TBD')
  });
end;

return World;
