%------------------------------------------------------------------
% Лабораторная работа №1.1
% Задание №2-6
% Автор: Бушуев Никта Федорович
% Дата: 15.05.2021
%------------------------------------------------------------------
% 6. [Бураков,2003,с.33]
% Четыре человека играют в домино.  Их фамилии Кузнецов,  Токарев,
% Слесарев и Резчиков. Профессия каждого игрока соответствует фамилии
% одного из других игроков.
% Напротив Кузнецова сидит слесарь.  Напротив Резчикова сидит рез-
% чик. Справа от Слесарева сидит токарь. Кто сидит слева от кузнеца?
%------------------------------------------------------------------


predicates
    man(symbol)
    profession(symbol)
    rule0(symbol, symbol)
    rule1(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    rule2(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    rule3(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    find_all(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    find_task(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)

clauses
    man("кузнецов").
    man("токарев").
    man("слесарев").
    man("резчиков").

    profession("кузнец").
    profession("токарь").
    profession("слесарь").
    profession("резчик").

    rule0("кузнецов", "кузнец") :- !, fail.
    rule0("токарев", "токарь") :- !, fail.
    rule0("слесарев", "слесарь") :- !, fail.
    rule0("резчиков", "резчик") :- !, fail.
    rule0(_,_).
    
    % Расшифровка параметров к функциям rule1, rule2, rule3
    % D - Фамилия игрока снизу
    % DP - Профессия игрока снизу
    % L - Фамилия игрока слева
    % LP - Профессия игрока слева
    % U - Фамилия игрока сверху
    % UP - Профессия игрока сверху
    % L - Фамилия игрока справа
    % LP - Профессия игрока справа
    rule1(D, DP, L, LP, U, UP, R, RP) :-
        D = "кузнецов", UP = "слесарь";
        L = "кузнецов", RP = "слесарь";
        U = "кузнецов", DP = "слесарь";
        R = "кузнецов", LP = "слесарь".
    rule2(D, DP, L, LP, U, UP, R, RP) :-
        D = "резчиков", UP = "резчик";
        L = "резчиков", RP = "резчик";
        U = "резчиков", DP = "резчик";
        R = "резчиков", LP = "резчик".
    rule3(D, DP, L, LP, U, UP, R, RP) :-
        D = "слесарев", RP = "токарь";
        L = "слесарев", DP = "токарь";
        U = "слесарев", LP = "токарь";
        R = "слесарев", UP = "токарь".

    find_all(D, DP, L, LP, U, UP, R, RP) :-
        rule0(D, DP), rule0(L, LP), rule0(U, UP), rule0(R, RP),
        rule1(D, DP, L, LP, U, UP, R, RP),
        rule2(D, DP, L, LP, U, UP, R, RP),
        rule3(D, DP, L, LP, U, UP, R, RP).

    find_task(_, "кузнец", L, LP, _, _, _, _, L, LP).
    find_task(_, _, _, "кузнец", U, UP, _, _, U, UP).
    find_task(_, _, _, _, _, "кузнец", R, RP, R, RP).
    find_task(D, DP, _, _, _, _, _, "кузнец", D, DP).

goal
    D = "кузнецов",
    man(L), man(U), man(R),
    D <> L, D <> U, D <> R, L <> U, L <> R, U <> R,
    profession(DP), profession(LP), profession(UP), profession(RP),
    DP <> LP, DP <> UP, DP <> RP, LP <> UP, LP <> RP, UP <> RP,
    find_all(D, DP, L, LP, U, UP, R, RP),
    write("Снизу сидит ", D, ", профессия - ", DP), nl,
    write("Слева сидит ", L, ", профессия - ", LP), nl,
    write("Сверху сидит ", U, ", профессия - ", UP), nl,
    write("Справа сидит ", R, ", профессия - ", RP), nl,
    find_task(D, DP, L, LP, U, UP, R, RP, SOLUTION, SOLUTION_PROF),
    write("Решение: слева от кузнеца сидит ", SOLUTION, ", профессия - ", SOLUTION_PROF), nl.
