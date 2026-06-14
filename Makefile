INSTALL_DIR := $(HOME)/bin
SCRIPTS     := $(wildcard git-*)

.PHONY: install uninstall list

install: ## Install all git-* scripts to ~/bin
	@mkdir -p "$(INSTALL_DIR)"
	@for script in $(SCRIPTS); do \
	  cp "$$script" "$(INSTALL_DIR)/$$script"; \
	  chmod +x "$(INSTALL_DIR)/$$script"; \
	  echo "  installed $(INSTALL_DIR)/$$script"; \
	done

uninstall: ## Remove all git-* scripts from ~/bin
	@for script in $(SCRIPTS); do \
	  if [ -f "$(INSTALL_DIR)/$$script" ]; then \
	    rm "$(INSTALL_DIR)/$$script"; \
	    echo "  removed $(INSTALL_DIR)/$$script"; \
	  fi; \
	done

list: ## Show scripts that would be installed
	@for script in $(SCRIPTS); do \
	  echo "  $$script  ->  $(INSTALL_DIR)/$$script"; \
	done
