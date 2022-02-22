return {
		cmd = {"typescript-language-server", "--stdio"},
		filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
		root_dir = function() return vim.loop.cwd() end
}
