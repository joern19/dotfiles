return {
  -- Just use pacman..
  { "williamboman/mason.nvim", enabled = false },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local cfg = require("rustaceanvim.config")
      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter("codelldb", "/usr/lib/codelldb/lldb/lib/liblldb.so")
        },
      }
    end,
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      }
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.open()
      end
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
      require("dapui").setup()
    end,
  }

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
