local e = require('mk/uic/lib/element');
local Component = require('mk/uic/lib/components/component');

local function createComponent(type, element)
  print('create component', type);
  return Component:new(element);
end;

local function renderElement(element)
  local key = element.key;
  local type = element.type;
  local props = element.props;

  local children = {}
  if not props.children then
    local element = createComponent(type, element);
    return { element };
  end;

  local elements = {}
  local children = props.children;
  for i, child in ipairs(children) do
    local element = createComponent(child.type, child);
    if not element then
      error('Unable to create element with type' .. type);
    end;

    elements[i] = element;
  end;


  local root = [#elements]
  return root;
end;

local function render(element)
  local key = element.key;
  local type = element.type;
  local props = element.props;

  local children = {}
  if not props.children then
    return renderElement(e(type, props));
  end;

  for i, child in ipairs(props.children) do
    children[i] = e(child.type, child.props, child.children);
  end;

  local root = e(type, props, children);
  return renderElement(root);
end;

return render;
