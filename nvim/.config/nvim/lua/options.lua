local options = {
  encoding = 'utf-8',                 -- character encoding
  fileencoding = 'utf-8',             -- file encoding

  title = true,                       -- set the title of window to the value of the titlestring
  number = true,                      -- set numbered lines
  laststatus = 2,                     -- always display the status line
  showmode = false,                   -- don't display the mode
  showcmd = true,                     -- display incomplete commands
  showmatch = true,                   -- show matching brackets when text indicator is over them
  matchtime = 1,                      -- time to blink when matching brackets

  wildmenu = true,                    -- display the possible matches in the command-line completion
  wildmode = 'longest:full,full',     -- command-line completion mode
  wildignorecase = true,              -- ignore case when completing file names

  hlsearch = true,                    -- highlight all matches on previous search pattern
  incsearch = true,                   -- show search matches incrementally
  ignorecase = true,                  -- ignore case in search patterns
  smartcase = true,                   -- override the 'ignorecase' option if the search pattern contains upper case characters

  hidden = true,                      -- enable modified buffers in background
  backup = false,                     -- don't keep a backup file

  splitbelow = true,                  -- put new windows below current
  splitright = true,                  -- put new windows right of current

  autoindent = true,                  -- copy indent from current line when starting a new line
  smartindent = true,                 -- make indenting smart
  smarttab = true,                    -- insert tabs when pressing tab in front of a line
  expandtab = true,                   -- use spaces instead of tabs
  shiftwidth = 2,                     -- the number of spaces inserted for each indentation
  tabstop = 2,                        -- the number of spaces that a <Tab> counts for
  shiftwidth = 2,                     -- the number of spaces inserted for each indentation

  scrolloff = 8,                      -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,                  -- minimal number of screen columns to keep to the left and right of the cursor

  mouse = 'a',                        -- enable mouse usage
  clipboard = 'unnamedplus',          -- use system clipboard

  updatetime = 300,                   -- time to wait before showing a previously hidden message
  timeoutlen = 500,                   -- time to wait for a mapped sequence to complete

  completeopt = 'menuone,noselect',   -- completion options
  shortmess = 'filnxtToOFc',          -- short messages
}


for key, value in pairs(options) do
  vim.opt[key] = value
end
