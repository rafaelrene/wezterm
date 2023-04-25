-- Pull in the wezterm API
local wezterm = require("wezterm")

local function basename(s)
	local matched_string = string.match(s, "%w+/$")

	if matched_string == "skrec/" then
		return "HOME"
	end

	return matched_string
end

local function decorate_tite(title, active_pane)
	if active_pane.is_zoomed == true then
		title = "[Z] " .. title
	end

	return title
end

wezterm.on("format-window-title", function(tab)
	local pane = tab.active_pane
	local title = basename(pane.current_working_dir)

	local decorated_title = decorate_tite(title, pane)

	return decorated_title
end)

wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local title = basename(pane.current_working_dir)

	local decorated_title = decorate_tite(title, pane)

	return decorated_title
end)

-- wezterm.on("gui-startup", function(cmd)
-- 	local args = {}
-- 	if cmd then
-- 		args = cmd.args
-- 	end
--
-- 	local project_dir = wezterm.home_dir
--
-- 	wezterm.mux.spawn_window({
-- 		workspace = "HOME",
-- 		cwd = project_dir,
-- 		args = args,
-- 	})
--
-- 	local global_repo_dir = "~/code/gs/global-repo/"
-- 	local _, pane, _ = wezterm.mux.spawn_window({
-- 		workspace = "Global Repo",
-- 		cwd = global_repo_dir,
-- 		args = args,
-- 	})
--
-- 	pane:send_text("npm run get:config:dev && npm run fn:dev:firebase:simplified\n")
--
-- 	local editor_pane = pane:split({ direction = "Right", size = 0.5, cwd = global_repo_dir })
--
-- 	editor_pane:send_text("nvim\n")
--
-- 	wezterm.mux.set_active_workspace("HOME")
-- end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Ayu Mirage"
config.window_background_opacity = 1

-- Spawn a fish shell in login mode
config.default_prog = { "C:/Program Files/Git/bin/bash.exe -i -l" }
config.default_cwd = "C:/Users/skrec/code/"

-- Fonts
config.font = wezterm.font("Fira Code Retina")
config.font_size = 13

config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	{ key = "/", mods = "ALT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "Enter", mods = "ALT", action = "QuickSelect" },
}

return config
