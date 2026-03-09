--[[
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		vim.cmd.colorscheme("catppuccin")
	end
}
--]]



--[[
return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			terminalcolors = true,
		},
		config = function()
			vim.cmd.colorscheme('gruvbox')
		end
	}
}
--]]


-- return {
--   "loctvl842/monokai-pro.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("monokai-pro").setup()
--     vim.cmd.colorscheme("monokai-pro")
--   end,
-- }




-- Good for c++, especially with the inlayHints enabled
return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').load()

        vim.api.nvim_set_hl(0, "TreesitterContext", {
            bg = "#3A3F4A"
        })

        vim.api.nvim_set_hl(0, "TreesitterContextBottom", {
            underline = true,
            sp = "#5E81AC"
        })

        vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", {
            bg = "#2E3440"
        })


        vim.api.nvim_set_hl(0, "IblIndent", {
            fg = "#3b4252"
        })

        vim.api.nvim_set_hl(0, "IblScope", {
            fg = "#00566a"
        })
    end
}
