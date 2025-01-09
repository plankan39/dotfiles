-- LspAttach is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		-- Set keymaps only when lsp is attached
		local keys = require("plugins.lsp.keymaps")
		for _, keymap in ipairs(keys.keys) do
			keymap.buffer = event.buf
			keymap.desc = keymap.desc and "LSP: " .. keymap.desc or keymap.desc
			keys.nmap(keymap)
		end

		-- Create a command `:Format` local to the LSP buffer
		-- vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_)
		--   if vim.lsp.buf.format then
		--     vim.lsp.buf.format()
		--   elseif vim.lsp.buf.formatting then
		--     vim.lsp.buf.formatting()
		--   end
		-- end, { desc = 'Format current buffer with LSP' })
	end,
})
