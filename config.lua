vim.wo.number = true
vim.wo.fillchars = 'eob: '
local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.encoding = 'utf-8'
set.wrap = false
set.termguicolors = true
vim.opt.updatetime = 300

require("mason").setup()
require("mason-lspconfig").setup()
require'lspconfig'.clangd.setup{}
require'lspconfig'.bashls.setup{}
local servers = {'clangd','bashls'}

local custom_horizon = require'lualine.themes.horizon'
custom_horizon.normal.a.bg = '#FF0808'
custom_horizon.normal.a.fg = '#212121'
custom_horizon.normal.b.bg = '#FF0808'
custom_horizon.normal.b.fg = '#212121'
custom_horizon.normal.c.bg = '#212121'
custom_horizon.normal.c.fg = '#FF0808'

custom_horizon.insert.a.bg = '#FF0808'
custom_horizon.insert.a.fg = '#2D2D2D'
custom_horizon.insert.b.bg = '#FF0808'
custom_horizon.insert.b.fg = '#2D2D2D'
custom_horizon.insert.c.bg = '#2D2D2D'
custom_horizon.insert.c.fg = '#FF0808'

custom_horizon.visual.a.bg = '#FF0808'
custom_horizon.visual.a.fg = '#3C3C3C'
custom_horizon.visual.b.bg = '#FF0808'
custom_horizon.visual.b.fg = '#3C3C3C'
custom_horizon.visual.c.bg = '#3C3C3C'
custom_horizon.visual.c.fg = '#FF0808'

custom_horizon.replace.a.bg = '#FF0808'
custom_horizon.replace.a.fg = '#2D2D2D'
custom_horizon.replace.b.bg = '#FF0808'
custom_horizon.replace.b.fg = '#2D2D2D'
custom_horizon.replace.c.bg = '#2D2D2D'
custom_horizon.replace.c.fg = '#FF0808'

custom_horizon.command.a.bg = '#FF0808'
custom_horizon.command.a.fg = '#494949'
custom_horizon.command.b.bg = '#FF0808'
custom_horizon.command.b.fg = '#494949'
custom_horizon.command.c.bg = '#494949'
custom_horizon.command.c.fg = '#FF0808'

custom_horizon.inactive.a.bg = '#FF0808'
custom_horizon.inactive.a.fg = '#212121'
custom_horizon.inactive.b.bg = '#FF0808'
custom_horizon.inactive.b.fg = '#212121'
custom_horizon.inactive.c.bg = '#212121'
custom_horizon.inactive.c.fg = '#FF0808'

local function name()
  return [[  Javelin  ]]
end
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_horizon,
    component_separators = { left = '\\', right = '/'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'filesize', name },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', 'zbz', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":cd ~/Documents/ <BAR> :ene <BAR> startinsert <CR>"),
    dashboard.button( "c", "  > New C++ file" , ":luafile ~/.config/nvim/lua/Cpp_preset.lua<CR>"),
    dashboard.button( "f", "  > Find file", ":cd ~ | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

