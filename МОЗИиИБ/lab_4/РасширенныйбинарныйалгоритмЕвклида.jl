values = [20, 28]
g = 1

while (values[1] %2 == 0) && (values[2] % 2 == 0)
    values[1] /= 2
    values[2] /= 2
    global  g *= 2
end

u = values[1]
v = values[2]
A = 1
B = 0
C = 0
D = 1
while u != 0
    while (u%2 != 1)
        global u /= 2  
        if A%2 == 0 && B%2 ==0
            global A /=2
            global B /=2
        else
            global A = (A + values[2])/2
            global B = (B - values[1])/2
        end
    end
    while (v%2 != 1)
        global v /= 2  
        if C%2 == 0 && D%2 ==0
            global C /=2
            global D /=2
        else
            global C = (C + values[2])/2
            global D = (D - values[1])/2
        end
    end
    if u >= v
        global u = u - v
        global A = A - C
        global B = B - D
    else
        global v = v - u
        global C = C - A
        global D = D - B
    end   
end

d = Int(g*v)
x = C
y = D
println(d)
println(x)
println(y)