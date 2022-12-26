include("variousfunctions.jl")

function pod_prohodom(robot)
    n = 0; 
    side = Ost
    while isborder(robot, Nord)
        n += 1
        moves!(robot, side, n)
        side = inverse(side)
    end
end