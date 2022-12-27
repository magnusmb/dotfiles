require("magnusmb.packer")
require("magnusmb.set")

function remap(mode, keys, command, opts, description)
  if description == nil then
    vim.keymap.set(mode, keys, command, opts)
    return
  end

  local opts_with_mode = {}
  for k, v in pairs(opts) do
    opts_with_mode[k] = v
  end
  opts_with_mode.mode = mode

  local wk = require("which-key")
  wk.register({ [keys] = { command, description } }, opts_with_mode)
end

function map_category(prefix, name)
  local wk = require("which-key")
  wk.register({ [prefix] = { name = name } })
end

require("magnusmb.remaps")

vim.cmd('let $PATH = "/Users/magnus/.nvm/versions/node/v14.21.0/bin:" . $PATH')
