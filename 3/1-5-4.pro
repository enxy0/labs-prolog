%-------------------------------------------
% Лабораторная работа №3                      
% Задание №1-5(4)
% Автор: Бушуев Никта Федорович     
% Дата: 28.02.2021 
%-------------------------------------------
% 5. (По [Цуканова,Дмитриева,2008,с.66])
% Напишите рекурсивный предикат, вычисляющий:
% 
% S = sum of ak * bk where k = 1..n
%
%-------------------------------------------

predicates
    a(integer, integer)
    b(integer, integer)
    s(integer, integer)
    test(integer)
    answer(integer, integer)

clauses
    a(1, 1).
    a(K, R):- K > 1, K1 = K - 1, b(K1, B), a(K1, A), R = 3 * B + 2 * A.

    b(1, 1).
    b(K, R):- K > 1, K1 = K - 1, a(K1, A), b(K1, B), R = 2 * A + B.

    s(0, 0).
    s(K, R):- K >= 1, K1 = K - 1, a(K, A), b(K, B), s(K1, R1), R = A*B + R1.

    answer(1, 1).
    answer(2, 16).
    answer(3, 263).
    answer(4, 4190).
    answer(5, 67125).
    answer(6, 1073676).

    test(X):- s(X, S), answer(X, A), write("S(", X, "): ", S, " = ", A), nl.
goal
    write("Тесты:"), nl,
    test(1),
    test(2),
    test(3),
    test(4),
    test(5),
    test(6).

/*
Проверочные ответы для рекурсии были получены на Kotlin 1.4.21

Вывод:
1: 1
2: 16
3: 263
4: 4190
5: 67125
6: 1073676

fun main() {
    (1..6).forEach { n ->
        (1..n).sumOf { k ->
            a(k) * b(k)
        }.also {
            println("$n: $it")
        }   
    }
}

fun a(k: Int): Int = when(k) {
    1 -> 1
    else -> 3 * b(k - 1) + 2 * a(k - 1)
}

fun b(k: Int): Int = when(k) {
    1 -> 1
    else -> 2 * a(k - 1) + b(k - 1)
}
*/ 