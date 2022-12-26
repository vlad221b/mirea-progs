inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+1, 4))
left(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)-1, 4))
walk_by(r::Robot,side::HorizonSide) = while isborder(r,Nord)==true move!(r,side) end
next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))
moves!(r,side,num_steps)=for _ in 1:num_steps move!(r,side) end

"""
go!(r::Robot, side::HorizonSide; steps::Int = 1, go_around_barriers::Bool = false, markers = false)::Int
Перемещает робота в направлении. Возвращает 0, если невозможно пройти в данном направлении, отрицательное число (Если робот обходил препятствия, но в нужной клетке был прямоугольник. Тогда это отрицательное число, равное числу шагов, сделанных роботом, возвращающимся в исходную точку),либо положительное число (Количество реально сделанных шагов в данном направлении). 
Именованные параметры: 
steps - количество шагов в направлении;
go_around_barriers - робот будет по пути обходить перегородки, если такие имеются;
markers - робот будет ставить маркеры по пути (не ставит их при обходе перегородок).
"""

function go!(r::Robot, side::HorizonSide; steps::Int = 1, go_around_barriers::Bool = false, markers = false)::Int
    my_ans = 0
    if markers
        putmarker!(r)
    end
    if (go_around_barriers)
        path = around_move_return_path!(r, side; steps, markers)
        my_ans = get_path_length_in_direction(path, side)
    else
        for i ∈ 1:steps

            if (markers)
                putmarker!(r)
            end

            if !isborder(r, side)
                move!(r, side)
                my_ans += 1
            else
                for i ∈ 1:my_ans
                    move!(r, inverse_side(side))
                end
                my_ans = 0
                break
            end
        end
        if (markers)
            putmarker!(r)
        end
    end

    return my_ans
end

"""
around_move_return_path!(r::Robot, side::HorizonSide; steps::Int = 1, markers = false)::Array{Tuple{HorizonSide,Int64},1}
Вспомогательная функция. Возвращает путь после перемещения робота
"""
function around_move_return_path!(r::Robot, side::HorizonSide; steps::Int = 1, markers = false)::Array{Tuple{HorizonSide,Int64},1}
    path = [ (Nord, 0) ] 
    steps_to_do = steps
    
    while steps_to_do > 0

        if markers
            putmarker!(r)
        end

        path_now = go_around_barrier_and_return_path!(r, side)

        for i in path_now
            push!(path, i)
        end

        steps_to_do -= get_path_length_in_direction(path_now, side)

        if !isborder(r, side) && steps_to_do > 0
            push!(path, ( inverse_side(side), 1))
            move!(r, side)
            steps_to_do -= 1

            if markers
                putmarker!(r)
            end