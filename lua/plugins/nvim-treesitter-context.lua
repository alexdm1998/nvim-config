return {
	"nvim-treesitter/nvim-treesitter-context",
	opts = {
		max_lines = 2,
		trim_scope = 'inner'
	},
	keys = {
		{ "<leader>tc", "<cmd>TSContext toggle<cr>", desc = "Toggle Treesitter Context" },
		{ "cc", function()
			require("treesitter-context").go_to_context(vim.v.count1)
		end,
			{silent = true}, desc = "Go up to the context line"
		}
	}
}
