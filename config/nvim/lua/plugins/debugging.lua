return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{ "nvim-neotest/nvim-nio" },
		{ "rcarriga/nvim-dap-ui" },
		{ "mfussenegger/nvim-dap-python" },
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		local dap_python = require("dap-python")

		dapui.setup()
		dap_python.setup("python3")

		dap_python.test_runner = "pytest"

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "[t]oggle breakpoint" })
		vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "[c]ontinue" })
		vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "[u]i toggle" })
		vim.keymap.set("v", "<Leader>e", "<Cmd>lua require('dapui').eval()<CR>", { desc = "eval" })

		-- Python
		table.insert(dap.configurations.python, {
			type = "python",
			request = "launch",
			name = "pytest (current file)",
			module = "pytest",
			args = { "${file}" },
			noDebug = true,
		})
	end,
}
