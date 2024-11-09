function divide(a)
    # Вспомогательная функция для представления a в виде 2^k * a1
    k = 0
    while a % 2 == 0
        k += 1
        a = div(a, 2)
    end
    return a, k
end

function jacobi(a, n)
    # Вычисление символа Якоби (a/n)
    g = 1
    while a > 0
        if a == 0
            return 0
        elseif a == 1
            return g
        end

        a1, k = divide(a)

        # Корректировка g в зависимости от k и n по модулю 8
        if k % 2 != 0
            if n % 8 == 3 || n % 8 == 5
                g = -g
            end
        end

        # Применение квадратичной взаимности
        if a1 % 4 == 3 && n % 4 == 3
            g = -g
        end

        # Замена a и n
        a, n = n % a1, a1
    end
    return g
end

# Используем n = 13, a = 5
n = 13
a = 5
println(jacobi(a, n))  # Ожидается: 1 или -1 в зависимости от символа Якоби
