INSTALL_DIR    := $(HOME)/bin
COMPLETION_DIR := $(HOME)/etc/bash_completion.d
SCRIPTS        := $(wildcard git-*)
COMPLETIONS    := $(notdir $(wildcard bash_completion.d/*))

.PHONY: install uninstall list install-completion uninstall-completion

install: install-completion ## Install all git-* scripts to ~/bin as symlinks
	@mkdir -p "$(INSTALL_DIR)"
	@for script in $(SCRIPTS); do \
	  ln -sf "$(CURDIR)/$$script" "$(INSTALL_DIR)/$$script"; \
	  echo "  linked $(INSTALL_DIR)/$$script -> $(CURDIR)/$$script"; \
	done

uninstall: uninstall-completion ## Remove all git-* symlinks from ~/bin
	@for script in $(SCRIPTS); do \
	  if [ -L "$(INSTALL_DIR)/$$script" ]; then \
	    rm "$(INSTALL_DIR)/$$script"; \
	    echo "  removed $(INSTALL_DIR)/$$script"; \
	  fi; \
	done

install-completion: ## Install bash completion scripts as symlinks
	@mkdir -p "$(COMPLETION_DIR)"
	@for comp in $(COMPLETIONS); do \
	  ln -sf "$(CURDIR)/bash_completion.d/$$comp" "$(COMPLETION_DIR)/$$comp"; \
	  echo "  linked $(COMPLETION_DIR)/$$comp -> $(CURDIR)/bash_completion.d/$$comp"; \
	done

uninstall-completion: ## Remove bash completion symlinks
	@for comp in $(COMPLETIONS); do \
	  if [ -L "$(COMPLETION_DIR)/$$comp" ]; then \
	    rm "$(COMPLETION_DIR)/$$comp"; \
	    echo "  removed $(COMPLETION_DIR)/$$comp"; \
	  fi; \
	done

list: ## Show scripts that would be installed
	@for script in $(SCRIPTS); do \
	  echo "  $$script  ->  $(INSTALL_DIR)/$$script"; \
	done
	@for comp in $(COMPLETIONS); do \
	  echo "  bash_completion.d/$$comp  ->  $(COMPLETION_DIR)/$$comp"; \
	done
