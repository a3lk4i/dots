return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Override the CR mapping to do nothing (let it insert newline)
    opts.mapping["<CR>"] = nil

    -- Add C-y to confirm completion
    opts.mapping["<C-y>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })

    return opts
  end,
}
