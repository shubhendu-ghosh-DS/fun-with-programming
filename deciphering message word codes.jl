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


#This function will generate random combinations of letters from the dictinary given in the argument, 
#the second argument will decide the length of the combinating code

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



# This function will generate code for each words given.
function generate(x)
    vec = []
    for j in split(x)
        push!(vec, j)
    end
    for k in vec
        if k ∈ keys(D)
            #it will skip if the code for the word is already there
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
        #integrate them into the dicinary
        D["$(k)"] = "$(code)"
    end
end
        
            
    
    



#This function will display the codes for the words.
#It uses Recursion algorithm, that means if for some words code isn't present there, then it will generate he code for those word then display the sentence of codes
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
            #Here is the Recursion starts
            codefo(x)
        end
    end
    #println("If your output has @ sign then there is no code for that word in our database. please assign a code for that word")
    return state[1:end-1]
end

#The above function doesn't display the word on the first,  It have a problem. on second try it shows correct codes. so we need another function
function codefor(x)
    s = codefo(x)
    s = codefo(x)
    return s
end



#This function will receive code and return the original english words assigned with the code
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
            # If some code don't have original words corresponding to them, it will display "_" in those places
            rev = rev*"__ "
        end
    end
    return rev[1:end-1]
end

#This function will remove spaces between words, it will add % in place of space, or just erase the space
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

# This function will just join some words from a vector into a sentence using a spacbetween them
function add_space(x)
    str = ""
    for i in x
        str = str*i*" "
    end
    return str
end


#This function will encrypt a password into a long string
function encrypt(x)
    str = ""
    for i in x
        str = str*" "*i
    end
    str = remove_space(codefor(str),2)
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


