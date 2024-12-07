---
## Front matter
title: "Отчёт по лабораторной работе №7"
author: "Нирдоши Всеволод Раджендер"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
  - spelling=modern
  - babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
  - \usepackage[utf8]{inputenc}
  - \usepackage[T2A]{fontenc}  # T2A encoding for Cyrillic characters
  - \usepackage[russian]{babel}  # For Russian language support

---

#### **Цель работы:**
Изучение задачи дискретного логарифмирования в конечных полях и алгоритма $p$-метода Полларда для её решения. Реализация алгоритма с использованием языка программирования Julia.

---

#### **Задачи:**
1. Разобраться с основами конечных полей и их свойствами, включая операции сложения, умножения и нахождения обратных элементов.
2. Изучить теоретическую основу $p$-метода Полларда для решения задачи дискретного логарифмирования.
3. Реализовать алгоритм на языке Julia, обеспечивая корректность вычислений на каждом этапе.
4. Проверить работоспособность алгоритма на конкретных данных и проанализировать результаты.

---

#### **Проделанная работа:**
1. **Теоретическая часть:**
   - Изучены основные свойства конечных полей и их применение в криптографии.
   - Разобрана суть задачи дискретного логарифмирования:
     $$
     a^x \equiv b \ (\text{mod} \ p),
     $$
     где $p$ — простое число, $a$ — основание, $b$ — значение, и $x$ — логарифм, который необходимо найти.
   - Изучен алгоритм $p$-метода Полларда, включая использование двух указателей (медленного и быстрого) для обнаружения коллизий.

2. **Практическая часть:**
   - Реализована функция для итеративного обновления значений $c$, $u$, и $v$ в соответствии с определённым случайным отображением:
     - Если $c < r$: обновляется показатель $u$, связанный с основанием $a$.
     - Если $c \geq r$: обновляется показатель $v$, связанный с основанием $b$.
   - Реализован поиск коллизий между двумя указателями (медленным и быстрым).
   - Разработана функция для решения уравнения:
     $$
     \Delta v \cdot x \equiv \Delta u \ (\text{mod} \ r),
     $$
     с использованием вычисления обратного элемента через расширенный алгоритм Евклида.
   - Проведена проверка правильности найденного значения $x$ путём подстановки в исходное уравнение.

3. **Тестирование алгоритма:**
   - Алгоритм протестирован на следующих данных:
    $$
    10^{x} \equiv 64 \ (\text{mod} \ 107),
    $$   
    $$
    a^x \equiv b \ (\text{mod} \ p),
    $$
    $$
    p = 107, \quad a = 10, \quad r = 53, \quad b = 64.
    $$

   - На 11-м шаге обнаружена коллизия, и вычислено значение $x$.

---

#### **Скриншоты кода**

![](img/1.png)
![](img/2.png)
![](img/3.png)
![](img/4.png)
![](img/5.png)

---

#### **Итог**

![](img/6.png)

---

### **Результаты работы:**
- Значение дискретного логарифма:
  $$
  x = 20 \ (\text{mod} \ 53).
  $$
- Проверка:
  $$
  10^{20} \equiv 64 \ (\text{mod} \ 107),
  $$
  что подтверждает корректность алгоритма.

---

#### **Выводы:**
1. Алгоритм $p$-метода Полларда успешно реализован и протестирован. Он позволяет эффективно находить дискретный логарифм в конечных полях.
2. Вычисленные значения $u, v, U, V$ при коллизии подтверждают корректность обновлений логарифмов в процессе работы алгоритма.
3. Реализация функций для работы с конечными полями, включая нахождение обратных элементов, показала высокую точность и стабильность.
4. Основная сложность заключалась в правильной реализации и проверке каждого шага алгоритма, включая корректность работы с модульной арифметикой.
5. Итоговый результат может быть использован для изучения задач дискретного логарифмирования и в дальнейшем применён в криптографических протоколах.

---


