local M = {}

--- Predicate used as a lazy.nvim `enabled`/`cond` function to disable a
--- plugin spec while running inside the VSCode neovim extension.
--- @return boolean
function M.not_vscode()
	return not vim.g.vscode
end

--- Wrap a deferred `require(modname)[fn]()` call so the target module is
--- only required when the returned function actually runs (e.g. as a
--- keymap callback), instead of eagerly at keymap-registration time.
--- @param modname string
--- @param fn string
--- @return fun()
function M.cb(modname, fn)
	return function()
		require(modname)[fn]()
	end
end

return M
