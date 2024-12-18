return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
				},
			},
		},
		opts = {
			servers = {
				lua_ls = {},
				nixd = {},
				bashls = {},
				pyright = {},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities()
				lspconfig[server].setup(config)
			end
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
