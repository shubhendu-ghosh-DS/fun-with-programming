#This simple code can decode basic word coding(not programming). investigate patterns and code a new word for a word

#all letter should be from normal enmglish letters
le = "abcdefghijklmnopqrstuvwxyz"
le = uppercase(le)
Q = split(le, "")
S = []
for i in 1:26
    t = (Q[i], i)
    push!(S,t)
end

D = Dict(S)
#print(S)  


function pattern(x,y)
    F = split(x,"")
    G = split(y, "")
    d = length(F)
    J =[]
    for i in 1:d
        x = D[F[i]] - D[G[i]]
        push!(J, x)
    end
    return J
end



function find(x)
    if x ∈ values(D)
        for key in keys(D)
            if D[key] == x
                return key
            end
        end
    else
        x = 26+x
        find(x)
    end
end




function codefor(x,y,z)
    L = pattern(x,y)
    if length(x) == length(y) == length(z)
        Str = ""
        P = split(z, "")
        for k in 1:length(P)
            Str = Str * find(D[P[k]]-L[k])
        end
    end
    return Str
end




codefor("TWINKLE", "SVHOJKD", "FILTERS")
    
