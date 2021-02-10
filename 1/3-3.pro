% ---------------------------------------------
% Лабораторная работа №1                       
% Задание №3_3(б, з, к)                        
% Автор: Бушуев Никта Федорович     
% Дата: 09.02.2021           
% ---------------------------------------------

domains
   name=symbol

predicates
   nondeterm male(name)                           %   Мальчик(ребенок)
   nondeterm female(name)                         %   Девочка(ребенок)
   nondeterm father(name, name)                   %   Отец(ребенок,отец)
   nondeterm mother(name, name)                   %   Мать(ребенок,мать)
   nondeterm parents(name, name, name)            %   Родители (ребенок, отец, мать)
   nondeterm grandMother(name, name)              %   Бабушка
   nondeterm aunt(name, name)                     %   Тетя
   nondeterm grandSon(name, name)                 %   Внук
   nondeterm grandDaughter(name, name)            %   Внучка
   nondeterm greatGrandDaughter(name, name)       %   Правнучка
   nondeterm greatGrandSon(name, name)            %   Правнук
   nondeterm greatGrandMother(name, name)         %   Прабабушка
   nondeterm greatGreatGrandDaughter(name, name)  %   Праправнучка

clauses
   male("Алексей Михайлович").
   male("Дмитрий Алексеевич").
   male("Алексей Алексеевич").
   male("Фёдор III Алексеевич").
   male("Иван V Алексеевич"). 
   male("Карл-Леопольд Мекленбург-Шверинский (муж)"). 
   male("Фридрих-Вильгельм Курдяндский (муж)"). 
   male("Пётр I"). 
   male("Алексей Петрович"). 
   male("Пётр II"). 
   male("Александр Петрович").
   male("Карл-Фридрих Голштинский (муж)").
   male("Пётр Петрович").
   male("Павел Петрович").

   female("Мария Ильиничная Милославская").
   female("Евдокия Алексеевна").
   female("Марфа Алексеевна").
   female("Анна Алексеевна").
   female("Софья Алексеевна").
   female("Екатерина Алексеевн").
   female("Мария Алексеевна").
   female("Агафья Семёновна Грушецкая (первая жена)").
   female("Марфа Матвеевна Апраксина  (вторая жена)").
   female("Феодосия Алексеевна").
   female("Прасковья Фёдоровна Салтыкова (жена)").
   female("Мария Иоанновна").
   female("Фодосия Иоанновна").
   female("Екатерина Иоанновна").
   female("Анна I Иоанновна").
   female("Прасковья Иоанновна").
   female("Евдокия Алексеевна (II)").
   female("Наталья Кирилловна Нарышкина (вторая жена)").
   female("Евдокия Лопухина (первая жена)").
   female("Шарлотта Брауншвейг-Вольфенбюттельская (жена)").
   female("Наталья Алексеевна").
   female("Екатерина I (вторая жена)").
   female("Екатерина Петровна").
   female("Анна Петровна").
   female("Елизавета Петровна").
   female("Наталья Петровна (I)").
   female("Маргарита Петровна").
   female("Наталья Петровна (II)").
   female("Наталья Алексеевна").
   female("Феодора Алексеевна").

   mother("Дмитрий Алексеевич"     , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Евдокия Алексеевна"     , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Марфа Алексеевна"       , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Алексей Алексеевич"     , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Анна Алексеевна"        , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Софья Алексеевна"       , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Екатерина Алексеевна"   , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Мария Алексеевна"       , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Фёдор III Алексеевич"   , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Феодосия Алексеевна"    , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Иван V Алексеевич"      , "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Евдокия Алексеевна (II)", "Мария Ильиничная Милославская (первая жена)"  ).
   mother("Пётр I"                 , "Наталья Кирилловна Нарышкина (вторая жена)"   ).
   mother("Наталья Алексеевна"     , "Наталья Кирилловна Нарышкина (вторая жена)"   ).
   mother("Феодора Алексеевна"     , "Наталья Кирилловна Нарышкина (вторая жена)"   ).
   mother("Мария Иоанновна"        , "Прасковья Фёдоровна Салтыкова (жена)"         ).
   mother("Фодосия Иоанновна"      , "Прасковья Фёдоровна Салтыкова (жена)"         ).
   mother("Екатерина Иоанновна"    , "Прасковья Фёдоровна Салтыкова (жена)"         ).
   mother("Анна I Иоанновна"       , "Прасковья Фёдоровна Салтыкова (жена)"         ).
   mother("Прасковья Иоанновна"    , "Прасковья Фёдоровна Салтыкова (жена)"         ).
   mother("Алексей Петрович"       , "Евдокия Лопухина (первая жена)"               ).
   mother("Александр Петрович"     , "Евдокия Лопухина (первая жена)"               ).
   mother("Пётр II"                , "Шарлотта Брауншвейг-Вольфенбюттельская (жена)").
   mother("Наталья Алексеевна"     , "Шарлотта Брауншвейг-Вольфенбюттельская (жена)").
   mother("Екатерина Петровна"     , "Екатерина I (вторая жена)"                    ). 
   mother("Анна Петровна"          , "Екатерина I (вторая жена)"                    ). 
   mother("Елизавета Петровна"     , "Екатерина I (вторая жена)"                    ). 
   mother("Наталья Петровна (I)"   , "Екатерина I (вторая жена)"                    ). 
   mother("Маргарита Петровна"     , "Екатерина I (вторая жена)"                    ). 
   mother("Пётр Петрович"          , "Екатерина I (вторая жена)"                    ). 
   mother("Павел Петрович"         , "Екатерина I (вторая жена)"                    ). 
   mother("Наталья Петровна (II)"  , "Екатерина I (вторая жена)"                    ). 

   father("Дмитрий Алексеевич"     , "Алексей Михайлович").
   father("Евдокия Алексеевна"     , "Алексей Михайлович").
   father("Марфа Алексеевна"       , "Алексей Михайлович").
   father("Алексей Алексеевич"     , "Алексей Михайлович").
   father("Анна Алексеевна"        , "Алексей Михайлович").
   father("Софья Алексеевна"       , "Алексей Михайлович").
   father("Екатерина Алексеевна"   , "Алексей Михайлович").
   father("Мария Алексеевна"       , "Алексей Михайлович").
   father("Фёдор III Алексеевич"   , "Алексей Михайлович").
   father("Феодосия Алексеевна"    , "Алексей Михайлович").
   father("Иван V Алексеевич"      , "Алексей Михайлович").
   father("Евдокия Алексеевна (II)", "Алексей Михайлович").
   father("Пётр I"                 , "Алексей Михайлович").
   father("Наталья Алексеевна"     , "Алексей Михайлович").
   father("Феодора Алексеевна"     , "Алексей Михайлович").
   father("Мария Иоанновна"        , "Иван V Алексеевич" ).
   father("Фодосия Иоанновна"      , "Иван V Алексеевич" ).
   father("Екатерина Иоанновна"    , "Иван V Алексеевич" ).
   father("Анна I Иоанновна"       , "Иван V Алексеевич" ).
   father("Прасковья Иоанновна"    , "Иван V Алексеевич" ).
   father("Пётр II"                , "Алексей Петрович"  ).
   father("Наталья Алексеевна"     , "Алексей Петрович"  ).
   father("Алексей Петрович"       , "Пётр I"            ).
   father("Александр Петрович"     , "Пётр I"            ).
   father("Екатерина Петровна"     , "Пётр I"            ).      
   father("Анна Петровна"          , "Пётр I"            ).      
   father("Елизавета Петровна"     , "Пётр I"            ).      
   father("Наталья Петровна (I)"   , "Пётр I"            ).      
   father("Маргарита Петровна"     , "Пётр I"            ).      
   father("Пётр Петрович"          , "Пётр I"            ).      
   father("Павел Петрович"         , "Пётр I"            ).      
   father("Наталья Петровна (II)"  , "Пётр I"            ).  
   
   parents(X,F,M):- father(X,F), mother(X,M).

   grandMother(X,G):- parents(X,_,M), parents(M,_,G).
   grandMother(X,G):- parents(X,F,_), parents(F,_,G).
 
   aunt(X,A):- parents(X,_,M), parents(M,GF,GM), parents(A,GF,GM), female(A), A<>M.     
   aunt(X,A):- parents(X,F,_), parents(F,GF,GM), parents(A,GF,GM), female(A).     
   aunt(X,A):- parents(X,_,M), parents(M,GF,GM), parents(U,GF,GM), parents(_,U,A).     
   aunt(X, A):- parents(X,F,_), parents(F,GF,GM), parents(U,GF,GM), U<>F, male(U), parents(_,U,A), female(A).

   grandSon(F,Gs):- parents(S,F,_), parents(Gs,S,_), male(Gs).
   grandSon(F,Gs):- parents(D,F,_), parents(Gs,_,D), male(Gs).
   grandSon(M,Gs):- parents(S,_,M), parents(Gs,S,_), male(Gs).
   grandSon(M,Gs):- parents(D,_,M), parents(Gs,_,D), male(Gs).

   grandDaughter(F,Gd):- parents(S,F,_), parents(Gd,S,_), female(Gd).
   grandDaughter(F,Gd):- parents(D,F,_), parents(Gd,_,D), female(Gd).
   grandDaughter(M,Gd):- parents(S,_,M), parents(Gd,S,_), female(Gd).
   grandDaughter(M,Gd):- parents(D,_,M), parents(Gd,_,D), female(Gd).

   greatGrandDaughter(X,Ggd):- female(Ggd), parents(Ggd,_,M), grandDaughter(X,M).
   greatGrandDaughter(X,Ggd):- female(Ggd), parents(Ggd,F,_), grandSon(X, F).

   greatGrandSon(X,Ggs):- male(Ggs), parents(Ggs,_,M), grandDaughter(X,M).
   greatGrandSon(X,Ggs):- male(Ggs), parents(Ggs,F,_), grandSon(X, F).

   greatGrandMother(X,Ggm):- female(Ggm), greatGrandSon(Ggm,X).
   greatGrandMother(X,Ggm):- female(Ggm), greatGrandDaughter(Ggm,X).
                                   
   greatGreatGrandDaughter(X,Gggd):- female(Gggd), parents(Ch,X,_), greatGrandDaughter(Ch,Gggd).
   greatGreatGrandDaughter(X,Gggd):- female(Gggd), parents(Ch,_,X), greatGrandDaughter(Ch,Gggd).

goal
   % пункт (б)
   % aunt(X,A), write("для ", X, ", тётя - ", A), nl.

   % пункт (з)
   % greatGrandMother(X,G), write("для ", X, ", прабабушка - ", G), nl.

   % пункт (к)
   % greatGreatGrandDaughter(X,G), write("для ", X, ", праправнучка - ", G), nl.