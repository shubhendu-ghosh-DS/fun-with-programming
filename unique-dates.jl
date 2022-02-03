function uniqchar(x)
    D =[]
    for i in x
        if i ∈ D
            continue
        else
            append!(D, i)
        end
    end
    return length(D)
end




function zeroDD(x)
    if x<10
        val = "0$(x)"
    else
        val = "$(x)"
    end
    return val
end


function leastdigit(n)
    D = []
    for i in 2000:3000
        for j in 1:12
            for k in 1:31
                s = "$(zeroDD(k))"*"$(zeroDD(j))"*"$(i)"
                s1 = "$(zeroDD(k))/"*"$(zeroDD(j))/"*"$(i)"
                if uniqchar(s) == n
                    append!(D,[s1])
                end
            end
        end
    end
    return D
end



function countdates(x,p)
    x = string(x)
    B =[]
    A = 0
    for i in leastdigit(2)
        y = i[end - 3:end]
        if x == y
            A += 1
            append!(B,[i])
        end
    end
    println("the year you put has $(A) such dates")
    if length(B) > 0
        println("and they are ")
        if p ==0
            for l in B
                println("$(l)")
            end
        else
            return B
        end
    end
end





