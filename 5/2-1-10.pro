%------------------------------------------------------------------
% Лабораторная работа №5                     
% Задание №2-2-1
% Автор: Бушуев Никта Федорович     
% Дата: 22.03.2021 
%------------------------------------------------------------------
% 2. Опишите декларативную семантику следующих программ
%------------------------------------------------------------------
domains
   reallist=real*
predicates
   real_average(reallist,real)
   list_length(reallist,real,real)
   list_sum(reallist,real,real)
   get_list(reallist)
clauses

   % Находит среднее значение всех элементов списка
   real_average(List,Average):-
                          list_length(List,0,Length),
                          list_sum(List,0,Sum),
                          Average=Sum/Length.

   % Подсчитывает длину списка
   list_length([],L,L).
   list_length([_|T],Temp_length,Length):-
                          New_temp=Temp_length+1,
                          list_length(T,New_temp,Length).
   
   % Подсчитывает сумму элементов списка
   list_sum([],S,S).
   list_sum([Num|T],Temp_sum,Sum):-
                          New_temp=Num+Temp_sum,
                          list_sum(T,New_temp,Sum).
                        
   % Считывает лист с IO
   get_list([H|T]):- write("Введите вещественное число: "),
                     readreal(H),get_list(T).
   get_list([]).

goal
   write("Вводите список вещественных чисел ",
         "(нецифровой символ для остановки):\n"),
   get_list(List),nl,real_average(List,Average),
   write("Введенный список: ",List),nl,
   writef("Среднее значение: %",Average).