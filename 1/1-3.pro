% ---------------------------------------------
% ������������ ������ �1                       
% ������� �1_3                      
% �����: ������ ����� ���������     
% ����: 09.02.2021           
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
   book("�� �.","������������� �����-�������","�:","���",1993).
   book("������ �.","��������� ���������������� �� ����� ������",
        "�:","���",1990).
   book("������ �.","���������������� �� ����� ������ ��� \
        �������������� ����������", "�", "���", 1990).
   book("�������� �.","��� �� ���������� ��� �����?","�:",
        "�����",1981).
   book("�������� �.","����� ��� �������������","�:","���",1982).

   books(Author):- book(Author,Title,_,_,_),write(Title).
        
   author(Title):- book(Author,Title,_,_,_),write(Author).
        
   book_of_year(Year):- book(Author,Title,_,_,Year),
                        write(Author,Title).
        
   book_of_publisher(Publisher,Year):-
                        book(Author,Title,_,Publisher,Year),
                        write(Author,Title).
goal
   % nl - new line
   % ��������� ������� ��������� �������� ����������:
   books(Author),nl,nl, % ������� �������� �����, � ����� �������� - �� ������
   author(Book),nl,nl, % ������� ������ �����, � ����� �������� - �������� �����
   book_of_year(Year),nl,nl, % ������� ������ � �������� �����, � ����� �������� - ���
   book_of_publisher(Publisher,Year) % ������� ������ � �������� �����, � ����� ��������� �������� � ���.
   .
