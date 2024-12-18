local M = {}

local p = require('gruber-darker.palette')

local highlight_groups = {
  --Main
  Normal                                              = { fg = p.gruber_darker_fg, bg = p.gruber_darker_bg },
  NormalNC                                            = { link = "Normal" },
  MsgArea                                             = { fg = p.gruber_darker_grey_custom, bg = p.gruber_darker_bg },
  NormalFloat                                         = { link = "Normal" },
  Bold                                                = { bold = false },
  Italic                                              = { italic = false },
  Underlined                                          = { underline = false },
  Visual                                              = { bg = p.gruber_darker_bg_p3, fg = p.gruber_darker_fg },
  Directory                                           = { fg = p.gruber_darker_quartz, bold = true },
  IncSearch                                           = { fg = p.gruber_darker_fg_1, bg = p.gruber_darker_niagara_m1 },
  Search                                              = { link = "IncSearch" },
  Substitute                                          = { link = "IncSearch" },
  MatchParen                                          = { fg = "NONE", bg = p.gruber_darker_bg_p4 },
  ModeMsg                                             = { link = "Normal" },
  MoreMsg                                             = { link = "Normal" },
  WarningMsg                                          = { fg = p.gruber_darker_yellow },
  FloatBorder                                         = { fg = p.gruber_darker_grey_custom, bg = "NONE" },
  NonText                                             = { fg = p.grey, bg = p.gruber_darker_bg },
  LineNr                                              = { bg = p.gruber_darker_bg, fg = p.gruber_darker_grey_custom },
  LineNrAbove                                         = { link = "LineNr" },
  LineNrBelow                                         = { link = "LineNr" },
  CursorLine                                          = { fg = "NONE", bg = "NONE" },
  CursorLineNr                                        = { fg = p.gruber_darker_yellow, bg = p.gruber_darker_bg },
  StatusLine                                          = { fg = p.gruber_darker_quartz, bg = p.gruber_darker_bg_p1 },
  WinSeparator                                        = { fg = p.gruber_darker_grey_custom, bg = "NONE" },
  SignColumn                                          = { bg = p.gruber_darker_bg },
  Colorcolumn                                         = { link = "StatusLine" },
  TabLineFill                                         = { fg = p.gruber_darker_grey_custom, bg = p.gruber_darker_bg },
  TabLine                                             = { fg = p.gruber_darker_grey_custom, bg = p.gruber_darker_bg },
  TabLineSel                                          = { fg = p.gruber_darker_quartz, bg = p.gruber_darker_bg_p1 },
  Pmenu                                               = { fg = p.gruber_darker_fg, bg = p.gruber_darker_bg_p1 },
  PmenuSel                                            = { bg = p.gruber_darker_bg_p3 },
  PmenuThumb                                          = { bg = p.gruber_darker_grey_custom },
  PmenuSbar                                           = { bg = p.gruber_darker_bg_p1 },
  Conceal                                             = { link = "Operator" },
  Title                                               = { link = "Normal" },
  Question                                            = { link = "Normal" },
  WildMenu                                            = { link = "Pmenu" },
  Folded                                              = { fg = p.gruber_darker_grey_custom },
  FoldColumn                                          = { link = "Folded" },
  Error                                               = { fg = p.gruber_darker_red },
  ErrorMsg                                            = { link = "Error" },
  -- Spelling
  SpellBad                                            = { underline = true },
  SpellLocal                                          = { underline = true },
  SpellCap                                            = { underline = true },
  SpellRare                                           = { underline = true },
  -- Syntax
  Boolean                                             = { link = "Normal" },
  Character                                           = { link = "String" },
  Comment                                             = { fg = p.gruber_darker_grey_custom },
  Conditional                                         = { link = "Keyword" },
  Constant                                            = { link = "Normal" },
  Define                                              = { link = "Keyword" },
  Delimiter                                           = { fg = p.gruber_darker_grey_custom },
  Float                                               = { link = "Number" },
  Function                                            = { fg = p.gruber_darker_niagara },
  Identifier                                          = { fg = p.gruber_darker_fg_1 },
  Include                                             = { link = "PreProc" },
  Keyword                                             = { fg = p.gruber_darker_yellow, bold = false },
  Label                                               = { link = "String" },
  Number                                              = { link = "Normal" },
  Operator                                            = { fg = p.gruber_darker_grey_fg },
  PreProc                                             = { fg = p.gruber_darker_quartz },
  Repeat                                              = { link = "Keyword" },
  Special                                             = { link = "Keyword" },
  SpecialChar                                         = { link = "String" },
  SpecialComment                                      = { link = "SpecialChar" },
  SpecialKey                                          = { fg = p.gruber_darker_grey_custom, bg = p.gruber_darker_bg },
  Statement                                           = { link = "Type" },
  StorageClass                                        = { link = "Keyword" },
  String                                              = { fg = p.gruber_darker_green },
  Structure                                           = { link = "Normal" },
  Variable                                            = { fg = p.gruber_darker_fg_1 },
  Tag                                                 = { link = "SpecialChar" },
  Todo                                                = { fg = p.todo_fg, bg = p.todo_bg },
  Type                                                = { fg = p.gruber_darker_yellow },
  Typedef                                             = { link = "Normal" },
  ["luaTable"]                                        = { link = "Normal" },
  ["@text.todo"]                                      = { fg = p.todo_fg, bg = p.todo_bg },
  ["@text.note"]                                      = { fg = p.note_fg, bg = p.note_bg },
  ["@text.warning"]                                   = { fg = p.warning_fg, bg = p.gruber_darker_yellow_custom_m1 },
  ["@text.danger"]                                    = { fg = p.danger_fg, bg = p.gruber_darker_red_custom_m1 },
  ["@text.uri"]                                       = { fg = p.gruber_darker_niagara, underline = true },
  ["@unchecked_list_item"]                            = { link = "normal" },
  ["@checked_list_item"]                              = { fg = p.gruber_darker_grey_custom, strikethrough = true },
  ["@text.todo.unchecked"]                            = { link = "@unchecked_list_item" },
  ["@text.todo.checked"]                              = { link = "@checked_list_item" },
  ["@keyword"]                                        = { link = "Keyword" },
  ["@function"]                                       = { link = "Function" },
  ["@method"]                                         = { link = "Function" },
  ["@field"]                                          = { link = "Identifier" },
  ["@constructor"]                                    = { link = "Function" },
  ["@repeat"]                                         = { link = "Repeat" },
  ["@label"]                                          = { link = "String" },
  ["@variable"]                                       = { link = "Variable" },
  ["@type"]                                           = { link = "Type" },
  ["@type.builtin"]                                   = { link = "Normal" },
  ["@constant"]                                       = { link = "Constant" },
  ["@variable.builtin"]                               = { link = "Type" },
  ["@operator"]                                       = { fg = p.gruber_darker_grey_custom },
  ["@punctuation.special"]                            = { link = "Specialchar" },
  ["@punctuation.bracket"]                            = { link = "Normal" },
  ["@conditional"]                                    = { link = "Conditional" },
  ["@exception"]                                      = { link = "Exception" },
  -- LSP
  ["@lsp.type.interface"]                             = { fg = p.gruber_darker_yellow },
  -- Java
  ["javaStatement"]                                   = { link = "Keyword" },
  ["javaOperator"]                                    = { link = "Keyword" },
  ["@lsp.type.property.java"]                         = { fg = p.gruber_darker_quartz },
  -- ["@lsp.mod.typeArgument.java"]                      = { fg = p.gruber_darker_quartz },
  -- ["@lsp.typemod.class.readonly.java"]                = { fg = p.gruber_darker_quartz },
  -- JavaScript
  ["javaScriptIdentifier"]                            = { link = "Keyword" },
  ["javaScriptFunction"]                              = { link = "Keyword" },
  ["javaScriptEmbed"]                                 = { fg = p.gruber_darker_yellow },
  ["javaScriptBraces"]                                = { link = "Normal" },
  ["@lsp.mod.defaultLibrary.javascript"]              = { link = "Keyword" },
  ["@lsp.type.funciton.javascript"]                   = { link = "Function" },
  ["@lsp.typemod.property.defaultLibrary.javascript"] = { fg = p.gruber_darker_quartz },
  ["@lsp.typemod.member.defaultLibrary.javascript"]   = { fg = p.gruber_darker_niagara },
  -- Markdown
  ["markdownCodeBlock"]                               = { link = "String" },
  -- Diff
  DiffAdd                                             = { fg = "NONE", bg = p.gruber_darker_green_custom_m1 },
  DiffAdded                                           = { fg = p.gruber_darker_green_custom, bg = "NONE" },
  DiffChange                                          = { fg = "NONE", bg = p.gruber_darker_yellow_custom_m1 },
  DiffChanged                                         = { fg = p.gruber_darker_yellow_custom, bg = "NONE" },
  DiffDelete                                          = { fg = "NONE", bg = p.gruber_darker_red_custom_m1 },
  DiffRemoved                                         = { fg = p.gruber_darker_red_custom, bg = "NONE" },
  DiffText                                            = { fg = p.gruber_darker_green_custom, bg = "NONE", bold = false },
  -- Telescope
  TelescopeSelection                                  = { bg = p.gruber_darker_bg_p1 },
  TelescopeSelectionCaret                             = { link = "TelescopeSelection" },
  TelescopeMatching                                   = { fg = p.gruber_darker_white, bold = false },
  --Git
  GitSignsAdd                                         = { fg = p.gruber_darker_green, bg = "NONE" },
  GitSignsChange                                      = { fg = p.gruber_darker_yellow, bg = "NONE" },
  GitSignsDelete                                      = { fg = p.gruber_darker_red, bg = "NONE" },
  --Diagnostic
  DiagnosticSignError                                 = { fg = p.gruber_darker_red_custom, bg = "NONE" },
  DiagnosticSignWarn                                  = { fg = p.gruber_darker_yellow, bg = "NONE" },
  DiagnosticSignHint                                  = { fg = p.gruber_darker_bg_p3, bg = "NONE" },
  DiagnosticSignInfo                                  = { fg = p.todo_fg, bg = "NONE" },
  DiagnosticError                                     = { link = "DiagnosticSignError" },
  DiagnosticWarn                                      = { link = "DiagnosticSignWarn" },
  DiagnosticHint                                      = { link = "DiagnosticSignHint" },
  DiagnosticInfo                                      = { link = "DiagnosticSignInfo" },
  --Scheme icon
  DevIconScheme                                       = { fg = p.gruber_darker_red },
  DevIconJava                                         = { fg = p.gruber_darker_red },
  DevIconJavaScript                                   = { fg = p.gruber_darker_yellow },
  --Oil
  OilDir                                              = { link = "Directory" },
  --Mason
  MasonHeader                                         = { link = "StatusLine" },
  --Illuminate
  IlluminatedWordText                                 = { bg = p.gruber_darker_bg_p1, underline = false },
  IlluminatedWordRead                                 = { bg = p.gruber_darker_bg_p1, underline = false },
  IlluminatedWordWrite                                = { bg = p.gruber_darker_bg_p1, underline = false },
}

function M.setup()
  vim.cmd('hi clear')

  vim.o.background = 'dark'
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'gruber-darker'

  local hi = vim.api.nvim_set_hl

  for name, style in pairs(highlight_groups) do hi(0, name, style) end
end

return M
