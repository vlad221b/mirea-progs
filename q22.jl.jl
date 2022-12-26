include("variousfunctions.jl")

function to_simmetric_position(robot, side)
    if isborder(robot, side)
        do_upora!(robot, inverse(side))
    else
        move!(robot,side)
        to_simmetric_position(robot, side)
        move!(robot,side)
    end
end

function do_upora!(robot, side)
    if !isborder(robot, side)
        move!(robot,side)
        do_upora!(robot, side)
    end
end