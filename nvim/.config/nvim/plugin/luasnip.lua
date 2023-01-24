local ls = require('luasnip')
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic = ls.dynamic_node


ls.add_snippets(nil, {
  cpp = {
    snip({
      trig = 'std',
      }, {
      text({'#include <bits/stdc++.h>', 'using namespace std;', ''}),
      insert(0),
    }),
    snip({
      trig = 'for',
      }, {
      text('for (int i = '),
      insert(1),
      text('; i < '),
      insert(2),
      text('; i++) {'),
      insert(0),
    }),
    snip({
      trig = 'll',
      }, {
      text('long long '),
      insert(1),
      text(';'),
      insert(0),
    }),
  },
})

