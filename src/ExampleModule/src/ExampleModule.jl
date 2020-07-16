module ExampleModule

using Distances

export compute

function compute(x0)

    offset = 42
    while x0 !=1
        if mod(x0,2) == 0
            x0 = x0 ÷ 2
        elseif mod(x0,2) == 1
            x0 = 3*x0+1
        end
        println("$(x0 + offset)")
        sleep(0.1)
    end
    result = x0 + offset
    return result
end

end # module
