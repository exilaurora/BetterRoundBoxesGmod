if SERVER then return end

betterRB = betterRB or {}

local cache = {}

local function BoolToNum(b)
    return b and 1 or 0
end

function betterRB.GetRoundedBoxMaterial(round, w, h, tl, tr, bl, br)
    w, h = math.floor(w), math.floor(h)
    local shortName = string.format("b%u_%u_%u_%d%d%d%d", round, w, h, BoolToNum(tl), BoolToNum(tr), BoolToNum(bl), BoolToNum(br))
    if cache[shortName] and IsValid(cache[shortName]) then
        return cache[shortName]
    end

    local rT = GetRenderTarget(shortName, w, h)
    render.PushRenderTarget(rT)
    cam.Start2D()
        render.Clear(0, 0, 0, 0)
        draw.RoundedBoxEx(round, 0, 0, w, h, color_white, tl, tr, bl, br)

        local mat = CreateMaterial(shortName, "UnlitGeneric", {
            ["$basetexture"] = rT:GetName(),
            ["$translucent"] = 1,
            ["$vertexcolor"] = 1,
            ["$vertexalpha"] = 1
        })
    cam.End2D()
    render.PopRenderTarget()

    cache[shortName] = mat
    return mat
end

function betterRB.DrawRoundedBoxEx(round, x, y, w, h, color, tl, tr, bl, br)
    surface.SetDrawColor(color.r, color.g, color.b, color.a)
    surface.SetMaterial(betterRB.GetRoundedBoxMaterial(round, w, h, tl, tr, bl, br))
    surface.DrawTexturedRect(x, y, w, h)
end

function betterRB.DrawRoundedBox(round, x, y, w, h, color)
    surface.SetDrawColor(color.r, color.g, color.b, color.a)
    surface.SetMaterial(betterRB.GetRoundedBoxMaterial(round, w, h, true, true, true, true))
    surface.DrawTexturedRect(x, y, w, h)
end