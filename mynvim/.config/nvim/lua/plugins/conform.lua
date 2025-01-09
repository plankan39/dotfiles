return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		default_format_opts = {
			timeout_ms = 3000,
			async = false,
			quiet = false,
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
	keys = function()
		local conform = require("conform")
		return {
			{ "<leader>cf", conform.format, desc = "[f]ormat code" },
		}
	end,
}
