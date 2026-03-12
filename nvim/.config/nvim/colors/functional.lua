-- A functional colorscheme inspired by tonsky's Alabaster principles:
-- 4 meaningful colors, everything else muted.

vim.cmd("highlight clear")
if vim.g.syntax_on then vim.cmd("syntax reset") end
vim.g.colors_name = "functional"
vim.o.background = "dark"

local set = vim.api.nvim_set_hl

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  PALETTE                                                                 ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
local rose        = "#f567a8" -- match paren
local darker_grey = "#262626" -- status line

local black_grey  = "#0f0e0e"
local withe_grey  = "#d4d4d4"
local red_rose    = "#eb6b7d"
local sand_yellow = "#f6ca75"   
local grey        = "#8f8f8f"
local dark_grey   = "#3a3a3a"

local bg        = black_grey
local fg        = withe_grey 
local primary   = red_rose    -- declarations (struct, func, ...)
local secondary = sand_yellow -- string, number
local marker    = grey        -- comments 
local muted     = dark_grey   -- ui, delimiter, operator, ...

local accent    = "#3a3a5c"   -- highlight, search
local todo      = "#03c2fc"

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  EDITOR UI                                                               ║
-- ╚══════════════════════════════════════════════════════════════════════════╝
set(0, "Normal",      { fg = fg, bg = bg })
set(0, "NormalFloat", { fg = fg, bg = darker_grey })
set(0, "MatchParen",  { fg = rose, bold = true })

set(0, "LineNr",      { fg = muted })
set(0, "SignColumn",  { bg = bg })
set(0, "FoldColumn",  { fg = muted, bg = bg })

set(0, "CursorLine",  { bg = todo })
set(0, "CursorLineNr",{ fg = todo })

-- highlight / search
set(0, "Search",      { fg = bg, bg = accent })
set(0, "IncSearch",   { fg = bg, bg = accent })
set(0, "Visual",      { bg = accent })

-- status line
set(0, "StatusLine",  { fg = muted, bg = darker_grey })
set(0, "StatusLineNC",{ fg = muted, bg = darker_grey })

-- popup menu
set(0, "Pmenu",       { fg = fg,     bg = muted })
set(0, "PmenuSel",    { fg = bg,     bg = accent })
set(0, "PmenuSbar",   { bg = muted })
set(0, "PmenuThumb",  { bg = muted })

set(0, "Directory", { fg = fg })

-- Diagnostics
set(0, "DiagnosticInfo",  { fg = muted })
set(0, "DiagnosticWarn",  { fg = todo })
set(0, "DiagnosticError", { fg = todo })
set(0, "DiagnosticHint",  { fg = todo })

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  HIGHLIGHT GROUPS                                                        ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- 1) CONSTANTS – strings, numbers, booleans, ...
set(0, "Constant",  { fg = secondary })  
set(0, "Number",    { fg = secondary })
set(0, "String",    { fg = secondary })
set(0, "Boolean",   { fg = secondary })

-- 2) DECLARATIONS - functions decl, struct, class, ...
set(0, "Function",  { fg = primary })

-- 3) COMMENTS
set(0, "Comment", { fg = marker })

-- 4) MUTED - operaotrs, delimiters, ...
set(0, "Operator",  { fg = muted })
set(0, "Delimiter", { fg = muted })
set(0, "Special",   { fg = muted })

-- 5) EVERYTHING ELSE – fg
set(0, "Type",        { fg = fg }) -- weird
set(0, "Structure",   { fg = fg })
set(0, "Keyword",     { fg = fg })
set(0, "Statement",   { fg = fg })
set(0, "Conditional", { fg = fg })
set(0, "PreProc",     { fg = fg })
set(0, "Macro",       { fg = fg })
set(0, "Identifier",  { fg = fg })   

-- ╔══════════════════════════════════════════════════════════════════════════╗
-- ║  TREE-SITTER OVERRIDES                                                   ║
-- ╚══════════════════════════════════════════════════════════════════════════╝

-- set(0, "@function",       { fg = primary })
-- set(0, "@function.call",  { fg = fg }) -- not supported by eveyr grammar
--
set(0, "@comment.todo", { fg = fg,  bold = true })
set(0, "@type.builtin", { fg = fg })
set(0, "@markup.raw.block.markdown", {fg = fg})

