-- import React, { Component } from 'react';
-- import { Document, Text, render } from '../src';
local render = require('mk/uic/lib/render');
local e = require('mk/uic/lib/createElement');

local App = {};

function App:new()
  local app = {};
  setmetatable(app, self);
  self.__index = self;
  return app;
end;

function App:click(e)
  print('Oh my, we got an event');
end;

function App:render()
  local click = self.click;

  -- return [[
  --   <Document>
  --     <Text onClick={click}>Hell yeah! The new renderer api is working.</Text>
  --     <Text>Congrats! You've successfully completed the tutorial. I'm excited to see what you build</Text>
  --   </Document>
  -- ]]
  return e('DIV', { className = 'yo' }, {
    e('TEXT', { onClick = click }, 'Oh yeah'),
    e('TEXT', {}, 'What what')
  });
end;

-- This will create a file 'test.output.html' in the current directory!
render(App, './test.output.html');
