return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = opts.section.header.val
      table.insert(logo, "                              [ @a3lk4i ]")
      opts.section.header.val = logo
    end,
  },
}
