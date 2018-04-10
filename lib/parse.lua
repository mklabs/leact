local inspect = require('mk/uic/lib/inspect');

local function parse(input)

  local function parseComponent(inputComponent)
    local root = inputComponent.root;
    -- Render all the children and props
    root:render();

    return inputComponent;
  end;

  return {
    toBuffer = function()
      return parseComponent(input);
    end
  };
end;

return parse;
