.PHONY: help install uninstall backup restore clean status install-deps install-superclaude install-aicommit2 install-ollama format check-format

# デフォルトターゲット
.DEFAULT_GOAL := help

# カラー出力
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[0;33m
BLUE := \033[0;34m
NC := \033[0m # No Color

# パス設定
DOTFILES_DIR := $(shell pwd)
BACKUP_DIR := $(DOTFILES_DIR)/backup
HOME_DIR := $(HOME)

# リンク対象のファイル/ディレクトリ
DOTFILES := .zshrc .zsh .commit_template .tmux.conf .claude .editorconfig
CONFIG_DIRS := nvim iterm2

format: ## 全てのファイルをフォーマット
	@echo "$(BLUE)フォーマット中...$(NC)"
	@prettier --write . --log-level warn
	@find . -path './backup' -prune -o \( -type f \( -name "*.sh" -o -name "*.zsh" \) \) -print | grep -v "p10k.zsh" | grep -v "zinit.zsh" | xargs shfmt -w
	@stylua .
	@echo "$(GREEN)✓ フォーマット完了！$(NC)"

check-format: ## ファイルのフォーマットをチェック
	@echo "$(BLUE)フォーマットをチェック中...$(NC)"
	@prettier --check .
	@find . -path './backup' -prune -o \( -type f \( -name "*.sh" -o -name "*.zsh" \) \) -print | grep -v "p10k.zsh" | grep -v "zinit.zsh" | xargs shfmt -d
	@stylua --check .
	@echo "$(GREEN)✓ フォーマットは正常です！$(NC)"

help: ## ヘルプを表示
	@echo "$(BLUE)Dotfiles Management$(NC)"
	@echo ""
	@echo "$(GREEN)使用可能なコマンド:$(NC)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(GREEN)使用例:$(NC)"
	@echo "  make install      # 全てをインストール"
	@echo "  make status       # リンク状態を確認"
	@echo "  make uninstall    # 全てをアンインストール"

install: backup install-links install-git install-tmux install-superclaude install-aicommit2 ## 全てをインストール（バックアップ→リンク作成→Git設定→tmuxプラグインマネージャー→SuperClaude→aicommit2）
	@echo "$(GREEN)✓ インストール完了！$(NC)"
	@echo "$(YELLOW)次のステップ:$(NC)"
	@echo "  1. ターミナルを再起動してください"
	@echo "  2. Powerlevel10k設定ウィザードが表示されます"
	@echo "  3. Neovimを起動してプラグインをインストール: nvim"
	@echo "  4. Claude Codeを再起動してSuperClaudeコマンドを使用: claude"

install-deps: ## 必要な依存パッケージをインストール
	@echo "$(BLUE)必要なパッケージをインストール中...$(NC)"
	@if command -v brew &> /dev/null; then \
		echo "$(YELLOW)Homebrewを使用してインストール...$(NC)"; \
		brew install neovim git fzf bat eza zoxide ripgrep fd prettier shfmt stylua pipx node; \
	elif command -v apt &> /dev/null; then \
		echo "$(YELLOW)aptを使用してインストール (Ubuntu/Debian)...$(NC)"; \
		sudo apt update; \
		sudo apt install -y neovim git fzf bat ripgrep fd-find; \
		echo "$(YELLOW)eza, zoxideはHomebrewまたは手動でインストールしてください$(NC)"; \
	elif command -v pacman &> /dev/null; then \
		echo "$(YELLOW)pacmanを使用してインストール (Arch Linux)...$(NC)"; \
		sudo pacman -S --noconfirm neovim git fzf bat eza zoxide ripgrep fd; \
	elif command -v dnf &> /dev/null; then \
		echo "$(YELLOW)dnfを使用してインストール (Fedora)...$(NC)"; \
		sudo dnf install -y neovim git fzf bat eza zoxide ripgrep fd-find; \
	else \
		echo "$(RED)✗ サポートされているパッケージマネージャーが見つかりません$(NC)"; \
		echo "  手動でパッケージをインストールしてください:"; \
		echo "  - neovim, git, fzf, bat, eza, zoxide, ripgrep, fd"; \
		exit 1; \
	fi
	@echo "$(GREEN)✓ パッケージのインストール完了$(NC)"

backup: ## 既存の設定をバックアップ
	@echo "$(BLUE)既存の設定をバックアップ中...$(NC)"
	@mkdir -p $(BACKUP_DIR)
	@for file in $(DOTFILES); do \
		if [ -e "$(HOME_DIR)/$$file" ] && [ ! -L "$(HOME_DIR)/$$file" ]; then \
			echo "  $(YELLOW)バックアップ:$(NC) $$file"; \
			mv "$(HOME_DIR)/$$file" "$(BACKUP_DIR)/$$file"; \
		fi; \
	done
	@if [ -d "$(HOME_DIR)/.config" ]; then \
		mkdir -p $(BACKUP_DIR)/.config; \
		for dir in $(CONFIG_DIRS); do \
			if [ -e "$(HOME_DIR)/.config/$$dir" ] && [ ! -L "$(HOME_DIR)/.config/$$dir" ]; then \
				echo "  $(YELLOW)バックアップ:$(NC) .config/$$dir"; \
				mv "$(HOME_DIR)/.config/$$dir" "$(BACKUP_DIR)/.config/$$dir"; \
			fi; \
		done; \
	fi
	@echo "$(GREEN)✓ バックアップ完了:$(NC) $(BACKUP_DIR)"

install-links: ## シンボリックリンクを作成
	@echo "$(BLUE)シンボリックリンクを作成中...$(NC)"
	@for file in $(DOTFILES); do \
		if [ -e "$(HOME_DIR)/$$file" ] && [ ! -L "$(HOME_DIR)/$$file" ]; then \
			echo "$(RED)✗ $$file は既に存在します（シンボリックリンクではありません）$(NC)"; \
			echo "  'make backup' を先に実行してください"; \
			exit 1; \
		fi; \
		if [ -L "$(HOME_DIR)/$$file" ]; then \
			echo "  $(YELLOW)スキップ:$(NC) $$file （既にリンク済み）"; \
		else \
			ln -sv "$(DOTFILES_DIR)/$$file" "$(HOME_DIR)/$$file"; \
			echo "  $(GREEN)✓ リンク:$(NC) $$file"; \
		fi; \
	done
	@mkdir -p $(HOME_DIR)/.config
	@for dir in $(CONFIG_DIRS); do \
		if [ -e "$(HOME_DIR)/.config/$$dir" ] && [ ! -L "$(HOME_DIR)/.config/$$dir" ]; then \
			echo "$(RED)✗ .config/$$dir は既に存在します（シンボリックリンクではありません）$(NC)"; \
			echo "  'make backup' を先に実行してください"; \
			exit 1; \
		fi; \
		if [ -L "$(HOME_DIR)/.config/$$dir" ]; then \
			echo "  $(YELLOW)スキップ:$(NC) .config/$$dir （既にリンク済み）"; \
		else \
			ln -sv "$(DOTFILES_DIR)/.config/$$dir" "$(HOME_DIR)/.config/$$dir"; \
			echo "  $(GREEN)✓ リンク:$(NC) .config/$$dir"; \
		fi; \
	done
	@echo "$(GREEN)✓ リンク作成完了$(NC)"

install-git: ## Git設定を適用
	@echo "$(BLUE)Git設定を適用中...$(NC)"
	@# .gitconfigがなければテンプレートからコピー
	@if [ ! -f "$(HOME_DIR)/.gitconfig" ]; then \
		echo "$(YELLOW).gitconfigが存在しません。テンプレートからコピーします...$(NC)"; \
		cp "$(DOTFILES_DIR)/.gitconfig.template" "$(HOME_DIR)/.gitconfig"; \
		echo "  $(GREEN)✓ .gitconfigを作成:$(NC) ~/.gitconfig"; \
	else \
		echo "  $(GREEN)✓ .gitconfig:$(NC) 既に存在します"; \
	fi
	@echo ""
	@git config --global core.editor "nvim"
	@git config --global commit.template "$${HOME}/.commit_template"
	@echo "  $(GREEN)✓ エディタ:$(NC) nvim"
	@echo "  $(GREEN)✓ コミットテンプレート:$(NC) ~/.commit_template"
	@echo ""
	@# ユーザー名の設定確認
	@current_name=$$(git config --global user.name 2>/dev/null || echo ""); \
	if [ -z "$$current_name" ]; then \
		echo "$(YELLOW)Git user.name が設定されていません$(NC)"; \
		printf "$(BLUE)ユーザー名を入力してください:$(NC) "; \
		read user_name; \
		if [ -n "$$user_name" ]; then \
			git config --global user.name "$$user_name"; \
			echo "  $(GREEN)✓ ユーザー名:$(NC) $$user_name"; \
		else \
			echo "  $(YELLOW)スキップ:$(NC) ユーザー名"; \
		fi; \
	else \
		echo "  $(GREEN)✓ ユーザー名:$(NC) $$current_name （既に設定済み）"; \
	fi
	@# メールアドレスの設定確認
	@current_email=$$(git config --global user.email 2>/dev/null || echo ""); \
	if [ -z "$$current_email" ]; then \
		echo "$(YELLOW)Git user.email が設定されていません$(NC)"; \
		printf "$(BLUE)メールアドレスを入力してください:$(NC) "; \
		read user_email; \
		if [ -n "$$user_email" ]; then \
			git config --global user.email "$$user_email"; \
			echo "  $(GREEN)✓ メールアドレス:$(NC) $$user_email"; \
		else \
			echo "  $(YELLOW)スキップ:$(NC) メールアドレス"; \
		fi; \
	else \
		echo "  $(GREEN)✓ メールアドレス:$(NC) $$current_email （既に設定済み）"; \
	fi
	@echo "$(GREEN)✓ Git設定完了$(NC)"

install-tmux: ## tmuxプラグインマネージャー(tpm)をインストール
	@if [ ! -d "$(HOME_DIR)/.tmux/plugins/tpm" ]; then \
		echo "$(BLUE)tmuxプラグインマネージャー(tpm)をインストール中...$(NC)"; \
		git clone https://github.com/tmux-plugins/tpm "$(HOME_DIR)/.tmux/plugins/tpm"; \
	else \
		echo "$(YELLOW)スキップ:$(NC) tpmは既にインストール済みです"; \
	fi
	@echo "$(GREEN)✓ tpmのインストール完了$(NC)"

install-superclaude: ## SuperClaude Frameworkをインストール
	@echo "$(BLUE)SuperClaude Frameworkをインストール中...$(NC)"
	@if ! command -v pipx &> /dev/null; then \
		echo "$(RED)✗ pipxが見つかりません$(NC)"; \
		echo "  'make install-deps' を先に実行してください"; \
		exit 1; \
	fi
	@if ! pipx list | grep -q superclaude; then \
		echo "$(YELLOW)SuperClaudeをインストール中...$(NC)"; \
		pipx install superclaude; \
	else \
		echo "$(YELLOW)スキップ:$(NC) SuperClaudeは既にインストール済みです"; \
	fi
	@if [ -d "$(HOME_DIR)/.local/bin" ]; then \
		export PATH="$(HOME_DIR)/.local/bin:$$PATH"; \
		superclaude install; \
	else \
		echo "$(RED)✗ ~/.local/bin が見つかりません$(NC)"; \
		exit 1; \
	fi
	@echo "$(GREEN)✓ SuperClaudeのインストール完了$(NC)"

install-aicommit2: ## aicommit2 (AI commit message generator) をインストール
	@echo "$(BLUE)aicommit2をインストール中...$(NC)"
	@if ! command -v node &> /dev/null; then \
		echo "$(RED)✗ Node.jsが見つかりません$(NC)"; \
		echo "  'make install-deps' を先に実行してください"; \
		exit 1; \
	fi
	@if ! command -v npx &> /dev/null; then \
		echo "$(RED)✗ npxが見つかりません$(NC)"; \
		exit 1; \
	fi
	@echo "$(YELLOW)aicommit2をグローバルインストール中...$(NC)"
	@npm install -g aicommit2
	@echo "$(GREEN)✓ aicommit2のインストール完了$(NC)"
	@echo "$(YELLOW)使い方:$(NC)"
	@echo "  1. git add で変更をステージング"
	@echo "  2. aicommit2 を実行"
	@echo "  3. 初回実行時に使用するAIプロバイダーを選択"
	@echo ""
	@echo "$(YELLOW)設定変更:$(NC) aicommit2 config set <key> <value>"
	@echo "$(YELLOW)詳細:$(NC) https://github.com/tak-bro/aicommit2"

install-ollama: ## Ollama (ローカルLLM) をインストールして設定
	@echo "$(BLUE)Ollamaをインストール中...$(NC)"
	@if command -v ollama &> /dev/null; then \
		echo "$(YELLOW)スキップ:$(NC) Ollamaは既にインストール済みです"; \
	else \
		brew install ollama; \
	fi
	@echo "$(BLUE)Ollamaサービスを起動中...$(NC)"
	@if ! brew services list | grep -q "ollama.*started"; then \
		brew services start ollama; \
		sleep 3; \
	fi
	@echo "$(BLUE)推奨モデル (qwen2.5-coder:7b) をダウンロード中...$(NC)"
	@echo "$(YELLOW)注意: 約4.7GBのダウンロードが必要です$(NC)"
	@ollama pull qwen2.5-coder:7b
	@if command -v aicommit2 &> /dev/null; then \
		echo "$(BLUE)aicommit2の設定を更新中...$(NC)"; \
		aicommit2 config set OLLAMA.model=qwen2.5-coder:7b; \
		aicommit2 config set OLLAMA.numCtx=4096; \
		aicommit2 config set locale=ja; \
		echo "$(GREEN)✓ aicommit2がOllamaを使用するように設定されました$(NC)"; \
	fi
	@echo "$(GREEN)✓ Ollamaのインストール完了$(NC)"
	@echo "$(YELLOW)使い方:$(NC)"
	@echo "  git add . && aicommit2"

uninstall: ## シンボリックリンクを削除
	@echo "$(BLUE)シンボリックリンクを削除中...$(NC)"
	@for file in $(DOTFILES); do \
		if [ -L "$(HOME_DIR)/$$file" ]; then \
			rm -v "$(HOME_DIR)/$$file"; \
			echo "  $(GREEN)✓ 削除:$(NC) $$file"; \
		fi; \
	done
	@for dir in $(CONFIG_DIRS); do \
		if [ -L "$(HOME_DIR)/.config/$$dir" ]; then \
			rm -v "$(HOME_DIR)/.config/$$dir"; \
			echo "  $(GREEN)✓ 削除:$(NC) .config/$$dir"; \
		fi; \
	done
	@echo "$(GREEN)✓ アンインストール完了$(NC)"

restore: ## バックアップから復元
	@if [ ! -d "$(BACKUP_DIR)" ]; then \
		echo "$(RED)✗ バックアップが見つかりません:$(NC) $(BACKUP_DIR)"; \
		exit 1; \
	fi
	@echo "$(BLUE)バックアップから復元中...$(NC)"
	@for file in $(DOTFILES); do \
		if [ -e "$(BACKUP_DIR)/$$file" ]; then \
			if [ -L "$(HOME_DIR)/$$file" ]; then \
				rm "$(HOME_DIR)/$$file"; \
			fi; \
			mv "$(BACKUP_DIR)/$$file" "$(HOME_DIR)/$$file"; \
			echo "  $(GREEN)✓ 復元:$(NC) $$file"; \
		fi; \
	done
	@if [ -d "$(BACKUP_DIR)/.config" ]; then \
		for dir in $(CONFIG_DIRS); do \
			if [ -e "$(BACKUP_DIR)/.config/$$dir" ]; then \
				if [ -L "$(HOME_DIR)/.config/$$dir" ]; then \
					rm "$(HOME_DIR)/.config/$$dir"; \
				fi; \
				mv "$(BACKUP_DIR)/.config/$$dir" "$(HOME_DIR)/.config/$$dir"; \
				echo "  $(GREEN)✓ 復元:$(NC) .config/$$dir"; \
			fi; \
		done; \
	fi
	@echo "$(GREEN)✓ 復元完了$(NC)"

clean: ## バックアップディレクトリを削除
	@if [ -d "$(BACKUP_DIR)" ]; then \
		echo "$(YELLOW)バックアップディレクトリを削除中...$(NC)"; \
		rm -rf "$(BACKUP_DIR)"; \
		echo "$(GREEN)✓ 削除完了:$(NC) $(BACKUP_DIR)"; \
	else \
		echo "$(YELLOW)バックアップディレクトリは存在しません$(NC)"; \
	fi

status: ## 現在のリンク状態を確認
	@echo "$(BLUE)=== リンク状態 ===$(NC)"
	@echo ""
	@for file in $(DOTFILES); do \
		if [ -L "$(HOME_DIR)/$$file" ]; then \
			target=$$(readlink "$(HOME_DIR)/$$file"); \
			if [ "$$target" = "$(DOTFILES_DIR)/$$file" ]; then \
				echo "$(GREEN)✓$(NC) $$file -> $$target"; \
			else \
				echo "$(YELLOW)!$(NC) $$file -> $$target $(YELLOW)(別のターゲット)$(NC)"; \
			fi; \
		elif [ -e "$(HOME_DIR)/$$file" ]; then \
			echo "$(RED)✗$(NC) $$file $(RED)(リンクではありません)$(NC)"; \
		else \
			echo "$(RED)✗$(NC) $$file $(RED)(存在しません)$(NC)"; \
		fi; \
	done
	@for dir in $(CONFIG_DIRS); do \
		if [ -L "$(HOME_DIR)/.config/$$dir" ]; then \
			target=$$(readlink "$(HOME_DIR)/.config/$$dir"); \
			if [ "$$target" = "$(DOTFILES_DIR)/.config/$$dir" ]; then \
				echo "$(GREEN)✓$(NC) .config/$$dir -> $$target"; \
			else \
				echo "$(YELLOW)!$(NC) .config/$$dir -> $$target $(YELLOW)(別のターゲット)$(NC)"; \
			fi; \
		elif [ -e "$(HOME_DIR)/.config/$$dir" ]; then \
			echo "$(RED)✗$(NC) .config/$$dir $(RED)(リンクではありません)$(NC)"; \
		else \
			echo "$(RED)✗$(NC) .config/$$dir $(RED)(存在しません)$(NC)"; \
		fi; \
	done
	@echo ""
	@echo "$(BLUE)=== Git設定 ===$(NC)"
	@echo "$(GREEN)エディタ:$(NC)           $$(git config --global core.editor || echo '未設定')"
	@echo "$(GREEN)コミットテンプレート:$(NC) $$(git config --global commit.template || echo '未設定')"
	@echo ""
	@if [ -d "$(BACKUP_DIR)" ]; then \
		echo "$(BLUE)=== バックアップ ===$(NC)"; \
		echo "$(GREEN)✓ バックアップあり:$(NC) $(BACKUP_DIR)"; \
	fi
