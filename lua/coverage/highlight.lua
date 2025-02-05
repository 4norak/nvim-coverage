local M = {}

local config = require("coverage.config")

local highlight = function(group, color)
	local style = color.style and "cterm=" .. color.style or "cterm=NONE"
	local fg = color.fg and "ctermfg=" .. color.fg or "cterm=NONE"
	local bg = color.bg and "ctermbg=" .. color.bg or "cterm=NONE"
	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg
	vim.cmd(hl)
	if color.link then
		vim.cmd("highlight! link " .. group .. " " .. color.link)
	end
end

local create_highlight_groups = function()
	highlight("CoverageCovered", config.opts.highlights.covered)
	highlight("CoverageUncovered", config.opts.highlights.uncovered)
	highlight("CoverageSummaryBorder", config.opts.highlights.summary_border)
	highlight("CoverageSummaryNormal", config.opts.highlights.summary_normal)
	highlight("CoverageSummaryCursorLine", config.opts.highlights.summary_cursor_line)
	highlight("CoverageSummaryPass", config.opts.highlights.summary_pass)
	highlight("CoverageSummaryFail", config.opts.highlights.summary_fail)
	highlight("CoverageSummaryHeader", config.opts.highlights.summary_header)
end

-- Creates default highlight groups.
M.setup = function()
	create_highlight_groups()
end

return M
