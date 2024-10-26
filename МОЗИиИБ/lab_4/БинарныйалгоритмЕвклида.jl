values = [20, 28]
g = 1
while (values[1]%2==0) && (values[2]%2==0)
    values[1] /= 2
    values[2] /= 2
    global  g *= 2
end
println(values)
u = values[1]
println(u)
v = values[2]
while u != 0
    while u%2 == 0
        global u /= 2
    end
    while v%2 == 0
        global v /= 2
    end
    if u >=  v
        global u = u-v
    else
        global v = v-u
    end
end
d = g*v
println(Int(d))