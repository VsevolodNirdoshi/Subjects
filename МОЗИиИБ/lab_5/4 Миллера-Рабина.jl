function decompose(n_minus_1)
    # Разложение n - 1 в виде 2^s * r
    k = 0
    while n_minus_1 % 2 == 0
        k += 1
        n_minus_1 = div(n_minus_1, 2)
    end
    return n_minus_1, k
end

function miller_rabin(n, a)
    # Специальные случаи
    if n == 2 || n == 3
        return "Число $n вероятно простое"
    end
    if n < 2 || n % 2 == 0
        return "Число $n составное"
    end

    # Шаг 1: Разложение n - 1 в виде 2^s * r
    r, s = decompose(n - 1)

    # Шаг 2: Вычисляем y = a^r % n
    y = powermod(a, r, n)
    
    # Шаг 3: Проверка, равен ли y 1 или n - 1
    if y != 1 && y != n - 1
        # Возведение y в квадрат до s - 1 раз
        for j in 1:(s - 1)
            y = (y * y) % n
            # Если y становится равным n - 1, n проходит этот тест
            if y == n - 1
                return "Число $n вероятно простое"
            end
            # Если y становится равным 1, n составное
            if y == 1
                return "Число $n составное"
            end
        end
        # Если y никогда не стало равным n - 1, n составное
        if y != n - 1
            return "Число $n составное"
        end
    end
    return "Число $n вероятно простое"
end

# Используем n = 13, a = 5
n = 13
a = 5
println(miller_rabin(n, a))  # Ожидается: Число 13 вероятно простое
