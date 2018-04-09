local inspect = require('mk/uic/lib/inspect');
local uuid = 0;

local function ReactElement(type, key, props)
  local element = {
    typeof = 'UI_ELEMENT_TYPE',
    -- Built-in properties that belong on the element
    type = type,
    key = key,
    props = props
  };

  return element;
end;

-- Modeled after React.createElement
--
-- React.createElement(
--   type,
--   [props],
--   [...children]
-- )
local function createElement(type, props, childrens)
  props = props or {};
  childrens = childrens or {};
  uuid = uuid + 1;
  local key = props.key or ('key_' .. uuid);

  -- Children can be more than one argument, and those are transferred onto
  -- the newly allocated props object.
  local childrenLength = #childrens;
  if childrenLength == 1 then
    props.children = children;
  elseif childrenLength > 1 then
    local childs = {}
    for i, child in ipairs(childrens) do
      childs[i] = child;
    end;
    props.children = childs;
  end;

  return ReactElement(
    type,
    key,
    props
  );
end;

return createElement;
