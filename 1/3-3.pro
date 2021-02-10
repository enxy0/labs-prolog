% ---------------------------------------------
% ������������ ������ �1                       
% ������� �3_3(�, �, �)                        
% �����: ������ ����� ���������     
% ����: 09.02.2021           
% ---------------------------------------------

domains
   name=symbol

predicates
   nondeterm male(name)                           %   �������(�������)
   nondeterm female(name)                         %   �������(�������)
   nondeterm father(name, name)                   %   ����(�������,����)
   nondeterm mother(name, name)                   %   ����(�������,����)
   nondeterm parents(name, name, name)            %   �������� (�������, ����, ����)
   nondeterm grandMother(name, name)              %   �������
   nondeterm aunt(name, name)                     %   ����
   nondeterm grandSon(name, name)                 %   ����
   nondeterm grandDaughter(name, name)            %   ������
   nondeterm greatGrandDaughter(name, name)       %   ���������
   nondeterm greatGrandSon(name, name)            %   �������
   nondeterm greatGrandMother(name, name)         %   ����������
   nondeterm greatGreatGrandDaughter(name, name)  %   ������������

clauses
   male("������� ����������").
   male("������� ����������").
   male("������� ����������").
   male("Ը��� III ����������").
   male("���� V ����������"). 
   male("����-�������� ����������-���������� (���)"). 
   male("�������-��������� ����������� (���)"). 
   male("ϸ�� I"). 
   male("������� ��������"). 
   male("ϸ�� II"). 
   male("��������� ��������").
   male("����-������� ����������� (���)").
   male("ϸ�� ��������").
   male("����� ��������").

   female("����� ���������� ������������").
   female("������� ����������").
   female("����� ����������").
   female("���� ����������").
   female("����� ����������").
   female("��������� ���������").
   female("����� ����������").
   female("������ �������� ��������� (������ ����)").
   female("����� ��������� ���������  (������ ����)").
   female("�������� ����������").
   female("��������� Ը������� ��������� (����)").
   female("����� ���������").
   female("������� ���������").
   female("��������� ���������").
   female("���� I ���������").
   female("��������� ���������").
   female("������� ���������� (II)").
   female("������� ���������� ��������� (������ ����)").
   female("������� �������� (������ ����)").
   female("�������� ����������-������������������ (����)").
   female("������� ����������").
   female("��������� I (������ ����)").
   female("��������� ��������").
   female("���� ��������").
   female("��������� ��������").
   female("������� �������� (I)").
   female("��������� ��������").
   female("������� �������� (II)").
   female("������� ����������").
   female("������� ����������").

   mother("������� ����������"     , "����� ���������� ������������ (������ ����)"  ).
   mother("������� ����������"     , "����� ���������� ������������ (������ ����)"  ).
   mother("����� ����������"       , "����� ���������� ������������ (������ ����)"  ).
   mother("������� ����������"     , "����� ���������� ������������ (������ ����)"  ).
   mother("���� ����������"        , "����� ���������� ������������ (������ ����)"  ).
   mother("����� ����������"       , "����� ���������� ������������ (������ ����)"  ).
   mother("��������� ����������"   , "����� ���������� ������������ (������ ����)"  ).
   mother("����� ����������"       , "����� ���������� ������������ (������ ����)"  ).
   mother("Ը��� III ����������"   , "����� ���������� ������������ (������ ����)"  ).
   mother("�������� ����������"    , "����� ���������� ������������ (������ ����)"  ).
   mother("���� V ����������"      , "����� ���������� ������������ (������ ����)"  ).
   mother("������� ���������� (II)", "����� ���������� ������������ (������ ����)"  ).
   mother("ϸ�� I"                 , "������� ���������� ��������� (������ ����)"   ).
   mother("������� ����������"     , "������� ���������� ��������� (������ ����)"   ).
   mother("������� ����������"     , "������� ���������� ��������� (������ ����)"   ).
   mother("����� ���������"        , "��������� Ը������� ��������� (����)"         ).
   mother("������� ���������"      , "��������� Ը������� ��������� (����)"         ).
   mother("��������� ���������"    , "��������� Ը������� ��������� (����)"         ).
   mother("���� I ���������"       , "��������� Ը������� ��������� (����)"         ).
   mother("��������� ���������"    , "��������� Ը������� ��������� (����)"         ).
   mother("������� ��������"       , "������� �������� (������ ����)"               ).
   mother("��������� ��������"     , "������� �������� (������ ����)"               ).
   mother("ϸ�� II"                , "�������� ����������-������������������ (����)").
   mother("������� ����������"     , "�������� ����������-������������������ (����)").
   mother("��������� ��������"     , "��������� I (������ ����)"                    ). 
   mother("���� ��������"          , "��������� I (������ ����)"                    ). 
   mother("��������� ��������"     , "��������� I (������ ����)"                    ). 
   mother("������� �������� (I)"   , "��������� I (������ ����)"                    ). 
   mother("��������� ��������"     , "��������� I (������ ����)"                    ). 
   mother("ϸ�� ��������"          , "��������� I (������ ����)"                    ). 
   mother("����� ��������"         , "��������� I (������ ����)"                    ). 
   mother("������� �������� (II)"  , "��������� I (������ ����)"                    ). 

   father("������� ����������"     , "������� ����������").
   father("������� ����������"     , "������� ����������").
   father("����� ����������"       , "������� ����������").
   father("������� ����������"     , "������� ����������").
   father("���� ����������"        , "������� ����������").
   father("����� ����������"       , "������� ����������").
   father("��������� ����������"   , "������� ����������").
   father("����� ����������"       , "������� ����������").
   father("Ը��� III ����������"   , "������� ����������").
   father("�������� ����������"    , "������� ����������").
   father("���� V ����������"      , "������� ����������").
   father("������� ���������� (II)", "������� ����������").
   father("ϸ�� I"                 , "������� ����������").
   father("������� ����������"     , "������� ����������").
   father("������� ����������"     , "������� ����������").
   father("����� ���������"        , "���� V ����������" ).
   father("������� ���������"      , "���� V ����������" ).
   father("��������� ���������"    , "���� V ����������" ).
   father("���� I ���������"       , "���� V ����������" ).
   father("��������� ���������"    , "���� V ����������" ).
   father("ϸ�� II"                , "������� ��������"  ).
   father("������� ����������"     , "������� ��������"  ).
   father("������� ��������"       , "ϸ�� I"            ).
   father("��������� ��������"     , "ϸ�� I"            ).
   father("��������� ��������"     , "ϸ�� I"            ).      
   father("���� ��������"          , "ϸ�� I"            ).      
   father("��������� ��������"     , "ϸ�� I"            ).      
   father("������� �������� (I)"   , "ϸ�� I"            ).      
   father("��������� ��������"     , "ϸ�� I"            ).      
   father("ϸ�� ��������"          , "ϸ�� I"            ).      
   father("����� ��������"         , "ϸ�� I"            ).      
   father("������� �������� (II)"  , "ϸ�� I"            ).  
   
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
   % ����� (�)
   % aunt(X,A), write("��� ", X, ", ��� - ", A), nl.

   % ����� (�)
   % greatGrandMother(X,G), write("��� ", X, ", ���������� - ", G), nl.

   % ����� (�)
   % greatGreatGrandDaughter(X,G), write("��� ", X, ", ������������ - ", G), nl.