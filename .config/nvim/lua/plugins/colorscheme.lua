-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- if true then return {} end

-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- Add gruvbox.
  { "ellisonleao/gruvbox.nvim" },

  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      auto_integrations = true,
    },
  },

  -- Configure LazyVim to load default theme.
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "catppuccin-macchiato",
    },
  },
}
