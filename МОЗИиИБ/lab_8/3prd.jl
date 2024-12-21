u = [2; 4; 0]
v = [4; 5]
n = 3
m = 2
b = 10

function prd(u, v, n, m, b)
    w = zeros(Int64, 1, m+n)
    j = m
    while j > 0
        if v[j] == 0
            w[j] == 0
        else
            i = n
            k = 0
            while i > 0
                t = u[i] * v[j] + w[i+j] + k
                w[i+j] = t % b
                k = div(t, b)
                i = i - 1
            end
            w[j] = k
        end
        j -= 1
    end
    k = n + m - 1
    if w[1] == 0
        w = w[2:n+m]
        k -= 1
    end
    result = 0
    for i in 1:1:k
        result += w[i] * (10 ^ k)
        k -= 1
    end
    return result
end

println(prd(u, v, n, m, b))