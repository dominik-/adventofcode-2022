module Day1

export summarizeCalories

function summarizeCalories()

    calories = []
    caloriesList = open("./01/input/01.txt", "r")
    tmpSum = 0

    while !eof(caloriesList)
        ln = readline(caloriesList)
        if ln != ""
            val = parse(Int,ln)
            tmpSum += val
        else
            push!(calories, tmpSum)
            tmpSum = 0
        end
    end
    sort!(calories, rev = true)
    println(sum(first(calories,3)))
end

end