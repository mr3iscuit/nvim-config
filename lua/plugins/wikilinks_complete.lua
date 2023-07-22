local function get_links()
    local handle = io.popen("grep -rhoP --include='*.md' '\\[\\[(.+?)]]' -r .")
    local output = handle:read("*a")
    handle:close()

    local links = {}
    for link in output:gmatch("%[%[(.-)%]%]") do
        table.insert(links, link)
    end

    return links
end

local function setup_autocompletion()
    local links = get_links()

    vim.g.markdown_links = links

    vim.cmd([[
    augroup markdown_links_autocmds
      autocmd!
      autocmd FileType markdown call luaeval('require("myplugin").setup_autocompletion()')
    augroup END
  ]])
end

setup_autocompletion()

