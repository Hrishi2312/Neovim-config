local M = {}

M.setup = function()
	local signs = {
		{name = "DiagnosticSignError", text = "E"},
		{name = "DiagnosticSignWarn", text = "W"},
		{name = "DiagnosticSignHint", text = "H"},
		{name = "DiagnosticSignInfo", text = "I"},
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
	end
	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_highlight_document
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local opts = {noremap = true, silent = true}
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vp", '<cmd>lua vim.diagnostic.goto_prev({border = "rounded"})<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vl", '<cmd>lua vim.diagnostic.open_float({border = "rounded"})<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>vn", '<cmd>lua vim.diagnostic.goto_next({border = "rounded"})<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>va", '<cmd>lua vim.lsp.buf.code_action({border = "rounded"})<CR>', opts)
	vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
