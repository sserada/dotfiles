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
      trig = 'atc',
      }, {
      text({'#include <bits/stdc++.h>', 'using namespace std;', ''}),
      text({'using ll=long long', ''}),
      text({'#define rep(i, n) for (int i = 0; i < (int)(n); i++)', ''}),
      text({'#define Rep(i,a,b) for(int i=(a);i<(b);i++)', ''}),
      text({'#define all(x) (x).begin(),(x).end()', ''}),
    }),
    snip({
      trig = 'std',
    }, {
      text({'#include <bits/stdc++.h>', 'using namespace std;', ''}),
      insert(0),
    }),
    snip({
      trig = 'main',
    }, {
      text({'int main() {', ''}),
      insert(0),
      text({'', '  return 0;', '}'}),
    }),
    snip({
      trig = 'print',
    }, {
      text('cout << '),
      insert(1),
      text(' << endl;'),
      insert(0),
    }),
    snip({
      trig = 'input',
    }, {
      text('cin >> '),
      insert(1),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'def',
    }, {
      text('void '),
      insert(1),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defi',
    }, {
      text('int '),
      insert(1),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defd',
    }, {
      text('double '),
      insert(1),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defll',
    }, {
      text('long long '),
      insert(1),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defstr',
    }, {
      text('string '),
      insert(1),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defvec',
    }, {
      text('vector<'),
      insert(1),
      text('> '),
      insert(2),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defmap',
    }, {
      text('map<'),
      insert(1),
      text(', '),
      insert(2),
      text('> '),
      insert(3),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defset',
    }, {
      text('set<'),
      insert(1),
      text('> '),
      insert(2),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'defpair',
    }, {
      text('pair<'),
      insert(1),
      text(', '),
      insert(2),
      text('> '),
      insert(3),
      text('() {'),
      insert(0),
      text('}'),
    }),
    snip({
      trig = 'int',
    }, {
      text('int '),
      insert(1),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'double',
    }, {
      text('double '),
      insert(1),
      text(';'),
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
    snip({
      trig = 'str',
    }, {
      text('string '),
      insert(1),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'vec',
    }, {
      text('vector<'),
      insert(1),
      text('> '),
      insert(2),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'map',
    }, {
      text('map<'),
      insert(1),
      text(', '),
      insert(2),
      text('> '),
      insert(3),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'set',
    }, {
      text('set<'),
      insert(1),
      text('> '),
      insert(2),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'pair',
    }, {
      text('pair<'),
      insert(1),
      text(', '),
      insert(2),
      text('> '),
      insert(3),
      text(';'),
      insert(0),
    }),
    snip({
      trig = 'if',
    }, {
      text('if ('),
      insert(1),
      text(') {'),
      insert(0),
    }),
    snip({
      trig = 'else',
    }, {
      text('} else {'),
      insert(0),
    }),
    snip({
      trig = 'elif',
    }, {
      text('} else if ('),
      insert(1),
      text(') {'),
      insert(0),
    }),
    snip({
      trig = 'while',
    }, {
      text('while ('),
      insert(1),
      text(') {'),
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
      trig = 'unionfind',
    }, {
      text({
        'struct UnionFind {',
        '  vector<int> par;',
        '',
        '  UnionFind(int n) : par(n) {',
        '    for (int i = 0; i < n; i++) par[i] = i;',
        '  }',
        '',
        '  int root(int x) {',
        '    if (par[x] == x) return x;',
        '    return par[x] = root(par[x]);',
        '  }',
        '',
        '  bool same(int x, int y) {',
        '    return root(x) == root(y);',
        '  }',
        '',
        '  void unite(int x, int y) {',
        '    x = root(x);',
        '    y = root(y);',
        '    if (x == y) return;',
        '    par[x] = y;',
        '  }',
        '};',
      }),
      insert(0),
    }),
  },
})

