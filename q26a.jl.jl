include("variousfunctions.jl")

function fibonachi(k)
    if k == 1 && k == 2
        return 1
    else
        num1 = num2 = 1
        while (k-2) > 0
            num1, num2 = num2, num1 + num2
            k-=1
        end
        return num2
    end
end