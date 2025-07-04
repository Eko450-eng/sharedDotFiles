return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")  -- Require luasnip
        local s = ls.snippet            -- Define snippet
        local t = ls.text_node          -- Define text node
        local i = ls.insert_node        -- Define insert node

        ls.add_snippets("all", {
            s('ddd', t("let db = await getDB()"))
        })

    end,
}
