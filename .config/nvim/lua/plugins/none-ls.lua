return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
--				null_ls.builtins.diagnostics.eslint,

        -- NOTE: these need to manually be installed with :Mason
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,

				-- null_ls.builtins.completion.spell,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
