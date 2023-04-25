local wezterm = require("wezterm")
-- local mux = wezterm.mux

local utils = require("core.utils")

wezterm.on("format-window-title", function(tab)
	local pane = tab.active_pane
	local title = utils.basename(pane.current_working_dir)

	local decorated_title = utils.decorate_tite(title, pane)

	return decorated_title
end)

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local title = utils.basename(pane.current_working_dir)
	local decorated_title = utils.decorate_tite(title, pane)

	return decorated_title
end)

-- wezterm.on("gui-startup", function()
-- 	local tab, pane, window = mux.spawn_window({})
--
-- 	window:gui_window():maximize()
-- end)
