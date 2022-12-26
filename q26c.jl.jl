include("variousfunctions.jl")

function fibonacсi(k)
    if k == 0
        return 1, 0
    else
        current, prev = fibonacсi(k-1)
        return current, prev+current
    end
end