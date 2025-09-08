local Config = require("config")

local wezterm = require("wezterm")
local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

resurrect.state_manager.periodic_save({
	interval_seconds = 10 * 60,
	save_workspaces = true,
	save_windows = true,
	save_tabs = true,
})

wezterm.on("resurrect.error", function(err)
	wezterm.log_error("ERROR!")
	wezterm.gui.gui_windows()[1]:toast_notification("resurrect", err, nil, 3000)
end)

wezterm.on("gui-startup", resurrect.state_manager.resurrect_on_gui_startup)

require("utils.backdrops")
	:set_focus("#000000")
	-- :set_images_dir(require('wezterm').home_dir .. '/Pictures/Wallpapers/')
	:set_images()
	:random()

require("events.left-status").setup()
require("events.right-status").setup({ date_format = "%a %H:%M:%S" })
require("events.tab-title").setup({ hide_active_tab_unseen = false, unseen_icon = "circle" })
require("events.new-tab-button").setup()

return Config:init()
	:append(require("config.appearance"))
	:append(require("config.bindings"))
	:append(require("config.domains"))
	:append(require("config.fonts"))
	:append(require("config.general"))
	:append(require("config.launch")).options
