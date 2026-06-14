INSTALL_DIR := $(HOME)/bin
SCRIPTS     := $(wildcard git-*)

.PHONY: install uninstall list

install: ## Install all git-* scripts to ~/bin as symlinks
	@mkdir -p "$(INSTALL_DIR)"
	@for script in $(SCRIPTS); do \
	  ln -sf "$(CURDIR)/$$script" "$(INSTALL_DIR)/$$script"; \
	  echo "  linked $(INSTALL_DIR)/$$script -> $(CURDIR)/$$script"; \
	done

uninstall: ## Remove all git-* symlinks from ~/bin
	@for script in $(SCRIPTS); do \
	  if [ -L "$(INSTALL_DIR)/$$script" ]; then \
	    rm "$(INSTALL_DIR)/$$script"; \
	    echo "  removed $(INSTALL_DIR)/$$script"; \
	  fi; \
	done

list: ## Show scripts that would be installed
	@for script in $(SCRIPTS); do \
	  echo "  $$script  ->  $(INSTALL_DIR)/$$script"; \
	done
