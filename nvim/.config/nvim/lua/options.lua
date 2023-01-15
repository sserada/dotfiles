local options = {

  encoding = 'utf-8',                 -- character encoding
  fileencoding = 'utf-8',             -- file encoding
  number = true,                      -- set numbered lines
  ignorecase = true,                  -- ignore case in search patterns
  smartcase = true,                   -- override the 'ignorecase' option if the search pattern contains upper case characters
  hidden = true,                      -- enable modified buffers in background
  backup = false,                     -- don't keep a backup file
  autoindent = true,                  -- copy indent from current line when starting a new line
  smartindent = true,                 -- make indenting smart
  smarttab = true,                    -- insert tabs when pressing tab in front of a line
  expandtab = true,                   -- use spaces instead of tabs
  shiftwidth = 2,                     -- the number of spaces inserted for each indentation
  tabstop = 2,                        -- the number of spaces that a <Tab> counts for
  shiftwidth = 2,                     -- the number of spaces inserted for each indentation
  laststatus = 3,
  clipboard = 'unnamedplus',          -- allows neovim to access the system clipboard

}


for key, value in pairs(options) do
  vim.opt[key] = value
end
