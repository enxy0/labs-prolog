% ---------------------------------------------
% ������������ ������ �1                       
% ������� �1_2                      
% �����: ������ ����� ���������     
% ����: 09.02.2021           
% ---------------------------------------------

domains
   child = symbol
   age   = integer

predicates
   nondeterm pupil(child,age)

clauses
   pupil(peter, 9).
   pupil(paul, 10).
   pupil(chris, 9).
   pupil(susan, 9).

goal
   pupil(Person1, 9), pupil(Person2, 9), Person1 <> Person2.
   % "<>" - ���� ��������� "�� �����".

   /* 
   ���� - ����������� ����� �������� 9-������� �������� 
   (�� ����������� ����� ����). ������� ���������� ������ ������,
   ������� �������� 9, ����� ��� ���� ������������ ���������.

   ���������:
      Person1=peter, Person2=chris
      Person1=peter, Person2=susan
      Person1=chris, Person2=peter
      Person1=chris, Person2=susan
      Person1=susan, Person2=peter
      Person1=susan, Person2=chris
      6 Solutions
   /*