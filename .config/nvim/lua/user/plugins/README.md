# NeoVim plugins

This directory contains the installed plugins and their configuration. We usually configure the plugin inline with it's
Lazy.nvim plugin descriptor, as long as the configuration is more or less self contained and not to heavy on code. For
more complex setups, like with lspconfig, where there are configuration interactions between multiple plugins, the setup
code can be placed in a file in this directory here and be sourced from the Lazy.nvim descriptor via a `config` function
using `require`.
