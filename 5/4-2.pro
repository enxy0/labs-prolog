%------------------------------------------------------------------
% Лабораторная работа №5                     
% Задание №4-2
% Автор: Бушуев Никта Федорович     
% Дата: 22.03.2021 
%------------------------------------------------------------------
% 2. Напишите  предикат,  проверяющий,  есть  ли в числовом списке
% элемент, равный сумме первого и последнего элементов.
%------------------------------------------------------------------
domains
    list = integer*
  
predicates
    last(list, integer)
    first(list, integer)
    search(list, integer)
  
clauses
    last([_|T], R):- last(T, R).
    last([H|[]], H).
  
    first([H|_], H).
  
    search([H|T], V):- H = V, !; search(T, V).
    search([], _):- fail.
  
goal
    LIST = [1, 2, 3, 4, 6, 5],
    first(LIST, FIRST), last(LIST, LAST), R = FIRST + LAST,
    search(LIST, R).