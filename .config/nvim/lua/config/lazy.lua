local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"  -- lazy.nvimのパスを設定
if not (vim.uv or vim.loop).fs_stat(lazypath) then            -- lazy.nvimが存在しない場合、gitコマンドでlazy.nvimをクローン
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)                                   -- ランタイムパスにlazy.nvimを追加

require("lazy").setup("plugins")                                -- pluginsディレクトリ内のプラグイン設定を読み込む

