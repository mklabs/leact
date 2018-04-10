local inspect = require('mk/uic/lib/inspect');
local uic = require('mk/uic/uic');
local e = uic.element;
local render = uic.render;

local eq = function(a, b, msg)
  msg = msg or '';
  return assert(a == b, 'AssertionError: ' .. msg);
end

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

-- common wrapper
-- el = uic.common();
-- assert(el, 'el is not nil');
-- assert(el.key, 'key is not nil');
-- assert(el.type, 'type is not nil');
-- assert(el.props, 'props is not nil');
-- assert(el.key, 'el is not nil');

-- render API
local renderEl = e('foo')
local rendered = render(renderEl);
print(inspect(rendered.el));
assert(rendered, 'rendered OK');
assert(rendered.el, 'rendered el');

-- print(inspect(el));

print(inspect(el));
print('---- vs ----')
print(inspect(expected));
eq(inspect(el), inspect(expected), 'Not same output as expected')

print('Everything went fine');
