# In this project  we will convert messages into some code( not program)
# we will be using Random library, so we need to import that
using Random
# This is the mother string from which code letter will bw drawn
A1 = "qwertyuiopasdfghjklzxcvbnm"
# These are the special characters
B = [",",".",";",":","?","-","_","!","@","#","%","&","(",")"]
# we will transform special characters into codes using only these letters
C = ["@","#","&","_"]
# This is the vector we will draw letter from
A = []
for j in A1
    push!(A, j)
end

# This is the dictinary that will contain all the words
D = Dict()
num = [2,3,4,5,6,7]


# This function will generate code for eah wordss
function generate(x)
    vec = []
    for j in split(x)
        push!(vec, j)
    end
    for k in vec
        if k ∈ keys(D)
            continue
        elseif k ∈ B
            # special code for special characters
            q = rand([2,3,4])
            code = times(C,q)
        else
            #other codes for normal character or words
            p = rand(num)
            code = times(A,p)
        end
        D["$(k)"] = "$(code)"
    end
end
        
            
    
    

function times(A,n)
    if n==2
        return rand(A)*rand(A)
    elseif n==3
        return rand(A)*rand(A)*rand(A)
    elseif n==4
        return rand(A)*rand(A)*rand(A)*rand(A)
    elseif n==5
        return rand(A)*rand(A)*rand(A)*rand(A)*rand(A)
    elseif n == 6
        return rand(A)*rand(A)*rand(A)*rand(A)*rand(A)*rand(A)
    else
        return rand(A)*rand(A)*rand(A)*rand(A)*rand(A)*rand(A)*rand(A)
    end
end

generate("we are in this time loop forever")

function codefo(x)
    sos = []
    state = ""
    for jin in split(x)
        push!(sos, jin)
    end
    for kim in sos
        if kim ∈ keys(D)
            state = state*D[kim]*" "
        else
            generate(kim)
            codefo(x)
        end
    end
    #println("If your output has @ sign then there is no code for that word in our database. please assign a code for that word")
    return state[1:end-1]
end

function reverse_code(x)
    rev = ""
    for kol in split(x)
        if kol ∈ values(D)
            for i in keys(D)
                if D[i] == kol
                    rev = rev*i*" "
                end
            end
        else
            rev = rev*"__ "
        end
    end
    return rev[1:end-1]
end

reverse_code("nep")

function codefor(x)
    s = codefo(x)
    s = codefo(x)
    return s
end


function encrypt(x)
    str = ""
    for i in x
        str = str*" "*i
    end
    str = remove_space(codefor(str),2)
    return str
end

function remove_space(x, p = 1)
    state = ""
    if p == 1
        for n in split(x)
            state = state*n*""
        end
    else
        for n in split(x)
            state = state*n*"%"
        end
    end
    return state
end

function add_space(x)
    str = ""
    for i in x
        str = str*i*" "
    end
    return str
end

function decrypt(x)
    vet = split(x, "%")
    vet = add_space(vet)
    mes = reverse_code(vet)
    mes = remove_space(mes)
    return mes
end

D


