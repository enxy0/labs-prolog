%------------------------------------------------------------------
% Лабораторная работа №1.1
% Задание №2-3
% Автор: Бушуев Никта Федорович
% Дата: 15.05.2021
%------------------------------------------------------------------
% 3. [Бураков,2003,с.33-34]
% Имеется четыре котенка - Дружок,  Елисей, Фантик и Мурлыка и че-
% тыре мальчика - Миша, Максим, Леня и Дима. Каждый мальчик взял себе
% котенка любимого цвета.
% При этом:
% (1) Фантик - не рыжий, Мурлыка - не серый;
% (2) Дружок - не белый, Елисей - не серый;
% (3) у Миши - черный котенок, у Максима - Мурлыка;
% (4) у Лени - Елисей, у Димы - белый котенок;
% (5) Дима не взял Фантика, Дружок - не серый.
% Одно из этих пяти утверждений ложное.  У какого  мальчика  какой
% котенок?
%------------------------------------------------------------------
domains
    list = symbol*

predicates
    kitten(symbol)
    boy(symbol)
    color(symbol)
    rule1(symbol, symbol, symbol)
    rule2(symbol, symbol, symbol)
    rule3(symbol, symbol, symbol)
    rule4(symbol, symbol, symbol)
    rule5(symbol, symbol, symbol)
    solve(symbol, symbol, symbol, integer)
    member(list, symbol)
    unique(list)
    find

clauses
    kitten("Дружок").
    kitten("Елисей").
    kitten("Фантик").
    kitten("Мурлыка").
  
    boy("Миша").
    boy("Максим").
    boy("Леня").
    boy("Дима").
  
    color("Рыжий").
    color("Серый").
    color("Черный").
    color("Белый").
  
    rule1("Фантик", _ , "Рыжий") :- !, fail. 
    rule1("Мурлыка", _, "Серый") :- !, fail. 
    rule1(_,_,_).  
  
    rule2("Дружок", _, "Белый") :- !, fail.
    rule2("Елисей", _, "Серый") :- !, fail. 
    rule2(_,_,_). 
 
    rule3(_, "Миша", "Черный") :- !. 
    rule3(_, "Миша", _) :- !, fail. 
    rule3(_, _, "Черный") :- !, fail. 
    rule3("Мурлыка", "Максим", _) :- !. 
    rule3("Мурлыка", _, _) :- !, fail. 
    rule3(_, "Максим", _) :- !, fail. 
    rule3(_,_,_).  
  
    rule4("Елисей", "Леня", _) :- !. 
    rule4("Елисей", _, _) :- !, fail. 
    rule4(_, "Леня", _) :- !, fail. 
    rule4(_, "Дима", "Белый") :- !. 
    rule4(_, "Дима", _) :- !, fail. 
    rule4(_, _, "Белый") :- !, fail. 
    rule4(_,_,_).
  
    rule5("Фантик", "Дима", _) :- !, fail. 
    rule5("Дружок", _, "Серый") :- !, fail. 
    rule5(_,_,_).
  
    % Нахождение ложного утверждения с выводом информации о котенке, хозяине и цвете.
    solve(K,B,C,1) :- not(rule1(K,B,C)), rule2(K,B,C), rule3(K,B,C), rule4(K,B,C), rule5(K,B,C).
    solve(K,B,C,2) :- rule1(K,B,C), not(rule2(K,B,C)), rule3(K,B,C), rule4(K,B,C), rule5(K,B,C).
    solve(K,B,C,3) :- rule1(K,B,C), rule2(K,B,C), not(rule3(K,B,C)), rule4(K,B,C), rule5(K,B,C).
    solve(K,B,C,4) :- rule1(K,B,C), rule2(K,B,C), rule3(K,B,C), not(rule4(K,B,C)), rule5(K,B,C).
    solve(K,B,C,5) :- rule1(K,B,C), rule2(K,B,C), rule3(K,B,C), rule4(K,B,C), not(rule5(K,B,C)).
  
    % Вхождение в список
    member([H|_], H) :- !.
    member([_|T], V) :- member(T, V).
    member([], _) :- fail.

    % Проверка элемента списка на уникальность
    unique([]). 
    unique([H|T]) :- not(member(T, H)), unique(T).
  
    find :-
        kitten(K1), boy(B1), color(C1),     
        kitten(K2), boy(B2), color(C2),     
        kitten(K3), boy(B3), color(C3),     
        kitten(K4), boy(B4), color(C4),     
        unique([K1,K2,K3,K4]),     
        unique([B1,B2,B3,B4]),     
        unique([C1,C2,C3,C4]),     
        solve(K1,B1,C1,N),     
        solve(K2,B2,C2,N),     
        solve(K3,B3,C3,N),     
        solve(K4,B4,C4,N),
        write("Решение (", N, " утверждение ложное)."), nl,
        write("Котёнок: ", K1, ", мальчик: ", B1, ", цвет: ", C1), nl,
        write("Котёнок: ", K2, ", мальчик: ", B2, ", цвет: ", C2), nl,
        write("Котёнок: ", K3, ", мальчик: ", B3, ", цвет: ", C3), nl,
        write("Котёнок: ", K4, ", мальчик: ", B4, ", цвет: ", C4), nl.
 
 goal
   find.