-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  {
    "akinsho/bufferline.nvim",
    -- Ensure bufferline loads *after* catppuccin so highlights work correctly
    lazy = true,
    after = "catppuccin",
    opts = function()
      local catppuccin_highlights = require("catppuccin.groups.integrations.bufferline").get_theme()

      return {
        highlights = catppuccin_highlights,
        options = {
          -- you can add other bufferline options here
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          middle_mouse_command = nil,
        },
      }
    end,
  },
}
