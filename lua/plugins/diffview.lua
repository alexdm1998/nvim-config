return {
    "sindrets/diffview.nvim",
    config = function ()
       require("diffview").setup({
           diff_binaries = false,
           enhanced_diff_hl = false,
           git_cmd = {"git"}
       })
    end
}
