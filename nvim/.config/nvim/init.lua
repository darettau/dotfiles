vim.opt.termguicolors = true


pcall(vim.cmd, 'colorscheme default')


vim.api.nvim_set_hl(0, "Normal", { bg = "#000000", fg = "#eeeeee" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#5294e2", fg = "#000000" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000", fg = "#555555" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000", fg = "#5294e2" })
