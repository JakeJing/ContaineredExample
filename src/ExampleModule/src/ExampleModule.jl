module ExampleModule

export compute

function compute(x0)

    while x0 !=1
        if mod(x0,2) == 0
            x0 = x0 ÷ 2
        elseif mod(x0,2) == 1
            x0 = 3*x0+1
        end
        println("$(x0 + 42)")
        sleep(0.1)
    end
end

end # module
