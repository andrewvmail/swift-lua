CONTRIB_DIR=contrib

.PHONY: download-lua
download-lua:
	cd $(CONTRIB_DIR) && git clone https://github.com/lua/lua.git
	cd $(CONTRIB_DIR)/lua && git checkout v5.3.4 
	cd $(CONTRIB_DIR)/lua && curl -OL https://github.com/holzschu/ios_system/releases/download/v3.0.0/ios_error.h
	cd $(CONTRIB_DIR)/lua && rm -rf all manual testes README.md onelua.c makefile
	cd $(CONTRIB_DIR)/lua && rg ' stdin' -r ' thread_stdin' lauxlib.c lauxlib.c ldblib.c liolib.c loslib.c lua.c luac.c
	cd $(CONTRIB_DIR)/lua && rg ' stdout' -r ' thread_stdout' lauxlib.c lauxlib.c ldblib.c liolib.c loslib.c lua.c luac.c
	cd $(CONTRIB_DIR)/lua && rg ' stderr' -r ' thread_stderr' lauxlib.c lauxlib.c ldblib.c liolib.c loslib.c lua.c luac.c

.PHONY: download-iosystem
download-iosystem:
	cd $(CONTRIB_DIR) && git clone https://github.com/holzschu/ios_system.git
	cd $(CONTRIB_DIR)/ios_system && git checkout v3.0.0
	cd $(CONTRIB_DIR)/ios_system && swift run --package-path xcfs build

.PHONY: download-iosystem
download: download-lua download-iosystem

clean-contrib:
	rm -rf $(CONTRIB_DIR)/*

