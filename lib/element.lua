local inspect = require('mk/uic/lib/inspect');
local World = require('mk/uic/lib/components/World');
local Div = require('mk/uic/lib/components/Div');
local TextNode = require('mk/uic/lib/components/TextNode');
local Input = require('mk/uic/lib/components/Input');


-- Modeled after React.createElement
--
-- React.createElement(
--   type,
--   [props],
--   [...children]
-- )
--
-- function createElement(type, props, root) {
--
--   const COMPONENTS = {
--     ROOT: () => new WordDocument(),
--     TEXT: () => new Text(root, props),
--     DOCUMENT: () => new Document(root, props),
--     default: undefined,
--   };
--
--   return COMPONENTS[type]() || COMPONENTS.default;
-- }


local function createReactElement(type, props, root)
  local COMPONENTS = {
    ROOT = function() return World:new() end,
    DIV = function() return Div:new(root, props) end,
    TEXT = function() return TextNode:new(root, props) end,
    INPUT = function() return Input:new(root, props) end,
    default = nil
  };

  -- print('Initializing component of type', type);
  return COMPONENTS[type]() or COMPONENTS.default;
end;


return {
  createReactElement = createReactElement
};
