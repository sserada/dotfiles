local options = {
  encoding = 'utf-8',
  fileencoding = 'utf-8',
  number = true,
  ignorecase = true,
  smartcase = true,
  hidden = true,
  backup = false,
  autoindent = true,
  smartindent = true,
  smarttab = true,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  laststatus = 3,
  clipboard = 'unnamedplus',
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
