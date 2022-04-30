word = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, "
s = word.split(",")
word = "".join(s)
words = []
for ele in word:
    words.append(ele)
assign = []
for i in range(1,28):
    assign.append(i)
    
 

word_dict = {words[i]:assign[i] for i in range(len(words))}




def reverse(string):
    new_string = ""
    for i in range(len(string)):
        new_string += string[len(string)- i - 1]
    return new_string

def to_bin(num):
    bin_str = ""
    if num ==0 :
        return '0'
    else:
        
        while num>0:
            rem = num % 2
            bin_str += str(rem)
            num = num//2
        return reverse(bin_str)

    
    
def LoU(letter):
    if letter == letter.lower():
        return 1
    else :
        return 0

    
def Upp(string):
    positions = ""
    for i in range(len(string)):
        if LoU(string[i]) == 0:
            positions += ","+str(i)
    return positions[1:]

    

def fetch_assign(word):
    new = ""
    pos = Upp(word)
    word = word.lower()
    for element in word:
        ass = word_dict[element]
        ass = str(to_bin(ass))
        new = new +'2'+ ass
    new = new[1:]
    bins = pos.split(",")
    if len(bins) == 1 and bins[0] == '':
        return new + '4'
    else:
        new1 = ""
        for elem in bins:
            elem = int(elem)
            elem = str(to_bin(elem))
            new1 += "3" + elem
        new1 = new1[1:] 
        new = new + "4" + new1    
        return new

def resurrect(bin_str):
    strings = bin_str.split('4')
    strin = strings[0]
    strin = strin.split("2")
    poss = strings[1]
    stem = ""
    for i in strin:
        for j in word_dict:
            if to_bin(word_dict[j]) == i:
                stem += j
    
    positions = poss.split("3")
    if len(positions) == 1 and positions[0] == '':
        return stem
    else :
        for k in range(len(positions)):
            positions[k] = to_dec(positions[k])
        stem = Upr(stem, positions)
    return stem
