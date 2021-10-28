--Factorial of N
function fact (n)
    if n >= 0 then
        if n == 0 then
            return 1
        else 
            return n * fact(n - 1)
        end
    else
        print("Invalid argument") 
        return -1;
    end
end

print("Enter a number: ");
a = io.read("*n");
print(fact(a));