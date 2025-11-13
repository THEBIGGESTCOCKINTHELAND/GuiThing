local config = {
    DEBUG = {
        DRAW_ACTIVE_BOXES = false,
        DRAW_GUI = true,
        DEBUG_MESSAGES = true,
        ALLOWED_MESSAGES = {
            FontMessages = true,
            SignalMessages = false,
            ChildMessages = true,
            PropertyMessages = true,
            ImageMessages = true,
        },
        ACTIVE_BOXES_COLORS = {
            ["Inactive"] = {0,0,1,0.7},
            ["Active"] = {0,1,0,0.7},
            ["Top"] = {1,0,0,0.7}
        }
    },
    FONT_FOLDER = "Gui2d/assets/fonts",
    CACHE_IMAGES = true,
}

return config