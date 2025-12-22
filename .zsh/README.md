# Zsh Configuration

このディレクトリで管理されているZsh設定の説明。

## 設定ファイル構成

`.zshrc`から以下のファイルを順番に読み込んでいます：

1. `option.zsh` - Zshの基本オプション設定
2. `zinit.zsh` - プラグインマネージャーとプラグインの設定
3. `p10k.zsh` - Powerlevel10kテーマの設定
4. `alias.zsh` - エイリアス定義
5. `chrome.zsh` - Chrome関連の設定
6. `fzf.zsh` - ファジーファインダーの設定とキーバインド
7. `path.zsh` - PATHの設定

---

## option.zsh
[設定ファイル](./option.zsh)

Zshの基本的な動作を設定。

**履歴管理:**
*   履歴ファイル: `~/.zsh_history`
*   履歴サイズ: 100,000件
*   セッション間で履歴を共有
*   重複コマンドを無視
*   タイムスタンプと実行時間を保存

**補完設定:**
*   大文字小文字を区別しない補完
*   メニュー選択形式の補完
*   グループ名表示

**その他:**
*   ディレクトリ名のみでcd可能（`auto_cd`）
*   コマンドの自動修正（`correct`）
*   ビープ音を無効化（`no_beep`）

**キーバインド:**

| キー | 説明 |
|---|---|
| `Ctrl+P` | 履歴を前方検索（入力済み文字で絞り込み） |
| `Ctrl+N` | 履歴を後方検索（入力済み文字で絞り込み） |

---

## zinit.zsh
[設定ファイル](./zinit.zsh)

プラグインマネージャー[zinit](https://github.com/zdharma-continuum/zinit)とプラグインの設定。

**インストール済みプラグイン:**

### テーマ

#### Powerlevel10k
`romkatv/powerlevel10k`

美しく高速なZshテーマ。Git情報、実行時間、ステータスなどを表示。

### 補完・サジェスト

#### zsh-completions
`zsh-users/zsh-completions`

追加の補完定義を提供。

#### zsh-autosuggestions
`zsh-users/zsh-autosuggestions`

過去の履歴から入力候補を灰色で表示。右矢印キーで確定。

**設定:**
*   サジェストの色: `fg=244`（灰色）

#### zsh-syntax-highlighting
`zsh-users/zsh-syntax-highlighting`

コマンドをリアルタイムでシンタックスハイライト表示。
*   正しいコマンド: 緑色
*   存在しないコマンド: 赤色
*   パス、オプションなども色分け

### ツール

#### fzf
`junegunn/fzf`

高速なファジーファインダー。履歴検索、ファイル検索、ディレクトリ移動など。

---

## p10k.zsh
[設定ファイル](./p10k.zsh)

Powerlevel10kテーマの詳細設定ファイル。

プロンプトの表示内容やスタイルをカスタマイズ。

---

## alias.zsh
[設定ファイル](./alias.zsh)

よく使うコマンドのエイリアス定義。

### ファイル操作

| エイリアス | コマンド | 説明 |
|---|---|---|
| `ls` | `ls -G` | 色付きリスト表示 |
| `la` | `ls -Gla` | 隠しファイルも含めて詳細表示 |
| `ll` | `ls -Gl` | 詳細表示 |
| `c` | `cd` | ディレクトリ移動 |
| `ws` | `cd ~/workspace` | workspaceへ移動 |

### アプリケーション起動

| エイリアス | アプリ |
|---|---|
| `note` | Notion |
| `ch` | Google Chrome |
| `vc` | Visual Studio Code |
| `pp` | Microsoft PowerPoint |
| `ex` | Microsoft Excel |
| `wd` | Microsoft Word |
| `ol` | Microsoft Outlook |
| `pv` | Prime Video |
| `dc` | Docker |

### Zsh

| エイリアス | コマンド | 説明 |
|---|---|---|
| `zrc` | `source ~/.zshrc` | 設定の再読み込み |

### Git

| エイリアス | コマンド | 説明 |
|---|---|---|
| `g` | `git` | Git |
| `ga` | `git add` | ステージング |
| `gaa` | `git add --all` | 全てステージング |
| `gcm` | `git commit -m` | コミット |
| `gp` | `git push` | プッシュ |
| `gpl` | `git pull` | プル |
| `gplu` | `git pull --rebase` | リベースプル |
| `gd` | `git diff` | 差分表示 |
| `gco` | `git checkout` | ブランチ切り替え |
| `gcom` | `git checkout main` | mainブランチへ |
| `gs` | `git status` | ステータス |
| `gl` | `git log` | ログ表示 |
| `gll` | `git log --oneline` | ログを1行で表示 |

### Docker

| エイリアス | コマンド | 説明 |
|---|---|---|
| `d` | `docker` | Docker |
| `di` | `docker images` | イメージ一覧 |
| `dps` | `docker ps` | 実行中コンテナ |
| `dpsa` | `docker ps -a` | 全コンテナ |
| `drm` | `docker rm` | コンテナ削除 |
| `drmi` | `docker rmi` | イメージ削除 |

### Docker Compose

| エイリアス | コマンド | 説明 |
|---|---|---|
| `dc` | `docker-compose` | Docker Compose |
| `dcb` | `docker-compose build` | ビルド |
| `dcd` | `docker-compose down` | 停止・削除 |
| `dce` | `docker-compose exec` | コマンド実行 |
| `dcl` | `docker-compose logs` | ログ表示 |
| `dcr` | `docker-compose run` | 実行 |
| `dcs` | `docker-compose start` | 開始 |
| `dcss` | `docker-compose stop` | 停止 |

### Neovim

| エイリアス | コマンド | 説明 |
|---|---|---|
| `v` | `nvim .` | カレントディレクトリを開く |
| `vi` / `vim` | `nvim` | Neovim起動 |
| `vo` / `vio` | `nvim -O` | 縦分割で開く |
| `va` / `via` | `nvim *` | 全ファイルを開く |

### プログラミング言語

| エイリアス | コマンド | 説明 |
|---|---|---|
| `py` / `py3` | `python` / `python3` | Python |
| `gpp` | `g++ -std=c++17 ...` | C++コンパイル |

### npm

| エイリアス | コマンド | 説明 |
|---|---|---|
| `n` | `npm` | npm |
| `ni` | `npm install` | インストール |
| `nr` | `npm run` | スクリプト実行 |
| `nrd` | `npm run dev` | 開発サーバー起動 |
| `nrb` | `npm run build` | ビルド |

### その他

| エイリアス | コマンド | 説明 |
|---|---|---|
| `_` | `sudo` | 管理者権限 |

---

## fzf.zsh
[設定ファイル](./fzf.zsh)

ファジーファインダー[fzf](https://github.com/junegunn/fzf)の設定とキーバインド。

**デフォルトオプション:**
*   高さ: 40%
*   レイアウト: 逆順（下から上）
*   枠線表示
*   プレビューウィンドウ: 右側60%
*   プレビューのスクロール: `Ctrl+U`（上）/ `Ctrl+D`（下）

**キーバインド:**

| キー | 機能 | 説明 |
|---|---|---|
| `Ctrl+R` | コマンド履歴検索 | 過去のコマンドをファジー検索 |
| `Ctrl+F` | ファイル検索 | ファイルを検索してエディタで開く（batでプレビュー） |
| `Ctrl+G` | ディレクトリ検索 | ディレクトリを検索して移動 |

**機能:**
*   履歴の重複を自動除去
*   batによるファイルプレビュー（カラー表示、行番号付き）
*   インクリメンタル検索

---

## chrome.zsh
[設定ファイル](./chrome.zsh)

Google Chrome関連の設定。

---

## path.zsh
[設定ファイル](./path.zsh)

環境変数PATHの設定。

---

## 初回セットアップ

新しい環境でこの設定を使用する場合：

1. **dotfilesのクローン**
   ```bash
   git clone <your-repo> ~/dotfiles
   ```

2. **シンボリックリンクの作成**
   ```bash
   ln -sf ~/dotfiles/.zshrc ~/.zshrc
   ln -sf ~/dotfiles/.zsh ~/.zsh
   ```

3. **Zshを再起動**
   ```bash
   exec zsh
   ```

初回起動時にzinitとプラグインが自動的にインストールされます。

4. **Powerlevel10k設定ウィザード**

   初回起動時に設定ウィザードが表示されるので、好みのスタイルを選択してください。

---

## トラブルシューティング

### プラグインがインストールされない

```bash
# zinitの再インストール
rm -rf ~/.local/share/zinit
exec zsh
```

### 補完が効かない

```bash
# 補完キャッシュの削除
rm -f ~/.zcompdump*
autoload -Uz compinit && compinit
```

### fzfが見つからない

zinitが自動的にインストールしますが、手動でインストールする場合：

```bash
# Homebrew
brew install fzf

# 手動
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
