include("variousfunctions.jl")

function polovina_dist!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        doesnt_do_action!(robot, side)
        move!(robot, inverse(side))
        move!(robot, inverse(side))
        move!(robot, inverse(side))
    end
end

function doesnt_do_action!(robot,side)
    if !isborder(robot, side)
        move!(robot, side)
        polovina_dist!(robot, side)
    end
end