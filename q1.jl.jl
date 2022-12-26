include("variousfunctions.jl")

function pryamoy_krest!(robot)
    putmarker!(robot)
    for side in (Nord, Sud, Ost, West)
        step = 0
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
            step += 1
        end
        for i = 1:step
            move!(robot, inverse(side))
        end
    end
end