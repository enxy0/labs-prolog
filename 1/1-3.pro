% ---------------------------------------------
% Лабораторная работа №1                       
% Задание №1_3                      
% Автор: Бушуев Никта Федорович     
% Дата: 09.02.2021           
% ---------------------------------------------

domains
   author,book,title,town,publisher=symbol
   year=integer
predicates
   nondeterm book(author,title,town,publisher,year)
   nondeterm books(author)
   nondeterm author(title)
   nondeterm book_of_year(year)
   nondeterm book_of_publisher(publisher,year)
clauses
   book("Ин Ц.","Использование Турбо-Пролога","М:","Мир",1993).
   book("Шапиро Э.","Искусство программирования на языке Пролог",
        "М:","Мир",1990).
   book("Братко И.","Программирование на языке Пролог для \
        искусственного интеллекта", "М", "Мир", 1990).
   book("Смаллиан Р.","Как же называется эта книга?","М:",
        "Наука",1981).
   book("Уэзерелл Ч.","Этюды для программистов","М:","Мир",1982).

   books(Author):- book(Author,Title,_,_,_),write(Title).
        
   author(Title):- book(Author,Title,_,_,_),write(Author).
        
   book_of_year(Year):- book(Author,Title,_,_,Year),
                        write(Author,Title).
        
   book_of_publisher(Publisher,Year):-
                        book(Author,Title,_,Publisher,Year),
                        write(Author,Title).
goal
   % nl - new line
   % Просходит перебор различный значений предикатов:
   books(Author),nl,nl, % Выводит название книги, а затем параметр - ее автора
   author(Book),nl,nl, % Выводит автора книги, а затем параметр - название книги
   book_of_year(Year),nl,nl, % Выводит Автора и название книги, а затем параметр - год
   book_of_publisher(Publisher,Year) % Выводит Автора и название книги, а затем параметры Издателя и Год.
   .
