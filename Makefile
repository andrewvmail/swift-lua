CONTRIB_DIR=contrib

.PHONY: download-lua
download-lua:
	cd $(CONTRIB_DIR) && git clone https://github.com/lua/lua.git
	cd $(CONTRIB_DIR)/lua && git checkout v5.3.4 

clean-contrib:
	rm -rf $(CONTRIB_DIR)/*