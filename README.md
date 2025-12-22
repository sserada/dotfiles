# dotfiles

個人用dotfiles設定。Zsh、Neovim、Gitの設定を含みます。

**対応OS**: macOS / Linux

## 含まれる設定

### Zsh
- **プラグインマネージャー**: [zinit](https://github.com/zdharma-continuum/zinit)
- **テーマ**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- **プラグイン**:
  - zsh-completions - 補完機能の強化
  - zsh-autosuggestions - コマンド履歴からの自動提案
  - zsh-syntax-highlighting - コマンドのシンタックスハイライト
  - fzf - ファジーファインダー
- **詳細**: [.zsh/README.md](./.zsh/README.md)

### Neovim
- **プラグインマネージャー**: [lazy.nvim](https://github.com/folke/lazy.nvim)
- **主要プラグイン**:
  - neo-tree.nvim - ファイルエクスプローラー
  - telescope.nvim - ファジーファインダー
  - nvim-treesitter - シンタックスハイライト
  - nvim-lspconfig + mason.nvim - LSP統合
  - nvim-cmp - 自動補完
  - gitsigns.nvim - Git統合
  - GitHub Copilot - AI補完
  - lualine.nvim - ステータスライン
  - which-key.nvim - キーマップヘルプ
  - nvim-surround - 括弧操作
  - trouble.nvim - 診断リスト
- **詳細**: [.config/nvim/lua/plugins/README.md](./.config/nvim/lua/plugins/README.md)

### Git
- **設定テンプレート**: [.gitconfig.template](./.gitconfig.template)
- **エディタ**: Neovim
- **コミットテンプレート**: [.commit_template](./.commit_template)
- **主な設定**:
  - カラー表示有効化
  - 便利なエイリアス（st, co, lg等）
  - pull時のrebase設定
  - 見やすいdiff設定
  - Git LFS対応
- **注意**: `.gitconfig`はテンプレートから生成されます（追跡されません）

## インストール

### 必要要件

- macOS または Linux
- [Homebrew](https://brew.sh/) (macOS) または パッケージマネージャー (Linux)
- Git

### 1. リポジトリのクローン

```bash
git clone https://github.com/sserada/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. 依存パッケージのインストール

**Homebrew (macOS/Linux):**
```bash
make install-deps
```

**手動インストール (Linux):**
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install -y neovim git fzf bat ripgrep fd-find

# Arch Linux
sudo pacman -S neovim git fzf bat eza zoxide ripgrep fd

# Fedora
sudo dnf install -y neovim git fzf bat eza zoxide ripgrep fd-find
```

インストールされるパッケージ：
- Neovim
- Git
- fzf（ファジーファインダー）
- bat（シンタックスハイライト付きcat）
- eza（モダンなls）※オプション
- zoxide（スマートなcd）※オプション
- ripgrep（高速なgrep）
- fd（高速なfind）

### 3. dotfilesのインストール

```bash
make install
```

これにより以下が実行されます：
1. 既存の設定ファイルをバックアップ（`backup/`ディレクトリ）
2. シンボリックリンクの作成
3. Git設定の適用

### 4. シェルの再起動

```bash
exec zsh
```

初回起動時：
- zinitがプラグインを自動インストール
- Powerlevel10k設定ウィザードが表示される

### 5. Git設定

`make install`を実行した場合は自動的に対話形式で設定されます。

手動で設定する場合：
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

または：
```bash
make install-git  # 対話的にユーザー名とメールアドレスを設定
```

### 6. Neovimのセットアップ

```bash
nvim
```

初回起動時にlazy.nvimがプラグインを自動インストールします。

## Makefileコマンド

| コマンド | 説明 |
|---|---|
| `make help` | 使用可能なコマンドを表示 |
| `make status` | 現在のシンボリックリンク状態を確認 |
| `make install` | 全てをインストール（バックアップ→リンク→Git設定） |
| `make install-deps` | 必要なパッケージをHomebrew経由でインストール |
| `make backup` | 既存の設定をバックアップ |
| `make install-links` | シンボリックリンクのみを作成 |
| `make install-git` | Git設定のみを適用 |
| `make uninstall` | シンボリックリンクを削除 |
| `make restore` | バックアップから復元 |
| `make clean` | バックアップディレクトリを削除 |

## ディレクトリ構造

```
dotfiles/
├── .config/
│   └── nvim/              # Neovim設定
│       ├── init.lua       # エントリーポイント
│       └── lua/
│           ├── config/    # 基本設定
│           └── plugins/   # プラグイン設定
│               ├── README.md
│               ├── completion/  # 補完系
│               ├── editing/     # 編集系
│               ├── finder/      # 検索系
│               ├── git/         # Git系
│               ├── lsp/         # LSP系
│               ├── ui/          # UI系
│               └── integration/ # 統合系
├── .zsh/                  # Zsh設定
│   ├── README.md          # Zsh設定の詳細
│   ├── zinit.zsh          # プラグイン管理
│   ├── fzf.zsh            # fzf設定
│   ├── option.zsh         # Zshオプション
│   ├── alias.zsh          # エイリアス定義
│   ├── p10k.zsh           # Powerlevel10kテーマ
│   ├── chrome.zsh         # Chrome関連
│   └── path.zsh           # PATH設定
├── .zshrc                 # Zshエントリーポイント
├── .gitconfig.template    # Git設定テンプレート
├── .gitconfig             # Git設定（生成されるファイル、追跡されない）
├── .commit_template       # Gitコミットテンプレート
├── .gitignore             # Git無視ファイル
├── Makefile               # インストール/管理スクリプト
├── setup.sh               # レガシーセットアップスクリプト
└── README.md              # このファイル
```

## カスタマイズ

### Zsh

エイリアスやオプションを変更：
```bash
nvim ~/.zsh/alias.zsh
nvim ~/.zsh/option.zsh
source ~/.zshrc  # 再読み込み
```

**注意 (Linux)**: `.zsh/alias.zsh`にはmacOS専用のアプリ起動エイリアス（`open -a`）が含まれています。Linux環境では該当するエイリアスをコメントアウトまたは削除してください。

プラグインを追加：
```bash
nvim ~/.zsh/zinit.zsh
# zinit light <plugin-name> を追加
source ~/.zshrc
```

### Neovim

プラグインを追加：
1. `~/.config/nvim/lua/plugins/<category>/` に新しい`.lua`ファイルを作成
2. lazy.nvimが自動的に読み込みます

既存プラグインの設定変更：
```bash
nvim ~/.config/nvim/lua/plugins/<category>/<plugin>.lua
```

### Git

テンプレートをカスタマイズ（dotfiles管理）：
```bash
nvim ~/dotfiles/.gitconfig.template
```

ローカルのGit設定を直接編集（追跡されない）：
```bash
nvim ~/.gitconfig
```

コミットテンプレートをカスタマイズ：
```bash
nvim ~/.commit_template
```

便利なGitエイリアス（設定済み）：
- `git st` - status
- `git co` - checkout
- `git lg` - 見やすいログ表示
- `git lga` - 全ブランチのグラフ表示

**注意**: `.gitconfig`はテンプレートから生成されます。個人的な設定（名前、メール等）は`.gitconfig`に保存され、Gitで追跡されません。

## トラブルシューティング

### Zsh

**プラグインがロードされない**
```bash
# zinitの再インストール
rm -rf ~/.local/share/zinit
exec zsh
```

**補完が効かない**
```bash
rm -f ~/.zcompdump*
autoload -Uz compinit && compinit
```

**fzfが見つからない**
```bash
brew install fzf
source ~/.zshrc
```

### Neovim

**プラグインがインストールされない**
```bash
nvim
# Neovim内で
:Lazy sync
```

**LSPが動かない**
```bash
nvim
# Neovim内で
:Mason
# 必要なLSPサーバーをインストール
```

**Treesitterのエラー**
```bash
nvim
# Neovim内で
:TSUpdate
```

### シンボリックリンク

**リンクが正しくない**
```bash
make status  # 状態確認
make uninstall  # 既存リンクを削除
make install-links  # 再作成
```

**元の設定に戻したい**
```bash
make restore  # バックアップから復元
```

## 主要なキーバインド

### Zsh

| キー | 機能 |
|---|---|
| `Ctrl+R` | fzfでコマンド履歴検索 |
| `Ctrl+F` | fzfでファイル検索してエディタで開く |
| `Ctrl+G` | fzfでディレクトリ検索して移動 |
| `Ctrl+P` / `Ctrl+N` | 履歴を前後検索 |

### Neovim

| キー | 機能 |
|---|---|
| `<leader>` | スペースキー |
| `<leader>e` | ファイルツリー表示/非表示 |
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | コード内を単語検索 |
| `<leader>fb` | バッファ検索 |
| `<leader>xx` | 診断リスト表示 |
| `gcc` | 行のコメントアウト/アンコメント |
| `gc` (Visual) | 選択範囲のコメントアウト |

詳細は各README.mdを参照：
- [Zsh設定詳細](./.zsh/README.md)
- [Neovim設定詳細](./.config/nvim/lua/plugins/README.md)

## 更新

```bash
cd ~/dotfiles
git pull
make install  # 必要に応じて
```

プラグインの更新：
```bash
# Zsh
exec zsh  # zinitが自動更新

# Neovim
nvim
:Lazy sync
```

## アンインストール

```bash
cd ~/dotfiles
make uninstall  # シンボリックリンクを削除
make restore    # バックアップから元の設定を復元
```

## ライセンス

このリポジトリは個人用の設定ファイルです。自由に使用・改変してください。
