%------------------------------------------------------------------
% Лабораторная работа №5                     
% Задание №5-1-7
% Автор: Бушуев Никта Федорович     
% Дата: 22.03.2021 
%------------------------------------------------------------------
%  1. Напишите предикат, который в списке X: X=[Y1,Y2,Y3,...,Yn],
%  где Y1,Y2,Y3,...,Yn - одноуровневые списки, проверяет:
%  
%  (7) есть ли в числовом списке Y3 элемент, равный первому элемен-
%  ту списка Yn;
%------------------------------------------------------------------
domains
    list = integer*
    lists = list*

predicates
    last_list(lists, list)
    third_list(lists, list)
    head(list, integer)
    search(list, integer)
  
clauses
    last_list([H|[]], H).
    last_list([_|T], R):- last_list(T, R).
  
    third_list([], _):- fail.
    third_list([_|[]], _):- fail.
    third_list([_|[_|[]]], _):- fail.
    third_list([_|[_|[TTH|_]]], TTH).

    head([H|_], H).
 
    search([], _):- fail.
    search([H|T], V):- H = V, !.
  
goal
  LIST = [[1,2,3], [3,4,5], [5,7,1], [5, 4, 6]],
  third_list(LIST, LF), head(LF, H),
  last_list(LIST, LL), search(LL, H), write("Такой элемент существует: ", H, "\n").