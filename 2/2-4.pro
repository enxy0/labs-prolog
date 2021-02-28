%-----------------------------------------------------------------
% Лабораторная работа №2                       
% Задание №2-4
% Автор: Бушуев Никта Федорович     
% Дата: 28.02.2021 
%-----------------------------------------------------------------
% 4. (По ЕГЭ,2009,А9) Символом F обозначено одно из указанных ниже
% логических выражений от трёх аргументов: X, Y, Z.
%    Дан фрагмент таблицы истинности выражения F:
% -----------------
% | X | Y | Z | F |
% |---------------|
% | 1 | 0 | 0 | 1 |
% | 0 | 0 | 0 | 1 |
% | 1 | 1 | 1 | 0 |
% -----------------
% Укажите с помощью языка Prolog, какое выражение соответствует F?
% Программа на языке Prolog должна выдавать вариант ответа.
%    Варианты ответов:   (1)   ~X&~Y&~Z~   (2)   X&Y&Z~   (3)  XvYvZ~
% (4) ~Xv~Yv~Z.
%-----------------------------------------------------------------

domains
    bool=integer

predicates
    not_(bool, bool)
    and_(bool, bool, bool)
    or_(bool, bool, bool)
    
    expr(bool, bool, bool, bool) % Заданное выражение A&~(~BvC)

    first(bool, bool, bool, bool) % (1) ~X&~Y&~Z
    second(bool, bool, bool, bool) % (2) X&Y&Z
    third(bool, bool, bool, bool) % (3) XvYvZ
    fourth(bool, bool, bool, bool) % (4) ~Xv~Yv~Z

    is_first
    is_second
    is_third
    is_fourth
    find_expr(bool)

clauses
    not_(1, 0).
    not_(0, 1).

    and_(0, 0, 0).
    and_(0, 1, 0).
    and_(1, 0, 0).
    and_(1, 1, 1).

    or_(0, 0, 0).
    or_(0, 1, 1).
    or_(1, 0, 1).
    or_(1, 1, 1).

    expr(1, 0, 0, 1).
    expr(0, 0, 0, 1).
    expr(1, 1, 1, 0).

    first(A, B, C, R):-
        not_(A, NOT_A),
        not_(B, NOT_B),
        not_(C, NOT_C),
        and_(NOT_A, NOT_B, NOT_A_AND_NOT_B),
        and_(NOT_A_AND_NOT_B, NOT_C, R).

    second(A, B, C, R):-
        and_(A, B, A_AND_B),
        and_(A_AND_B, C, R).

    third(A, B, C, R):-
        or_(A, B, A_AND_B),
        or_(A_AND_B, C, R).

    fourth(A, B, C, R):-
        not_(A, NOT_A),
        not_(B, NOT_B),
        not_(C, NOT_C),
        or_(NOT_A, NOT_B, NOT_A_OR_NOT_B),
        or_(NOT_A_OR_NOT_B, NOT_C, R).

    is_first:-
        expr(A, B, C, R1),
        first(A, B, C, R2),
        R1 <> R2.

    is_second:-
        expr(A, B, C, R1),
        second(A, B, C, R2),
        R1 <> R2.

    is_third:-
        expr(A, B, C, R1),
        third(A, B, C, R2),
        R1 <> R2.

    is_fourth:-
        expr(A, B, C, R1),
        fourth(A, B, C, R2),
        R1 <> R2.

    find_expr(R):-
        not(is_first), R = 1; 
        not(is_second), R = 2;  
        not(is_third), R = 3;
        not(is_fourth), R = 4.

goal
    find_expr(R), write("Правильный вариант: ", R), nl.