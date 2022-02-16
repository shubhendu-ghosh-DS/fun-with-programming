#This simple code can decode basic word coding(not programming). investigate patterns and code a new word for a word

#all letter should be from normal enmglish letters
le = "abcdefghijklmnopqrstuvwxyz"
# let us take the upper case letters
le = uppercase(le)
#split them as one and make a list
Q = split(le, "")
S = []
for i in 1:26
    t = (Q[i], i)
    push!(S,t)
end
# assign them with numbers and make a dictinary
D = Dict(S)
#print(S)  

# This function will find patterns in the code
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


# This function will find letter assigned for that number
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



# Finally this function will code a new code for a given word, but we will have to give two word as reference
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



# Let's call the function once
codefor("TWINKLE", "SVHOJKD", "FILTERS")
    
