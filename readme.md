# leact

Reimplementing some of the basic concepts of React createElement in lua.

## Usage

```lua
local createElement = require('leact');

-- Create and return a new leact element of the given type.
local element = createElement('type', { key = 'myKey', bar = 'bar' });
```

The main entry point function adheres to
[`React.createElement`](https://reactjs.org/docs/react-api.html#createelement)
signature (`createElement(type, [props], [...children])`)

See also [React Without JSX](https://reactjs.org/docs/react-without-jsx.html)

```lua
-- Create a more complex structure
local e = require('leact');
local root = e('common', { foo = 'with childs', key = 'bunch' }, {
  e('common', { foo = 'baz '}),
  e('common', { foo = 'with childs', key = 'inner' }, {
  e('common', { awesome = 'right' }),
  e('common', { awesome = 'right2' })
  }),
  e('common', { foo = 'bar '}),
  e('common', { foo = 'baaze '})
});
```

Example:

```lua
local expected = {
  key = "bunch",
  props = {
  children = { {
    key = "key_1",
    props = {
      foo = "baz "
    },
    type = "common",
    typeof = "UI_ELEMENT_TYPE"
    }, {
    key = "inner",
    props = {
      children = { {
        key = "key_2",
        props = {
        awesome = "right"
        },
        type = "common",
        typeof = "UI_ELEMENT_TYPE"
      }, {
        key = "key_3",
        props = {
        awesome = "right2"
        },
        type = "common",
        typeof = "UI_ELEMENT_TYPE"
      } },
      foo = "with childs",
      key = "inner"
    },
    type = "common",
    typeof = "UI_ELEMENT_TYPE"
    }, {
    key = "key_5",
    props = {
      foo = "bar "
    },
    type = "common",
    typeof = "UI_ELEMENT_TYPE"
    }, {
    key = "key_6",
    props = {
      foo = "baaze "
    },
    type = "common",
    typeof = "UI_ELEMENT_TYPE"
    } },
  foo = "with childs",
  key = "bunch"
  },
  type = "common",
  typeof = "UI_ELEMENT_TYPE"
};

local el = e('common', { foo = 'with childs', key = 'bunch' }, {
  e('common', { foo = 'baz '}),
  e('common', { foo = 'with childs', key = 'inner' }, {
  e('common', { awesome = 'right' }),
  e('common', { awesome = 'right2' })
  }),
  e('common', { foo = 'bar '}),
  e('common', { foo = 'baaze '})
});

assert(el, 'el is not nil');
assert(el.key, 'key is not nil');
assert(el.type, 'type is not nil');
assert(el.props, 'props is not nil');
assert(el.key, 'el is not nil');

print(inspect(el));
print('---- vs ----')
print(inspect(expected));
eq(inspect(el), inspect(expected), 'Not same output as expected')

print('Everything went fine');
```
