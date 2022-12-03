module Day3

export run1
path = "./03/input/03.txt"

function createAsciiMap()
    alphabet = UInt8['a':'z';'A':'Z']
    values = UnitRange(1:52)
    return Dict(alphabet .=> values)
end

function run1()
    totalShare = 0
    asciiMap = createAsciiMap()
    open(path, "r") do stream
        while !eof(stream)
            line = readline(stream)
            left, right = first(line, Integer(length(line)/2)), last(line, Integer(length(line)/2))
            for c in left
                if in(c, right)
                    #println("Found match: " * left * " " * right * " - " * c)
                    totalShare += get(asciiMap, UInt8(c), 0)
                    break
                end
            end
        end
    end
    println(totalShare)
end

function run2()
    totalPriorities = 0
    asciiMap = createAsciiMap()
    open(path, "r") do stream
        while !eof(stream)
            triple = [readline(stream), readline(stream), readline(stream)]
            for c in triple[1]
                if in(c, triple[2]) && in(c, triple[3])
                    totalPriorities += get(asciiMap, UInt8(c), 0)
                    break
                end
            end
        end
    end
    println(totalPriorities)
end

end