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
    if p == 2
        return length(B)
    else
        println("the year you put has $(A) such dates")
        if length(B) > 0
            println("and they are ")
            if p == 1
                for l in B
                    println("$(l)")
                end
            elseif p == 0
                    return B
            end
        end
    end
end
 




function which_year()    
    G =[]
    for k in leastdigit(2)
        k1 = k[end - 3:end]
        if k1 ∈ G
            continue
        else
            append!(G, [k1])
        end
    end
    return G
end


function highest(p)
    D = Dict()
    for x in which_year()
        y = countdates(x,2)
        D[x] = y
    end
    if p ==0
        return D
    else
        val = []
        key =[]
        for i in values(D)
            push!(val,i)
        end
        for j in keys(H)
            push!(key,j)
        end
        maxx,pos = findmax(val)
        println("The year $(key[pos]) has the highest number of dates that can be written using only two digits. It has $(maxx) such occurance")
    end
end






uniqchar("shubhendu ghosh)
zeroDD(7)
leastdigit(2)
countdates(2022,2)
which_year()
highest(2)
