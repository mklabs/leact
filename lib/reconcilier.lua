local inspect = require('mk/uic/lib/inspect');
local createElement = require('mk/uic/lib/element').createReactElement;
local Renderer = require('mk/uic/lib/Renderer');
local ROOT_NODE_INSTANCE = nil

local function reconcilier(hostedConfig)
  local renderer = Renderer:new();
  for key, config in pairs(hostedConfig) do
    renderer[key] = config;
  end;

  return renderer;
end;

local Renderer = reconcilier({

  -- createInstance
  --
  -- This method creates a component instance with type, props and
  -- internalInstanceHandle.
  --
  -- Example - Let's say we render,
  --
  --     <Text>Hello World</Text>
  --
  -- createInstance will then return the information about the type of an
  -- element (' TEXT '), props ( { children: 'Hello World' } ), and the root
  -- instance (GameInterfaceWorld).
  createInstance = function(type, props, internalInstanceHandle)
    return createElement(type, props, internalInstanceHandle);
  end,

  -- appendInitialChild
  --
  -- It appends the children. If children are wrapped inside a parent component
  -- (eg: World), then we will add all the children to it else we will
  -- create a property called root on a parent node and append all the
  -- children to it. This will be helpful when we will parse the input
  -- component and make a call to the render method of our component.
  --
  -- Example -
  --
  --     local data = root.render(); // returns the output
  appendInitialChild = function(parentInstance, child)
    if parentInstance.appendChild then
      parentInstance:appendChild(child);
    else
      parentInstance.root = child;
    end;
  end,

  createTextInstance = function(text, rootContainerInstance, internalInstanceHandle)
    return text;
  end,

  finalizeInitialChildren = function(wordElement, type, props)
    return false;
  end,

  getPublicInstance = function(inst)
    return inst;
  end,

  prepareForCommit = function()
    -- noop
  end,

  prepareUpdate = function(wordElement, type, oldProps, newProps)
    return true;
  end,

  resetAfterCommit = function()
    -- noop
  end,

  resetTextContent = function(wordElement)
    -- noop
  end,

  getRootHostContext = function(instance)
    if instance then
      ROOT_NODE_INSTANCE = instance
      return ROOT_NODE_INSTANCE;
      else
      print('instance is not an instance of something we support')
    end;

    ROOT_NODE_INSTANCE = WordDocument:new();
    return ROOT_NODE_INSTANCE;
  end,

  getChildHostContext = function(instance)
    return emptyObject;
  end,

  shouldSetTextContent = function(type, props)
    return false;
  end,

  now = function() return {} end,
  useSyncScheduling = true,

  mutation = {
    appendChild = function(parentInstance, child)
      if parentInstance.appendChild then
        parentInstance:appendChild(child);
      else
        parentInstance.root = child;
      end
    end,

    appendChildToContainer = function(parentInstance, child)
      if parentInstance.appendChild then
        parentInstance:appendChild(child);
      else
        parentInstance.root = child;
      end
    end,

    removeChild = function(parentInstance, child)
      parentInstance:removeChild(child);
    end,

    removeChildFromContainer = function(parentInstance, child)
      parentInstance:removeChild(child);
    end,

    insertBefore = function(parentInstance, child, beforeChild)
      -- noob
    end,

    commitUpdate = function(instance, updatePayload, type, oldProps, newProps)
      -- noop
    end,

    commitMount = function(instance, updatePayload, type, oldProps, newProps)
      -- noop
    end,

    commitTextUpdate = function(textInstance, oldText, newText)
      textInstance.children = newText;
    end
  }
});

return {
  reconcilier = reconcilier,
  Renderer = Renderer
};
