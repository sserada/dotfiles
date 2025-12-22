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

## neo-tree.lua
[設定ファイル](./ui/neo-tree.lua)

サイドバーにプロジェクトのファイルツリーを表示するファイルエクスプローラー。

**キーマップ:**

| キー | 説明 |
|---|---|
| `<leader>e` | ファイルツリーの表示/非表示。 |
| `<leader>o` | ファイルツリーにフォーカス。 |

**ツリー内のキーマップ:**

| キー | 説明 |
|---|---|
| `l` | ファイルを開く/ディレクトリを展開。 |
| `h` | ディレクトリを閉じる。 |

**主な機能:**
*   現在開いているファイルをツリー内で自動的に表示。
*   Vim標準のファイルブラウザ（netrw）を置き換え。
*   ファイルアイコン表示で視覚的にわかりやすい。

## lualine.lua
[設定ファイル](./ui/lualine.lua)

画面下部に美しいステータスラインを表示するプラグイン。

**表示される情報:**

*   **左側:** 現在のモード、Gitブランチ、差分統計、ファイル名
*   **右側:** LSP診断、エンコード、ファイル形式、ファイルタイプ、ファイル内位置、カーソル位置

**主な機能:**
*   カラースキームに自動適応するテーマ。
*   全ウィンドウで共通のグローバルステータスライン。
*   Git情報やLSP診断を一目で確認可能。

## which-key.lua
[設定ファイル](./ui/which-key.lua)

キーマップのヘルプをポップアップで表示するプラグイン。

**使い方:**

`<leader>`キーや他のプレフィックスキーを押すと、0.5秒後に利用可能なコマンド一覧が画面下部にポップアップ表示されます。

**主な機能:**
*   キーマップを忘れても、表示されるヘルプから選択可能。
*   グループごとに整理された見やすい表示。
*   既存のキーマップを自動的に検出して表示。

**登録済みグループ:**
*   `<leader>f` - ファイル検索（Telescope）
*   `<leader>h` - Git操作（Gitsigns）
*   `<leader>e` / `<leader>o` - ファイルツリー（Neo-tree）

## surround.lua
[設定ファイル](./editing/surround.lua)

括弧・引用符・タグなどを簡単に追加・変更・削除するプラグイン。

**基本操作:**

| 操作 | キー | 例 |
|---|---|---|
| 追加 | `ys{motion}{char}` | `ysiw"` で単語を`"`で囲む |
| 変更 | `cs{old}{new}` | `cs"'` で`"`を`'`に変更 |
| 削除 | `ds{char}` | `ds"` で`"`を削除 |

**ビジュアルモード:**

| キー | 説明 |
|---|---|
| `S{char}` | 選択範囲を指定した文字で囲む |

**使用例:**

*   `ysiw)` - カーソル下の単語を`()`で囲む
*   `yss"` - 現在行全体を`"`で囲む
*   `cs"'` - `"`を`'`に変更
*   `ds(` - `()`を削除
*   ビジュアルモードで選択後`S<div>` - `<div></div>`タグで囲む

## trouble.lua
[設定ファイル](./lsp/trouble.lua)

LSPの診断（エラー・警告）、参照、シンボルなどを見やすくリスト表示するプラグイン。

**キーマップ:**

| キー | 説明 |
|---|---|
| `<leader>xx` | 全ての診断リストを表示/非表示。 |
| `<leader>xX` | 現在のバッファの診断リストを表示/非表示。 |
| `<leader>cs` | シンボル一覧を表示。 |
| `<leader>cl` | LSP定義/参照/その他を表示。 |
| `<leader>xL` | ロケーションリストを表示。 |
| `<leader>xQ` | Quickfixリストを表示。 |

**主な機能:**
*   プロジェクト全体のエラー・警告を一覧表示。
*   見やすいUIでコードの問題箇所をすぐに確認。
*   ファイルアイコン付きで視覚的にわかりやすい。
*   リスト内のアイテムをEnterで即座にジャンプ可能。
