print("Number of rows & column: ")
N = io.read("*n")

function calc(N)
    if N < 1 then
        print("Invalid argument")
        return
    end
    
    ans = {}
    result = add(ans, 1)

    if result then
        print("Solution found")
        display(ans)
    else
        print("Solution not found")
    end
end

function add(already, currRow)
    if currRow > N then
        return true
    end

    for currCol = 1, N do
        if valid(already, currRow, currCol) then
            already[currRow] = currCol
            if add(already, currRow + 1) then
                return true
            end
        end
    end

    return false
end

function valid(already, attemptedRow, attemptedCol)
    for i = 1, attemptedRow - 1 do
        if already[i] == attemptedCol then
            return false
        end

        distance = attemptedRow - i
        if attemptedCol + distance == ans[i] or attemptedCol - distance == ans[i] then
            return false
        end
    end

    return true
end

function display(answer)
    for i = 1, N do
        for j = 1, N do
            io.write(answer[i] == j and "X" or "O", " ")
        end
        io.write("\n")
    end
    
    io.write("Co-ordinates: ")
    for i = 1, N do
        io.write("(", i, ", ", answer[i], ") ")
    end 
end

calc(N)