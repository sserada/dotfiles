.PHONY: help install uninstall backup restore clean status install-deps

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
DOTFILES := .zshrc .zsh .commit_template tmux.conf
CONFIG_DIRS := nvim

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

install: backup install-links install-git install-tmux ## 全てをインストール（バックアップ→リンク作成→Git設定→tmuxプラグインマネージャー）
	@echo "$(GREEN)✓ インストール完了！$(NC)"
	@echo "$(YELLOW)次のステップ:$(NC)"
	@echo "  1. ターミナルを再起動してください"
	@echo "  2. Powerlevel10k設定ウィザードが表示されます"
	@echo "  3. Neovimを起動してプラグインをインストール: nvim"

install-deps: ## 必要な依存パッケージをインストール
	@echo "$(BLUE)必要なパッケージをインストール中...$(NC)"
	@if command -v brew &> /dev/null; then \
		echo "$(YELLOW)Homebrewを使用してインストール...$(NC)"; \
		brew install neovim git fzf bat eza zoxide ripgrep fd; \
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
