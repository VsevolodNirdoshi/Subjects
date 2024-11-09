function solovay_strassen(n, a)
    # Шаг 2: Вычисляем r = a^((n - 1) / 2) % n
    r = powermod(a, (n - 1) ÷ 2, n)
    
    # Шаг 3: Вычисляем символ Якоби (a/n)
    s = jacobi(a, n)
    
    # Приводим s к диапазону [0, n - 1] (если требуется)
    if s < 0
        s += n
    end

    # Шаг 4: Сравнение r и s по модулю n
    if (r != s % n)
        println("Число $n составное")
        return false
    else
        println("Число $n вероятно простое")
        return true
    end
end

# Используем n = 13, a = 5
n = 13
a = 5
println(solovay_strassen(n, a))  # Ожидается: Число 13 вероятно простое
