include("variousfunctions.jl")

function fibonachi(k)
    if k in (1,2)
        return 1
    end
    fibonachi(k-1) + fibonachi(k-2)
end