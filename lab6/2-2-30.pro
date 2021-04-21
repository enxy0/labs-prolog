%------------------------------------------------------------------
% Лабораторная работа №6
% Задание №2.2-30
% Автор: Бушуев Никта Федорович
% Дата: 18.04.2021
%------------------------------------------------------------------
% 30. Напишите  программу,  которая считает число слов в предложе-
% нии, начинающихся на заданную букву.
%------------------------------------------------------------------
predicates
    count_words_with_letter(char, string, integer)
    count_starts_with(char, string, integer)
    test

clauses
    count_words_with_letter(SY, S, C):- char_int(SY, CC), CC >= 97, CC <= 122, !, 
        str_char(SSY, SY), upper_lower(UPSSY, SSY),
        str_char(UPSSY, UPSY),
        count_starts_with(SY, S, C1), count_starts_with(UPSY, S, C2),
        C = C1 + C2.

    count_words_with_letter(SY, S, C):- char_int(SY, CC), CC >= 65, CC <= 90, !,
        str_char(SSY, SY), upper_lower(SSY, LOSSY),
        str_char(LOSSY, LOSY),
        count_starts_with(SY, S, C1), count_starts_with(LOSY, S, C2),
        C = C1 + C2.

    count_words_with_letter(SY, S, C):- count_starts_with(SY, S, C).

    count_starts_with(SY, S, C):- searchchar(S, ' ', P), !,
        frontstr(P, S, S1, S2),
        str_len(S1, N), N1 = N - 1, frontstr(N1, S1, S1C, _),
        count_starts_with(SY, S1C, C1), count_starts_with(SY, S2, C2),
        C = C1 + C2.

    count_starts_with(SY, S, 1):- searchchar(S, SY, P), P = 1, !.
    count_starts_with(_, _, 0).

    test:-
        count_words_with_letter('R', "Rabbit Runs through the rabbithole", 3),
        count_words_with_letter('r', "Rabbit Runs through the rabbithole", 3),    
        count_words_with_letter('T', "Rabbit Runs through the rabbithole", 2),
        count_words_with_letter('t', "Rabbit Runs through the rabbithole", 2),
        count_words_with_letter('a', "Rabbit Runs through the rabbithole", 0),
        count_words_with_letter('u', "Rabbit Runs through the rabbithole", 0),
        count_words_with_letter('i', "Rabbit Runs through the rabbithole", 0).
goal
    test.
