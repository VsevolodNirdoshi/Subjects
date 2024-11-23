import math

def fermat_factorization(n):
    # Проверяем, является ли число четным
    if n % 2 == 0:
        return (2, n // 2)

    # Начинаем с наименьшего целого числа s, такого что s^2 > n
    s = math.isqrt(n) + 1

    while True:
        t_squared = s * s - n  # Вычисляем t^2 = s^2 - n
        if t_squared >= 0:
            t = math.isqrt(t_squared)  # Проверяем, является ли t^2 полным квадратом
            if t * t == t_squared:
                # Если t^2 - это полный квадрат, возвращаем множители
                return (s - t, s + t)
        s += 1  # Увеличиваем s и пробуем снова

# Пример использования
n = int(input("Введите нечетное составное число для разложения: "))
factors = fermat_factorization(n)
print(f"Множители числа {n}: {factors}.")
