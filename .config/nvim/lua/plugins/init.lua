-- lua/plugins/init.lua
-- このファイルは、lazy.nvim に渡すプラグインスペックのリストを動的に生成します。
-- 'plugins/' ディレクトリ内のサブディレクトリをスキャンし、
-- 各サブディレクトリにある .lua ファイルをプラグイン設定として自動的に読み込みます。

local specs = {}
local plugins_module_path = "plugins" -- 'plugins'ディレクトリのLuaモジュールパス名

-- Neovimの設定ディレクトリのパスと 'plugins' ディレクトリ名を結合し、絶対パスを取得
local base_plugins_dir = vim.fn.stdpath("config") .. "/lua/" .. plugins_module_path

-- 'base_plugins_dir' 内の各エントリ (ファイルまたはディレクトリ) をループ
-- vim.fs.dir は名前とタイプをペアで返すイテレータ
for dir_name, entry_type in vim.fs.dir(base_plugins_dir) do
  -- エントリがディレクトリである場合のみ処理
  if entry_type == "directory" then
    local dir_full_path = base_plugins_dir .. "/" .. dir_name
    
    -- サブディレクトリ内の各エントリをループ
    for file_name_with_ext, file_entry_type in vim.fs.dir(dir_full_path) do
      -- エントリがファイルであり、かつ .lua 拡張子を持つ場合のみ処理
      if file_entry_type == "file" and file_name_with_ext:match("%.lua$") then
        local file_name = file_name_with_ext:gsub("%.lua$", "") -- 拡張子を除いたファイル名
        -- Luaの 'require' が認識できるモジュールパスを構築
        -- 例: "plugins.completion.autopairs"
        local module_path = table.concat({ plugins_module_path, dir_name, file_name }, ".")
        
        -- pcall を使用してプラグイン設定ファイルを安全に読み込み
        -- エラーが発生しても全体が停止しないようにする
        local ok, spec = pcall(require, module_path)
        
        -- 読み込みが成功し、返された値がテーブル（プラグインスペック）である場合のみ追加
        if ok and type(spec) == "table" then
          table.insert(specs, spec)
        else
          -- 読み込み失敗または不正な形式の場合、通知を表示
          vim.notify("Failed to load plugin spec: " .. module_path .. "\n" .. tostring(spec), vim.log.levels.ERROR)
        end
      end
    end
  end
end

-- lazy.nvim に渡すプラグインスペックのリストを返す
return specs

