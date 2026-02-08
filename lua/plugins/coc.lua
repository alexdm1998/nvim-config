return {
    'neoclide/coc.nvim',
    branch = 'release',
    event = "VeryLazy",
    keys = {

        -- Code Navigation
        { "gd", "<Plug>(coc-definition)", mode="n", desc = "Go to Definition" },
        { "gy", "<Plug>(coc-type-definition)", mode="n", desc= "Go to Type Definition"},
        { "gi", "<Plug>(coc-implementation)", mode="n", desc= "Implementations"},
        { "gr", "<Plug>(coc-references)", mode="n", desc="References"},

        -- Snippets and Completion
        { "<c-j>", "<Plug>(coc-snippets-expand-jump)", mode="i", desc = "Trigger Snippets"},
        { "<c-space>", "coc#refresh()", mode="i", silent = true, expr=true, desc = "Trigger Completion"},
        { "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? '<TAB>' : coc#refresh()", mode="i", silent = true, noremap = true, expr = true, replace_keycodes = false, desc = "Next completion item"},
        { "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], mode="i", silent = true, noremap = true, expr = true, replace_keycodes = false, desc = "Previous completion item"},
        { "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], mode="i", silent = true, noremap = true, expr = true, replace_keycodes = false, desc = "Accept selected completion"},

        -- Symbol Renaming
        { "<leader>rn", "<Plug>(coc-rename)", mode = "n", silent = true, desc = "Symbol Renaming"},

        -- Formatting Selected Code
        { "<leader>f", "<Plug>(coc-format-selected)", mode = "x", silent = true, desc = "Format Selected Code"},
        { "<leader>f", "<Plug>(coc-format-selected)", mode = "n", silent = true, desc = "Format Selected Code"},
        { "<leader>F", "<Plug>(coc-format)", mode = "n", silent = true, desc = "Format Document"},

        -- Show Documentation
        { "K", function() _G.show_docs() end, mode = "n", silent = true, desc = "Show documentation" },
				{"<leader>ih", "<cmd>CocCommand document.toggleInlayHint<CR>", mode = "n", silent = true, desc = "Toggle Inlay Hints"},

				-- Switch between header and source
				{ "<leader>cs", ":CocCommand clangd.switchSourceHeader<CR>", mode = "n", silent = true}
    },
    config = function()
        -- Define the global function
        _G.show_docs = function()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.fn.eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end

        -- Define check_back_space to fix <TAB> mapping
        _G.check_back_space = function()
            local col = vim.fn.col('.') - 1
            if col == 0 then
                return true
            end
            local line = vim.fn.getline('.')
            return line:sub(col, col):match('%s') ~= nil
        end
    end
}

