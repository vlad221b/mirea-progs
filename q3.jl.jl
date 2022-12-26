include("variousfunctions.jl")

function all_mark!(robot)
    side = Ost
    start_pos_define(robot)
    while !isborder(robot, Nord)
        along_markers!(robot, side)
        move!(robot, Nord)
        along_markers!(robot, inverse(side))
    end
    along_markers!(robot, inverse(side))
    south_west(robot)
    goto_start_pos(robot)
end