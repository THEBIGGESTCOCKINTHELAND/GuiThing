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

function Common.tableSearch(table,fvalue)
    for index,value in pairs(table) do
        if value==fvalue then
            return index
        end
    end
    return nil
end

function Common.drawRoundedMask(x,y,w,h,r)
    love.graphics.rectangle("fill",x,y,w,h,r,r)
end

function Common.hsvToRgb(h, s, v)
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    local mod = i % 6
    if mod == 0 then return v, t, p
    elseif mod == 1 then return q, v, p
    elseif mod == 2 then return p, v, t
    elseif mod == 3 then return p, q, v
    elseif mod == 4 then return t, p, v
    else return v, p, q end
end

-- 🎨 t ∈ [0, 1] → RGB color through the rainbow
function Common.rainbowColor(t)
    local r, g, b = Common.hsvToRgb(t % 1, 1, 1)
    return r, g, b
end


return Common