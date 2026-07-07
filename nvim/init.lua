-- =====================================================
-- Set default visual basis
-- =====================================================
vim.cmd.colorscheme("mono")
-- vim.g.molokai_original = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.mouse = ""

-- vim.opt.colorcolumn = "81"
-- vim.cmd("highlight ColorColumn ctermbg=DarkBlue")
-- Make 81st column stand out
-- vim.fn.matchadd('ColorColumn', '\%81v', 100)

-- =====================================================
-- Cursor shape: block in normal, bar in insert, underline in replace
-- (native Neovim equivalent of the raw t_EI/t_SR/t_SI escape codes)
-- =====================================================
vim.opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,"
  .. "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,"
  .. "sm:block-blinkwait175-blinkoff150-blinkon175"

-- If you'd rather keep the exact original raw-escape approach instead
-- of guicursor, uncomment this block and remove the guicursor line above:
-- vim.cmd([[
--   let &t_EI = "\e[1 q"
--   let &t_SR = "\e[3 q"
--   let &t_SI = "\e[5 q"
-- ]])
-- \e[6 q: Steady bar (line).
-- \e[5 q: Blinking bar.
-- \e[2 q: Steady block.

-- =====================================================
-- MY HANDLING OF TABS
-- =====================================================
vim.opt.expandtab = false   -- Stop converting tabs to spaces
vim.opt.tabstop = 4         -- Set tab width to 4 spaces
vim.opt.shiftwidth = 4      -- Set auto-indent width to 4 spaces
-- vim.cmd("retab!")        -- Force-convert all existing space-indents to real tabs

vim.opt.listchars = { tab = "├─>" }
vim.opt.list = true

-- =====================================================
-- Default opening of splits
-- =====================================================
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Automatically save things sometimes (eg on make)
vim.opt.autowrite = true

-- =====================================================
-- Lightline Config
-- =====================================================
vim.g.lightline = {
  colorscheme = "mono",
}

-- =====================================================
-- Netrw Configs
-- =====================================================
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.opt_local.relativenumber = true
  end,
})
vim.g.netrw_keepdir = 1
vim.g.netrw_browse_split = 0
-- vim.g.netrw_winsize = 25

-- =====================================================
-- Vimtex setup (kept minimal, matching original)
-- =====================================================
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--     vim.opt_local.expandtab = true
--   end,
-- })
-- vim.g.vimtex_enabled = 1
-- vim.cmd("syntax enable")
-- vim.g.vimtex_compiler_enabled = 0
-- vim.g.vimtex_view_enabled = 0
-- vim.g.vimtex_motion_enabled = 0
-- vim.g.vimtex_text_obj_enabled = 0
-- vim.g.vimtex_completion_enabled = 0
-- vim.g.vimtex_indent_enabled = 0
-- vim.g.vimtex_toc_enabled = 0
-- vim.g.vimtex_matchparen_enabled = 0

-- =====================================================
-- Comment Colour Toggle Function
-- Toggle Comment highlight color between normal and green(amber)
-- NOTE: requires g.atlas_colors to be defined by your colorscheme
-- (e.g. an "atlas" colorscheme) with 'muted' and 'amber' keys, each
-- a {guicolor, ctermcolor} pair.
-- =====================================================
vim.g.comment_highlight_toggled = 0

local function toggle_comment_color()
  local fg

  if vim.g.comment_highlight_toggled == 1 then
    -- revert to atlas's own comment color
    fg = vim.g.atlas_colors["muted"]
    vim.g.comment_highlight_toggled = 0
    print("Comment color: muted")
  else
    -- use atlas's amber entry if it has one, else hardcode
    fg = vim.g.atlas_colors["amber"]
    vim.g.comment_highlight_toggled = 1
    print("Comment color: amber")
  end

  vim.cmd(string.format("hi Comment guifg=%s ctermfg=%s", fg[1], fg[2]))
end

vim.keymap.set("n", "<C-s>", toggle_comment_color, { noremap = true, silent = true })
