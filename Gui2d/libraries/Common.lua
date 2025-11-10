local Common = {}

function Common.clamp(n,low,high)
    return math.min(math.max(n, low), high)
end

    -- Draw text with vertical alignment inside a rectangle
    -- valign: "top", "middle" (or "center"), "bottom"
    -- halign: "left", "center", "right", "justify" (same as love.graphics.printf)
function Common.advancedPrintf(text,x,y,w,h,halign,valign,font,opts)
    font = font or love.graphics.getFont()
    --clip = clip or false
    opts = opts or {}

    -- 1) Wrap the text to the given width to know how many lines there will be.
    local num,lines = font:getWrap(text, w)      -- first return value is the table of lines
    
    local lineH = font:getHeight() * font:getLineHeight()
    local textH = #lines * lineH

    -- 2) Compute y based on vertical alignment
    local yy = y
    if valign == "middle" or valign == "center" then
        yy = y + (h - textH) / 2
    elseif valign == "bottom" then
        yy = y + (h - textH)
    end

    -- 3) Optionally clip to the rectangle (helpful if text overflows vertically)
    if opts.scissor then
        love.graphics.push("all")
        love.graphics.setScissor(x, y, w, h)
    end

    -- 4) Draw
    love.graphics.printf(
        text,
        x, yy, w, halign or "left",
        opts.r or 0,
        opts.sx or 1, opts.sy or 1,
        opts.ox or 0, opts.oy or 0,
        opts.kx or 0, opts.ky or 0
    )

    if opts.scissor then
        love.graphics.pop()
    end
end


return Common