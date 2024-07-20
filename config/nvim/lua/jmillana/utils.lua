local M = {}

function M.get_icon(name)
	local icons = {
		ActiveLSP = "",
		ActiveTS = "",
		ArrowLeft = "",
		ArrowRight = "",
		BufferClose = "󰅖",
		Buffers = "",
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
		GitHub = "",
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
		GoTo = "",
		LSPLoaded = "",
		LSPLoading1 = "",
		LSPLoading2 = "󰀚",
		LSPLoading3 = "",
		MacroRecording = "",
		Plugins = "",
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
