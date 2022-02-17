local options = {
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	completeopt = {"menuone", "noselect"},
	hlsearch = false,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	termguicolors = true,
	undofile = true,
	shiftwidth = 2,
	tabstop = 2,
	signcolumn = "yes",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.cmd [[set iskeyword+=-]]
