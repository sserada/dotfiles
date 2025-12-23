# tmux Configuration

このドキュメントではtmux設定の詳細を説明します。

**対応OS**: macOS / Linux

## 設定ファイル

[.tmux.conf](./.tmux.conf)

## パフォーマンス最適化

**Vim/Neovimユーザー向け最適化:**

- `escape-time 0`: モード切替の遅延を完全に解消
- `history-limit 50000`: スクロールバック履歴を50,000行に増加（デフォルト2,000行）
- `status-interval 5`: ステータスバー更新頻度を5秒に短縮（デフォルト15秒）
- `aggressive-resize on`: マルチモニター環境での表示最適化

**番号付け改善:**

- `base-index 1`: ウィンドウ番号を1から開始（キーボード左端の1が押しやすい）
- `pane-base-index 1`: ペイン番号も1から開始
- `renumber-windows on`: ウィンドウ削除時に番号を自動で詰める

## Vi copy-mode設定

**Copy modeでのViキーバインド:**

- `mode-keys vi`: Viスタイルのキーバインドを有効化
- `v`: 選択開始
- `y`: 選択範囲をクリップボードにコピー（pbcopy連携）
- `C-v`: 矩形選択モード
- `Enter`: コピーしてCopy modeを終了
- `Escape`: Copy modeに入る

## プレフィックスキー

デフォルトの`C-b`から`C-t`に変更しています。

```
prefix = Ctrl + t
```

以降、`prefix + キー`の形式でキーバインドを表記します。

## 基本操作

### セッション管理

| コマンド             | 説明                         |
| -------------------- | ---------------------------- |
| `tmux`               | 新規セッション作成           |
| `tmux new -s <name>` | 名前付きセッション作成       |
| `tmux ls`            | セッション一覧表示           |
| `tmux a`             | 最後のセッションに再接続     |
| `tmux a -t <name>`   | 指定したセッションに再接続   |
| `tmux kill-session`  | 現在のセッションを終了       |
| `prefix + d`         | セッションからデタッチ       |
| `prefix + F`         | fzfでセッション選択（カスタム） |
| `prefix + T`         | セッションウィザード（zoxide統合） |

### ウィンドウ操作

| キー          | 機能                     |
| ------------- | ------------------------ |
| `prefix + c`  | 新しいウィンドウを作成   |
| `prefix + ,`  | ウィンドウ名を変更       |
| `prefix + &`  | ウィンドウを閉じる       |
| `prefix + n`  | 次のウィンドウに移動     |
| `prefix + p`  | 前のウィンドウに移動     |
| `prefix + 1-9`| ウィンドウ番号で移動     |
| `prefix + Tab`| 最後のウィンドウに移動   |
| `prefix + W`  | fzfでウィンドウ選択（カスタム） |

**注意**: 新規ウィンドウ作成時に現在のディレクトリパスを引き継ぎます。

### ペイン操作

#### 分割

| キー         | 機能                 |
| ------------ | -------------------- |
| `prefix + v` | 左右に分割（縦線）   |
| `prefix + s` | 上下に分割（横線）   |

**注意**: 分割時に現在のディレクトリパスを引き継ぎます。

#### 移動

| キー              | 機能             |
| ----------------- | ---------------- |
| `prefix + C-h`    | 左のペインに移動 |
| `prefix + C-j`    | 下のペインに移動 |
| `prefix + C-k`    | 上のペインに移動 |
| `prefix + C-l`    | 右のペインに移動 |
| `prefix + P`      | fzfでペイン選択  |

#### リサイズ

| キー         | 機能           |
| ------------ | -------------- |
| `prefix + H` | 左に5列拡張    |
| `prefix + J` | 下に5行拡張    |
| `prefix + K` | 上に5行拡張    |
| `prefix + L` | 右に5列拡張    |
| `prefix + m` | ペイン最大化トグル |

#### その他

| キー         | 機能               |
| ------------ | ------------------ |
| `prefix + x` | ペインを閉じる     |
| `prefix + z` | ペインのズームトグル |
| `prefix + !` | ペインをウィンドウ化 |

## プラグイン機能

### tmux-sensible

常識的なデフォルト設定を自動適用：

- メッセージ表示時間の延長
- フォーカスイベントの有効化
- その他の最適化設定

### tmux-resurrect / tmux-continuum

**セッションの保存と復元:**

| キー           | 機能                   |
| -------------- | ---------------------- |
| `prefix + C-s` | セッションを手動保存   |
| `prefix + C-r` | セッションを手動復元   |

tmux-continuumにより15分ごとに自動保存されます。

### tmux-yank

**クリップボード連携:**

Copy modeで選択したテキストが自動的にOSのクリップボードにコピーされます（pbcopy/xclip）。

### tmux-open

**URLやファイルパスを開く:**

Copy modeで選択した後：

- `o`: デフォルトアプリケーションで開く
- `Ctrl-o`: エディタで開く

### tmux-fzf

**統合fzf管理UI:**

| キー             | 機能                                     |
| ---------------- | ---------------------------------------- |
| `prefix + C-f`   | fzf統合UIを起動                          |

以下を一元管理：

- セッション/ウィンドウ/ペイン
- コマンド履歴
- キーバインド一覧
- クリップボード履歴
- プロセス一覧

**特徴:**

- プレビュー表示対応
- 複数選択可能（Tab/Shift-Tab）
- インクリメンタル検索

### tmux-thumbs

**高速テキスト選択:**

| キー           | 機能                               |
| -------------- | ---------------------------------- |
| `prefix + Space` | テキストヒント表示モードを起動   |

画面上のテキスト（URL、ファイルパス、Git SHA、IPアドレスなど）にヒント文字を表示。
ヒント文字を入力してジャンプ&コピー。

**用途:**

- ログファイルからエラーメッセージをコピー
- URLを素早く開く
- ファイルパスを選択

**設定:**

- `@thumbs-alphabet`: `colemak-homerow` または `qwerty-homerow`
- QWERTYキーボードの場合は設定を変更してください

### tmux-session-wizard

**zoxide統合セッション管理:**

| キー         | 機能                                     |
| ------------ | ---------------------------------------- |
| `prefix + T` | セッションウィザード起動                 |

zoxideが記録している最近アクセスしたディレクトリから選択してセッション作成・切替。

**ワークフロー:**

1. `prefix + T` を押す
2. よく使うディレクトリがfzfで表示される
3. 選択してEnter
4. 既存セッションがあれば切替、なければ新規作成

### extrakto

**ターミナル出力からテキスト抽出:**

| キー         | 機能                               |
| ------------ | ---------------------------------- |
| `prefix + Tab` | テキスト抽出モード起動           |

スクロールバック履歴全体から任意のテキストをfuzzy検索で抽出。

**用途:**

- 長いビルドログからエラーメッセージを抽出
- コマンド出力から特定の値をコピー
- URL、ファイルパス、単語、行などをフィルタリング

### tmux-prefix-highlight

**プレフィックス入力状態の視覚化:**

ステータスバーにプレフィックス入力状態を表示：

- プレフィックス入力中: "Wait"
- Copy mode中: "Copy"（黄色背景）

### tmux-battery

**バッテリー残量表示（ノートPC向け）:**

ステータスバーにバッテリー情報を表示：

- 🔋: 充電完了/放電中
- ⚡: 充電中
- パーセンテージ表示

### tmux-cpu

**CPU使用率表示:**

ステータスバーに現在のCPU使用率をパーセンテージで表示。

### tmux-gruvbox

**Gruvboxテーマ:**

Neovimと統一したGruvboxカラースキームを適用。

## その他の設定

### マウスモード

マウス操作が有効化されています：

- マウスクリックでペイン選択
- マウスドラッグでペインリサイズ
- マウスホイールでスクロール

### カラー設定

256色表示とTrue Colorに対応：

```tmux
set-option -g default-terminal "screen-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
```

### その他の便利な設定

- `focus-events on`: Vim/Neovimとの連携強化
- `display-time 4000`: メッセージ表示時間を4秒に延長

## 設定のリロード

設定ファイルを編集した後：

| キー         | 機能                 |
| ------------ | -------------------- |
| `prefix + r` | 設定ファイルをリロード |

または、tmuxセッション外から：

```bash
tmux source-file ~/.tmux.conf
```

## キーバインド一覧（カテゴリ別）

### セッション

| キー         | 機能                           |
| ------------ | ------------------------------ |
| `prefix + d` | セッションからデタッチ         |
| `prefix + F` | fzfでセッション選択            |
| `prefix + T` | セッションウィザード（zoxide） |

### ウィンドウ

| キー          | 機能                       |
| ------------- | -------------------------- |
| `prefix + c`  | 新規ウィンドウ作成         |
| `prefix + ,`  | ウィンドウ名変更           |
| `prefix + &`  | ウィンドウを閉じる         |
| `prefix + n`  | 次のウィンドウ             |
| `prefix + p`  | 前のウィンドウ             |
| `prefix + 1-9`| ウィンドウ番号で移動       |
| `prefix + Tab`| 最後のウィンドウ           |
| `prefix + W`  | fzfでウィンドウ選択        |

### ペイン

| キー           | 機能                 |
| -------------- | -------------------- |
| `prefix + v`   | 左右分割             |
| `prefix + s`   | 上下分割             |
| `prefix + C-h` | 左のペイン           |
| `prefix + C-j` | 下のペイン           |
| `prefix + C-k` | 上のペイン           |
| `prefix + C-l` | 右のペイン           |
| `prefix + H`   | 左にリサイズ         |
| `prefix + J`   | 下にリサイズ         |
| `prefix + K`   | 上にリサイズ         |
| `prefix + L`   | 右にリサイズ         |
| `prefix + m`   | ペイン最大化トグル   |
| `prefix + x`   | ペインを閉じる       |
| `prefix + z`   | ペインズームトグル   |
| `prefix + !`   | ペインをウィンドウ化 |
| `prefix + P`   | fzfでペイン選択      |

### Copy mode

| キー              | 機能                       |
| ----------------- | -------------------------- |
| `Escape`          | Copy modeに入る            |
| `v` (Copy mode)   | 選択開始                   |
| `y` (Copy mode)   | コピーしてモード終了       |
| `C-v` (Copy mode) | 矩形選択                   |
| `Enter` (Copy mode)| コピーしてモード終了      |

### プラグイン機能

| キー             | 機能                         |
| ---------------- | ---------------------------- |
| `prefix + C-f`   | tmux-fzf統合UI               |
| `prefix + Space` | tmux-thumbsテキスト選択      |
| `prefix + Tab`   | extraktoテキスト抽出         |
| `prefix + C-s`   | セッション保存（resurrect）  |
| `prefix + C-r`   | セッション復元（resurrect）  |
| `prefix + I`     | プラグインインストール（tpm）|
| `prefix + U`     | プラグイン更新（tpm）        |

### その他

| キー         | 機能                   |
| ------------ | ---------------------- |
| `prefix + r` | 設定リロード           |
| `prefix + ?` | キーバインド一覧表示   |
| `prefix + :` | コマンドプロンプト     |

## プラグインのインストール

### 初回セットアップ

1. **dotfilesのインストール:**

   ```bash
   cd ~/dotfiles
   make install
   ```

   これにより、tpmが自動的にインストールされます。

2. **tmuxを起動:**

   ```bash
   tmux
   ```

3. **プラグインをインストール:**

   tmuxセッション内で：

   ```
   prefix + I  # 大文字のI（Shift + i）
   ```

   全てのプラグインが自動的にインストールされます。

### プラグインの更新

tmuxセッション内で：

```
prefix + U  # 大文字のU（Shift + u）
```

### プラグインの削除

1. `.tmux.conf`から該当するプラグインの行を削除
2. tmuxセッション内で：

   ```
   prefix + r  # 設定リロード
   prefix + alt + u  # 未使用プラグインのアンインストール
   ```

## カスタマイズ

### キーバインドの変更

`.tmux.conf`を編集してキーバインドを変更できます：

```bash
nvim ~/dotfiles/.tmux.conf
```

変更後は`prefix + r`でリロード。

### プラグインの追加

1. `.tmux.conf`のプラグインリストに追加：

   ```tmux
   set -g @plugin 'ユーザー名/プラグイン名'
   ```

2. プラグインをインストール：

   ```
   prefix + I
   ```

### ステータスバーのカスタマイズ

`.tmux.conf`の最後のセクションでステータスバーをカスタマイズ：

```tmux
set -g status-right '#{prefix_highlight} | #{battery_icon} #{battery_percentage} | #{cpu_percentage} | %H:%M %Y/%m/%d'
```

## トラブルシューティング

### プラグインがインストールされない

```bash
# tpmを再インストール
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# tmuxを再起動
tmux kill-server
tmux

# プラグインをインストール
prefix + I
```

### カラーが正しく表示されない

`.zshrc`または`.bashrc`に以下を追加：

```bash
export TERM=xterm-256color
```

tmuxを再起動。

### Copy modeでクリップボードにコピーできない

**macOS:**

pbcopyが正しく動作しているか確認：

```bash
echo "test" | pbcopy
pbpaste
```

**Linux:**

xclipをインストール：

```bash
# Ubuntu/Debian
sudo apt install xclip

# Arch Linux
sudo pacman -S xclip

# Fedora
sudo dnf install xclip
```

`.tmux.conf`の該当箇所を変更：

```tmux
set -g @extrakto_clip_tool "xclip -selection clipboard"
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
```

### tmux-thumbsが動作しない

tmux-thumbsはRustで実装されています。インストール時に自動的にビルドされますが、失敗する場合：

```bash
# Rustをインストール
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# プラグインを再インストール
rm -rf ~/.tmux/plugins/tmux-thumbs
prefix + I
```

### zoxideが見つからない（session-wizard）

```bash
# Homebrew
brew install zoxide

# または手動インストール
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
```

`.zshrc`にzoxideを初期化するコードを追加：

```bash
eval "$(zoxide init zsh)"
```

## 参考リンク

- [tmux公式](https://github.com/tmux/tmux)
- [tpm（tmux Plugin Manager）](https://github.com/tmux-plugins/tpm)
- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)
- [tmux-fzf](https://github.com/sainnhe/tmux-fzf)
- [tmux-thumbs](https://github.com/fcsonline/tmux-thumbs)
- [tmux-session-wizard](https://github.com/27medkamal/tmux-session-wizard)
- [extrakto](https://github.com/laktak/extrakto)
