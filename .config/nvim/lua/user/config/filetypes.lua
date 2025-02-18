-- [[ Additional filetypes configuration ]]

-- Helper for quickly mapping a extension to a known file type
local ext2ft = function(ext, ft) vim.filetype.add({ extension = { [ext] = ft } }) end

ext2ft('fcc', 'yaml') -- Fedora CoreOS Butane configuration files
