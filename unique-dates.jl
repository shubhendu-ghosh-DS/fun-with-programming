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



