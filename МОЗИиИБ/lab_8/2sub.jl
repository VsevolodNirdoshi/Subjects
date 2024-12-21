u = 678
v = 243

function sub(n,u,v,b)
    j = n
    k = 0
    w = []
    for j in n:-1:1
        uj = u % b
        vj = v % b
        push!(w, (uj-vj+k) % b)
        k = floor((uj-vj+k) / b)
        u = div(u, b)
        v = div(v, b)
    end
    result = 0
    for i in n-1:-1:0
        result += (10 ^ i) * w[j]
        j -= 1
    end
    return result
end
w = sub_(n,u,v,b)

println(w)