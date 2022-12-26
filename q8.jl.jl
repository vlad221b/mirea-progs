include("variousfunctions.jl")

function s_markerom(robot)
    num_steps_max = 1
    side = Nord
    while !ismarker(robot)
        for _ in 1:2
            s_markerom(robot, side, num_steps_max)
            side = next(side)
        end
        num_steps_max+=1
    end
end
function s_markerom(robot, side, num_steps_max)
    for _ in 1:num_steps_max
        if ismarker(robot)
            return nothing
        end
        move!(robot, side)
    end
end