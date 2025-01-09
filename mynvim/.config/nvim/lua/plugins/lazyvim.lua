return {
	"LazyVim/LazyVim",
	config = function()
		-- Expose "LazyVim" global so that we can use utils
		local lazyvimpath = vim.fn.stdpath("data") .. "/lazy/LazyVim"
		vim.opt.rtp:prepend(lazyvimpath)
		_G.LazyVim = require("lazyvim.util")
	end,
}
