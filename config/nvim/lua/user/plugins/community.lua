return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavor = "mocha",
      } 
    end,
  },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  {
    "copilot.lua",
    opts = {
      suggestions = {
        keymap = {
          accept = "<C-Enter>",
          accept_word = false,
          accept_line = false,
          next = "<C-.>",
          prev = "<C-,>",
          dismiss = "C/>",
        },
      },
    },
  },
}
