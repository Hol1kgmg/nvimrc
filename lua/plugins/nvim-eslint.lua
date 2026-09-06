return {
  "esmuellert/nvim-eslint",
  ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
  config = function()
    require("nvim-eslint").setup({})
  end,
}
