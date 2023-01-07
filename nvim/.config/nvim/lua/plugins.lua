local fn = vim.fn

-- auto install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer...')
	vim.cmd([[packadd packer.nvim]])
end

-- autocmd that reloads nvim when save plugins.lua file
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- protected call
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- use popup window
packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded'})
		end,
	},
})

-- install plugins
return packer.startup(function(use)

	use({ 'wbthomason/packer.nvim' })			                -- packer manager
	use({ 'nvim-lua/plenary.nvim' })			                -- required
	use({ 'nvim-lua/popup.nvim' })				                -- required
  use({ 'TimUntersberger/neogit' })                     -- git client
  use({ 'sindrets/diffview.nvim' })                     -- show stylish git diff
	use({ 'github/copilot.vim' })				                  -- github copilot
  use({ 'iamcco/markdown-preview.nvim' })               -- markdown preview on browser
  use({ 'chen244/csv-tools.lua' })                      -- colorize csv

  -- auto setup
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

