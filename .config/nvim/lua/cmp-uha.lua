local cmp = require("cmp")

local u = require("utils")

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
        --get_trigger_characters = function(trigger_characters)
        --    return vim.tbl_filter(function(char)
        --        return char ~= " " and char ~= "\t"
        --    end, trigger_characters)
        --end,
    },
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        --["<Tab>"] = function(fallback)
        --    if vim.fn.pumvisible() == 1 then
        --        u.input("<C-n>", "n")
        --    elseif not minsnip.jump() then
        --        fallback()
        --    end
        --end,
        --["<S-Tab>"] = function(fallback)
        --    if vim.fn.pumvisible() == 1 then
        --        u.input("<C-p>", "n")
        --    elseif not minsnip.jump_backwards() then
        --        fallback()
        --    end
        --end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        --{ name = "nvim_lua" },
    },
})
