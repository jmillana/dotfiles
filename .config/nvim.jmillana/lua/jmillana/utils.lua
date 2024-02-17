local M = {}

function M.get_icon(name)
	local icons = {
		ActiveLSP = "",
		ActiveTS = "",
		ArrowLeft = "",
		ArrowRight = "",
		BufferClose = "󰅖",
		DapBreakpoint = "",
		DapBreakpointCondition = "",
		DapBreakpointRejected = "",
		DapLogPoint = ".>",
		DapStopped = "󰁕",
		DefaultFile = "󰈙",
		Diagnostic = "󰒡",
		DiagnosticError = "",
		DiagnosticHint = "󰌵",
		DiagnosticInfo = "󰋼",
		DiagnosticWarn = "",
		Ellipsis = "…",
		FileModified = "",
		FileReadOnly = "",
		FoldClosed = "",
		FoldOpened = "",
		FoldSeparator = " ",
		FolderClosed = "",
		FolderEmpty = "",
		FolderOpen = "",
		Git = "󰊢",
		GitAdd = "",
		GitBranch = "",
		GitChange = "",
		GitConflict = "",
		GitDelete = "",
		GitIgnored = "◌",
		GitRenamed = "➜",
		GitStaged = "✓",
		GitUnstaged = "✗",
		GitUntracked = "★",
		LSPLoaded = "",
		LSPLoading1 = "",
		LSPLoading2 = "󰀚",
		LSPLoading3 = "",
		MacroRecording = "",
		Paste = "󰅌",
		Search = "",
		Selected = "❯",
		Spellcheck = "󰓆",
		TabClose = "󰅙",
	}
	local icon = icons[name]
	if icon == nil then
		return ""
	end
	return icons[name] .. " "
end

return M
