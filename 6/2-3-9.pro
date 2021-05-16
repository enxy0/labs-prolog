%------------------------------------------------------------------
% Лабораторная работа №6
% Задание №2.3-9
% Автор: Бушуев Никта Федорович
% Дата: 18.04.2021
%------------------------------------------------------------------
% 9. Напишите программу для вычеркивания из слова X всех букв "р",
% перед которыми стоит буква "а".
%------------------------------------------------------------------
predicates 
    remove_r(string,string) 
    test 

clauses 
    remove_r("",""). 
    remove_r(S,R):- searchstring(S, "ap", P), 
        frontstr(P,S,X1,X2),  % X1 имеет на конце 'a', X2 имеет в начале 'p' 
        frontchar(X2,'p',X3), % X3 не содержит 'р'
        concat(X1,X3,R1),     % складываем вместе X1 и X3
        remove_r(R1, R),!. 
    remove_r(S,S). 

    test:-
        remove_r("aphck","ahck"), 
        remove_r("apapapa","aaaa"), 
        remove_r("papapa","paaa"),
        remove_r("fjsdkfjklsdjfkjsd", "fjsdkfjklsdjfkjsd"),
        remove_r("",""). 

goal 
    test.
 