# Neovim Plugins

このディレクトリで管理されているNeovimプラグインの説明。

## copilot.lua
[設定ファイル](./completion/copilot.lua)

GitHub Copilotプラグイン。コード補完機能を提供。

**設定:**

*   `lazy = false`: Neovim起動時に常時ロード。
*   `cmd = "Copilot"`: `:Copilot` コマンドによる手動有効化。
*   `event = InsertEnter`: 挿入モード移行時に有効化。

## gitsigns.lua
[設定ファイル](./git/gitsigns.lua)

Gitによる変更行の隣に、追加・変更・削除の記号を表示。

**キーマップ:**

| キー | モード | 説明 |
|---|---|---|
| `]c` | Normal | 次の変更箇所 (hunk) へ移動。 |
| `[c` | Normal | 前の変更箇所 (hunk) へ移動。 |
| `<leader>hs` | Normal, Visual | 変更箇所をステージ。 |
| `<leader>hr` | Normal, Visual | 変更箇所の変更をリセット。 |
| `<leader>hu` | Normal | ステージした変更の取り消し。 |
| `<leader>hb` | Normal | 現在行のGit blame情報を表示。 |

## gruvbox.lua
[設定ファイル](./ui/gruvbox.lua)

`gruvbox-flat` カラースキームの適用。

**設定:**

*   `priority = 1000`: 他プラグインより優先ロード。
*   `enabled = true`: カラースキームの有効化。
*   `vim.cmd([[colorscheme gruvbox-flat]])`: Neovimカラースキームを`gruvbox-flat`に設定。

## mason.lua
[設定ファイル](./lsp/mason.lua)

LSPサーバー、フォーマッター、リンター等、外部ツールの管理。
設定ファイルに基づき、下記ツールを自動インストール。

**LSPサーバー:**

*   `ts_ls` (TypeScript/JavaScript)
*   `html`
*   `cssls`
*   `tailwindcss`
*   `svelte`
*   `lua_ls`
*   `graphql`
*   `emmet_ls`
*   `prismals`
*   `pyright` (Python)

**フォーマッター & リンター:**

*   `prettier`
*   `stylua` (Lua)
*   `isort` (Python)
*   `black` (Python)
*   `pylint` (Python)
*   `eslint_d`

## neogit.lua
[設定ファイル](./git/neogit.lua)

EmacsのMagit風UIによるGit操作。

**コマンド:**

*   `:Neogit`: Neogitの起動。

## nvim-cmp.lua
[設定ファイル](./completion/nvim-cmp.lua)

コード補完プラグイン。

**キーマップ (挿入モード):**

| キー | 説明 |
|---|---|
| `<C-j>` | 次候補の選択。 |
| `<C-k>` | 前候補の選択。 |
| `<C-h>` | 補完の中断。 |
| `<C-l>` / `<CR>` | 選択候補の確定。 |

**補完ソース:**

*   LSP
*   現在のバッファ
*   ファイルパス
*   コマンドライン履歴
*   Git

## presence.lua
[設定ファイル](./integration/presence.lua)

Discord Rich Presence連携。編集中のファイル情報を表示。

## telescope.lua
[設定ファイル](./finder/telescope.lua)

ファイル、バッファ等を対象としたファジー検索プラグイン。

**キーマップ:**

| キー | 説明 |
|---|---|
| `<leader>ff` | プロジェクト内ファイルの検索。 |
| `<leader>fr` | 最近開いたファイルの検索。 |
| `<leader>fg` | プロジェクト内文字列のライブ検索 (grep)。 |
| `<leader>fb` | 開放中バッファの検索。 |

**検索ウィンドウ内のキーマップ (挿入モード):**

| キー | 説明 |
|---|---|
| `<C-j>` | 次アイテムの選択。 |
| `<C-k>` | 前アイテムの選択。 |
| `<C-q>` | 検索結果をQuickfixリストへ送信し、リストを開く。 |

## comment.lua
[設定ファイル](./editing/comment.lua)

コードのコメントアウト/アンコメントを簡単に行うプラグイン。言語の自動判別による、統一的な操作を提供。

**キーマップ:**

| キー | モード | 説明 |
|---|---|---|
| `gcc` | Normal | 現在行のコメントアウト/アンコメント。 |
| `gc` | Visual | 選択範囲のコメントアウト/アンコメント。 |

## autopairs.lua
[設定ファイル](./completion/autopairs.lua)

括弧や引用符などを自動で補完するプラグイン。`nvim-cmp`との連携による、入力体験の向上。

## treesitter.lua
[設定ファイル](./editing/treesitter.lua)

コードの構造を解析し、より正確でリッチな構文ハイライトを提供。

**主な機能:**
*   高速かつ詳細な構文解析による、精度の高いハイライト。
*   ファイルタイプに応じた、適切なインデントの提供。

**設定:**
*   `build = ":TSUpdate"`: インストール/更新時にパーサーをコンパイル。
*   `ensure_installed`: 対応する言語のパーサーリスト。
*   `auto_install = true`: パーサーの自動インストール。
