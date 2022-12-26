include("variousfunctions.jl")

function step!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    else
        move!(robot, left(side))
        step!(robot, side)
        move!(robot, right(side))
    end
end