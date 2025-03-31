# NeoVim core config

All configuration placed in this directory should only depend on built-in functionality in NeoVim and not use any plugin
packages. The reason behind this is, to ensure that we can completely botch the plugin configuration, rendering it
unloadable and still have some of the convenience features from our general NeoVim configuration. This includes (but is
not limited to):

* Setting default options for (Neo)Vim
* Non-plugin specific keymaps
* Configuring filetypes for files not recognized correctly by default NeoVim config
* Setup LSP configuration options independent of particular plugins
* TBD…
