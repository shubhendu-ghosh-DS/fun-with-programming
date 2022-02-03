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



