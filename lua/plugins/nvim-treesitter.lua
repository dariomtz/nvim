local config = function()
    require("nvim-treesitter.configs").setup({
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            "bash",
            "css",
            "dockerfile",
            "go",
            "gomod",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "python",
            "regex",
            "rust",
            "toml",
            "tsx",
            "typescript",
            "yaml",
            "gitignore",
            "json",
            "markdown",
        },
        auto_install = true,
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    config=config,
}
