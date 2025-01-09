local M = {}

M.handlers = {
	-- this first function is the "default handler"
	-- it applies to every language server without a "custom handler"
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
}

return M
