require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  highlight = { enable = true, disable = {}},
  indent = {enable = true, disable = {}},
  ensure_installed = {"lua"},
  autotag = {enable = true},
}
