include("variousfunctions.jl")

function mark_perimetr!(robot)
    start_pos_define(r)
    putmarker!(robot)
    for side in (Nord, Ost, Sud, West)
        along_markers!(r, side)
    end
    goto_start_pos(r)
end