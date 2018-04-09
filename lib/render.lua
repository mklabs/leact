local e = require('mk/uic/lib/element');

--[[
<Frame>
  <Text>Define your starting position</Text>
  <Input name="position_x" />
  <Input name="position_y" />
  <Button onClick="onClickEvent">Apply</Button>
</Frame>
--]]
-- local panel = e('Frame', null,
--   e('Text', { text = 'Define your starting position' }),
--   e('Input', { name = 'position_x' text = 'x' }),
--   e('Input', { name = 'position_y' teyt = 'y' }),
--   e('Button', { onClick = 'onClickEvent' }, 'Apply')
-- );

local function typeToComponent(type, parent)
  parent = parent or {};

  -- if type == 'Frame' then
  --   return Frame.new(key or 'Frame');
  -- elseif type == 'Input' then
  --   return TextBox.new(key or 'Input', parent);
  -- elseif type == 'TextBox' then
  --   return TextBox.new(key or 'TextBox', parent);
  -- elseif type == 'Text' then
  --   return Text.new(key or 'Text', parent, 'NORMAL', props.text or 'Default text');
  -- elseif type == 'Button' then
  --   return Button.new(key or 'Button', parent, '', props.type or 'SQUARE', props.img or 'ui/skins/default/icon_end_turn.png');
  -- end;

  error('Unable to create element with type', type);
end;

local function uimf(element)
  local key = element.key;
  local type = element.type;
  local props = element.props;

  local children = {}
  if not props.children then
    local element = typeToComponent(type, element);
    -- return uimf(element);
    print('created element');
    return;
  end;

  local elements = {}
  local children = props.children;
  for i, child in ipairs(children) do
    local element = typeToComponent(child.type, child);
    if not element then
      error('Unable to create element with type' .. type);
    end;

    elements[i] = element;
  end;

  return elements;
end;

local function render(element)
  local key = element.key;
  local type = element.type;
  local props = element.props;

  local children = {}
  if not props.children then
    return uimf(e(type, props));
  end;

  for i, child in ipairs(props.children) do
    children[i] = e(child.type, child.props, child.children);
  end;

  local root = e(type, props, children);
  return uimf(root);
end;

return render;
