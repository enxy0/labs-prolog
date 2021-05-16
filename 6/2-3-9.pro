%------------------------------------------------------------------
% ������������ ������ �6
% ������� �2.3-9
% �����: ������ ����� ���������
% ����: 18.04.2021
%------------------------------------------------------------------
% 9. �������� ��������� ��� ������������ �� ����� X ���� ���� "�",
% ����� �������� ����� ����� "�".
%------------------------------------------------------------------
predicates 
    remove_r(string,string) 
    test 

clauses 
    remove_r("",""). 
    remove_r(S,R):- searchstring(S, "ap", P), 
        frontstr(P,S,X1,X2),  % X1 ����� �� ����� 'a', X2 ����� � ������ 'p' 
        frontchar(X2,'p',X3), % X3 �� �������� '�'
        concat(X1,X3,R1),     % ���������� ������ X1 � X3
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
 