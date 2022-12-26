include("variousfunctions.jl")

function do_upora_mark!(robot, side)
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        do_upora_mark!(robot, side)
        move!(robot, inverse(side))
    end
end