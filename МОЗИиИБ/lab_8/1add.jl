n = 3
u = 789
v = 154
b = 10

function add(n,u,v,b)
    j = n
    k = 0
    w = []
    for j in n:-1:-1
        uj = u % b
        vj = v % b
        push!(w, (uj+vj+k) % b)
        k = floor((uj+vj+k) / b)
        u = div(u, b)
        v = div(v, b)
    end
    w0 = k
    if w0 == 1
        push!(w, w0)
        result = 0
        for i in n:-1:0
            result += (10 ^ i) * w[j+1]
            j -= 1
        end
            return result
    else
        result = 0
        for i in n-1:-1:0
            result += (10 ^ i) * w[j]
            j -= 1
        end
        return result
    end
end
w = add(n,u,v,b)

println(w)