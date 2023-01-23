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
      trig = 'include',
      }, {
        node(1, {
          text('#include <'),
          insert(1),
          text('>'),
        }),
        node(1, {
          text('using namespace std;'),
        }),
      }
    ),
  },
})

