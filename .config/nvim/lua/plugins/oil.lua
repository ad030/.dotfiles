return {
	"stevearc/oil.nvim",

	dependencies = {
		{ "echasnovski/mini.icons", opts = {} },
	},

	--@module "oil"
	--@type oil.SetupOpts

	init = function()
		vim.keymap.set("n", "<leader>oo", function()
			require("oil").open()
		end, { desc = "Open oil browser in parent directory" })
	end,

	opts = {
		default_file_explorer = true,

		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = { "actions.select" },
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = { "actions.preview" },
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = { "actions.refresh" },
			[".."] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = { "actions.open_external" },
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
	},
	lazy = false,
}
