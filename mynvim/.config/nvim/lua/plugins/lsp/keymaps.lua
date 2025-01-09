local tsb = require("telescope.builtin")
local buf = vim.lsp.buf

local M = {}

M.keys = {
	{ "<leader>cr", buf.rename, desc = "[R]e[n]ame" },
	{ "<leader>ca", buf.code_action, desc = "[C]ode [A]ction" },
	{ "gd", buf.definition, desc = "[G]oto [D]efinition" },
	{ "<leader>gr", tsb.lsp_references, desc = "[G]oto [R]eferences" },

	{ "<leader>cD", buf.type_definition, desc = "Type [D]efinition" },
	{ "<leader>cds", tsb.lsp_document_symbols, desc = "[D]ocument [S]ymbols" },
	{ "<leader>cws", tsb.lsp_dynamic_workspace_symbols, desc = "[W]orkspace [S]ymbols" },

	-- See `:help K` for why this keymap
	{ "K", buf.hover, desc = "Hover Documentation" },
	{ "<C-k>", buf.signature_help, desc = "Signature Documentation" },

	-- Lesser used LSP functionality
	{ "gD", buf.declaration, desc = "[G]oto [D]eclaration" },
	{ "<leader>wa", buf.add_workspace_folder, desc = "[W]orkspace [A]dd Folder" },
	{ "<leader>wr", buf.remove_workspace_folder, desc = "[W]orkspace [R]emove Folder" },
	{
		"<leader>wl",
		function()
			print(vim.inspect(buf.list_workspace_folders()))
		end,
		desc = "[W]orkspace [L]ist Folders}",
	},
}
M.nmap = function(k)
	local m, l, r, opts = (#k == 2 and "n" or k[1]), k[#k - 1], k[#k], {}

	for kk, v in pairs(k) do
		if type(kk) ~= "number" then
			opts[kk] = v
		end
	end

	vim.keymap.set(m, l, r, opts)
end

return M
