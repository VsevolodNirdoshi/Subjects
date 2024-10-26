r = [20, 28]
x = Float64[1, 0]
y = Float64[0, 1]
i = 1

while i != 100
    q = div(r[i], r[i+1]) 
    push!(r, r[i]%r[i+1])
    if r[i+2] == 0
        push!(x, x[i+1])
        push!(y, y[i+1])
        println("d:", r[i+1])
        println("x:", x[i+2])
        println("y:", y[i+2])
        println(r[1]*x[i+2] + r[2]*y[i+2])
        break
    else r[i+2] != 0
        push!(x, x[i]-q*x[i+1])
        push!(y, y[i]-q*y[i+1])
        global i += 1
    end
end