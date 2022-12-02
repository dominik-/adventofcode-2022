module Day2

export run
path = "./02/input/02.txt"

struct RockPaperScissors
    one::String
    two::String
    score::Int
end

hierarchy = Dict("X" => 1, "Y" => 2, "Z" => 3)
hierarchy2 = Dict("A" => 1, "B" => 2, "C" => 3)
scores = Dict("A X" => 3, "A Y" => 6, "A Z" => 0,
                "B X" => 0, "B Y" => 3, "B Z" => 6,
                "C X" => 6, "C Y" => 0, "C Z" => 3)
win = Dict("A" => "B", "B" => "C", "C" => "A")
lose = Dict("A" => "C", "B" => "A", "C" => "B")

function RockPaperScissors(game, part2)
    pair = split(game)
    score = 0
    if part2
        if pair[2] == "X"
            score = get(hierarchy2, get(lose, pair[1], 0),0)
        end
        if pair[2] == "Y"
            score = get(hierarchy2, pair[1], 0) + 3
        end
        if pair[2] == "Z"
            score = get(hierarchy2, get(win, pair[1], 0),0) + 6
        end
        RockPaperScissors(pair[1], pair[2], score)
    else 
        RockPaperScissors(pair[1], pair[2], get(hierarchy, pair[2], 0) + get(scores, game, 0))
    end
end

function run()
    games1 = []
    games2 = []
    open(path, "r") do stream
        while !eof(stream)
            line = readline(stream)
            games1 = push!(games1, RockPaperScissors(line, false))
            games2 = push!(games2, RockPaperScissors(line, true))
        end
    end
    println(sum(map(x -> x.score, games1)))
    println(sum(map(x -> x.score, games2)))
end
    

end