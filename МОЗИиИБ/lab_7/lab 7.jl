p = 107
a = 10
r = 53
b = 64

# Функция, определяющая преобразование
function funf(h, j, k)
    if h < r
        j += 1
        return mod(a * h, p), j, k
    else
        k += 1
        return mod(b * h, p), j, k
    end
end

u, v = 2, 2  
U, V = 2, 2  

c = mod(a^u * b^v, p)  
d = c  

println("Начальное значение c: ", c)
println("Начальное значение d: ", d)

# Применяем преобразование для c и d
c, u, v = funf(c, u, v)
d, U, V = funf(d, U, V)
d, U, V = funf(d, U, V)

println("Обновленное значение c: ", c)
println("Обновленное значение d: ", d)


function second(c, d, u, v, U, V)
    while c != d
        c, u, v = funf(c, u, v)  
        d, U, V = funf(d, U, V)  
        d, U, V = funf(d, U, V)  
        println("Текущее значение c: $c, d: $d")
    end
    return c, d, u, v, U, V
end


c, d, u, v, U, V = second(c, d, u, v, U, V)

println("Итоговое значение c: ", c)
println("Итоговое значение d: ", d)
println("Итоговое значение u: ", u)
println("Итоговое значение v: ", v)
println("Итоговое значение U: ", U)
println("Итоговое значение V: ", V)

# Функция для вычисления x из логарифмов
function compute_x(u, v, U, V, r)
    delta_v = mod(v - V, r)  
    delta_u = mod(U - u, r)

    if delta_v == 0
        return "Решений нет"  
    end
    
    delta_v_inv = nothing
   
    try
        delta_v_inv = invmod(delta_v, r)
    catch
        return "Решений нет"
    end
    
    x = mod(delta_u * delta_v_inv, r)  
    return x
end

function invmod(a, m)
    g, x, _ = gcdx(a, m)
    if g != 1
        throw(ArgumentError("Обратного элемента не существует"))
    else
        return mod(x, m)
    end
end


x = compute_x(u, v, U, V, r)

println("Логарифм x: ", x)
