u = [2, 4, 8]  
v = [2, 9]     
n = 3
m = 2
b = 10
function fprd(u, v, n, m, b)

    w = zeros(Int, m + n)
    f = m + n - 1
    for s in 0:f
        t = 0  
        for i in 0:s
            ui = n - i
            vi = m - s + i
            if ui >= 1 && ui <= n && vi >= 1 && vi <= m
                t += u[ui] * v[vi]
            end
        end
    
        z = (m + n) - s
        t += w[z]
        w[z] = t % b
        k = div(t, b) 
        if z > 1
            w[z - 1] += k
        end
    end
    
    return w
end

println(fprd(u, v, n, m, b))
