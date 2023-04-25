local wezterm = require("wezterm")

local utils = require("core.utils")
local CONSTANTS = require("core.constants")

local config = wezterm.config_builder()

config.color_scheme = "Ayu Mirage"
config.window_background_opacity = 1

config.default_prog = { "C:/Program Files/Git/bin/bash.exe -i -l" }
config.default_cwd = "C:/Users/skrec/code/"

config.font = wezterm.font("Fira Code Retina")
config.font_size = 13

config.keys = {
	{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	{ key = "/", mods = "ALT", action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{ key = "Enter", mods = "ALT", action = "QuickSelect" },
	-- {
	-- 	key = "p",
	-- 	mods = "ALT",
	-- 	action = wezterm.action_callback(function(window)
	-- 		local handle = nil
	-- 		local results = {}
	--
	-- 		handle = io.popen(string.format([[fd -u -i -t=d -d=1 "" %s]], CONSTANTS.PATHS["GS"]), "r")
	-- 		local gs_results = handle:read("*a")
	-- 		print(string.format("AAA: %s", gs_results))
	-- 		wezterm.log_info(gs_results)
	--
	-- 		local personal_results =
	-- 			io.popen(string.format([[fd -u -i -t=d -d=1 "" %s]], CONSTANTS.PATHS["PERSONAL"]), "r")
	--
	-- 		results = utils.concat_table(results, gs_results)
	-- 		results = utils.concat_table(results, personal_results)
	-- 	end),
	-- },
}

return config
