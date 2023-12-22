-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

t = 0

x = 111
y = 3
w = 17
z = -21

function TIC()
    if btn(0) then y = y - 1 end
    if btn(1) then y = y + 1 end
    if btn(2) then x = x - 1 end
    if btn(3) then x = x + 1 end

    if btn(4) then w = w - 1 end
    if btn(5) then w = w + 1 end
    if btn(6) then z = z - 1 end
    if btn(7) then z = z + 1 end

    cls(10)

    height = z + 50
    idxs = { 6, 5, 4, 3, 2, 1 }

    -- draw trunk
    local tw = 5
    rect(x - tw, y + tw, tw * 2, height + 100, 0)

    -- draw ground
    local SCREEN_X = 240
    local SCREEN_Y = 136
    local gh = 20
    rect(0, 136 - gh, SCREEN_X, gh, 12)


    -- draw triangles of tree
    for _, i in pairs(idxs) do
        y_offset = -20 + i * 15
        width = w + i * 5
        --Try overlapping triangles
        --(light on dark)
        tri(
            x - width, y + y_offset + height,
            x + width, y + y_offset + height,
            x, y + y_offset,
            i
        )
    end

    local SHOW_DEBUG = false
    data = {
        { "x=", x },
        { "y=", y },
        { "w=", w },
        { "z=", z },
    }

    for k, v in pairs(data) do
        if not SHOW_DEBUG then break end
        name = data[k][1]
        value = data[k][2]
        local y_offset = k * 8
        print(name, 0, y_offset)
        print(value, 10, y_offset)
    end


    t = t + 1
end
