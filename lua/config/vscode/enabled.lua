local function never()
    if vim.g.vscode then
        return false
    else
        return true
    end
end

return {
    never = never,
}
