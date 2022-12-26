include("variousfunctions.jl")

function do_upora!(robot, side)
    if !isborder(robot, side)
        move!(robot,side)
        do_upora!(robot, side)
    end
end