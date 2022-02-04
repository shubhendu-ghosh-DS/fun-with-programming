#this program is a way to see which dates can be written using just two digits

#this function returns the unique character in a string
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



#we read 3/4/2020 as 03/04/2020. This function does just that. adds a zero before single digit days or month
function zeroDD(x)
    if x<10
        val = "0$(x)"
    else
        val = "$(x)"
    end
    return val
end

#this function returns the dates which can be expressed using only n digits. 
#Note: this is suitable only for n = 2. for n = 3 or more we would have to adjust the function, like 31st of feb will be present there if n = 3 is taken
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


#this takes two parameter. x : year, p = [0,1,2]. x is the year in which you want to count how many such dates are possible. 
#if p = 2, then it will just return the number of such dates possible, p = 1, then it will return  strings stating how many dates are possible. 
#if there are any it will print them too
#if p = 0, then it will rwturn a list of dates that can be iterated later.
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
 



#This function returns a list that contains all the year that have atleast one of such dates in them
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

#This function takes one argument, if p = 0, then it will simply return a dictinary that contains yhe year and their occurance of such dates
#if p = any other number, the it will return a string stating that which year contains the most of such dates and how many of them are there in that year
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
