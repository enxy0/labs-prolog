%-------------------------------------------
% Лабораторная работа №3                      
% Задание №1-1(5)
% Автор: Бушуев Никта Федорович     
% Дата: 28.02.2021 
%-------------------------------------------
% 1. (По [Цуканова,Дмитриева,2008,с.65])
% Напишите рекурсивный предикат, вычисляющий:
% (5) xn (nеNu{0}, n mod 2=0), если
% x0=const, x1=const, xk=const·xk-1+const·xk-2+const (kеN\{1}).
%-------------------------------------------

predicates
    x(integer)
    x_calculate(integer, integer)
    test(integer, integer)
clauses
    x(K):- A = K mod 2, A <> 0, 
        write("x(", K, "), k не делится на 2"), nl, !.
    x(K):- 
        x_calculate(K, R), test(K, T), write("x(", K, "): ", R, " = ", T), nl.

    x_calculate(0, 5).
    x_calculate(1, 6).
    x_calculate(K, R):- K1 = K - 1, K2 = K - 2, x_calculate(K1, R1), x_calculate(K2, R2), R = 7 * R1 + 8 * R2 + 13.
    % x(k) = 7 * x(k-1) + 8 * (k - 2) + 13

    % проверено на WolframAlpha: x(k)=7*x(k-1)+8*x(k - 2)+13, x(0) = 5, x(1) = 6
    test(0, 5).
    test(1, 6).
    test(2, 95).
    test(3, 726).
    test(4, 5866).
    test(5, 46806).
    test(6, 374495).
goal
    write("Тесты: "), nl,
    x(0), 
    x(1), 
    x(2), 
    x(3),
    x(4), 
    x(5), 
    x(6), 
    nl.
