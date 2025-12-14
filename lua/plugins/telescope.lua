return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
	keys = {
		{ "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<Leader>fg", "<Cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
		{ "<Leader>fb", "<Cmd>Telescope buffers<CR>",    desc = "Telescope Buffers" },
		{ "<Leader>fh", "<Cmd>Telescope help_tags<CR>",  desc = "Help Tags" }
	}
}
