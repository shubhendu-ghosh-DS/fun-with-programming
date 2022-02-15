le = "abcdefghijklmnopqrstuvwxyz"
le = uppercase(le)
S = []
for j in 1:26
    t = (le[j],j)
    push!(S,t)
    
end
D = Dict(S)
