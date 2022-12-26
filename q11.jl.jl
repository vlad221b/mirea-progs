include("variousfunctions.jl")

function num_borders!(robot, side)
    state = 0
    global num_borders = 0
    while try_move!(robot, side)
        if state == 0
            if isborder(robot, Nord)
                state = 1
            end
        else
            if !isborder(robot, Nord)
                state = 0
                num_borders += 1
            end
        end
    end
    return num_borders
end

function try_move!(robot, direct)
    if isborder(robot, direct)
        return false
    end
    move!(robot, direct)
    return true
end

function peregorodka_schitat!(robot)
    start_pos_define(r)
    total = 0
    while !isborder(r, Nord)
        num_borders!(robot, Ost)
        while !isborder(r, West)
            move!(r, West)
        end
        move!(r, Nord)
        total += num_borders
    end
    south_west(r)
    goto_start_pos(r)
    return total
end