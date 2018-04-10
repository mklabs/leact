local uuid = 0;

local function createElement(type, props, children)
  props = props or {};
  children = children or {};

  -- Children can be more than one argument, and those are transferred onto
  -- the newly allocated props object.
  local childrenLength = #children;
  if childrenLength == 1 then
    props.children = children;
  elseif childrenLength > 1 then
    local childs = {}
    for i, child in ipairs(children) do
      childs[i] = child;
    end;
    props.children = childs;
  end;

  uuid = uuid + 1;
  return {
    typeof = 'UI_ELEMENT_TYPE',

    key = 'UI_ELEMENT_TYPE_' .. type .. '_' .. uuid,

    -- Built-in properties that belong on the element
    type = type,
    -- key = key,
    props = props,
    -- root = createReactElement('ROOT'),
    ref = nil
  };
end;

return createElement;
