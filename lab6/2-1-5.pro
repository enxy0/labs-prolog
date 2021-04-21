%------------------------------------------------------------------
% ������������ ������ �6
% ������� �2.1-5
% �����: ������ ����� ���������
% ����: 18.04.2021
%------------------------------------------------------------------
% 5. �������� ���������,  ����������, ���� �� � ����� X ����� "a",
% ������� �� �������� ����� ����� ����� "�".
%------------------------------------------------------------------
constants
    ka = "��"

predicates
    find(string)
    test()

clauses
    find(S):- searchstring(S, ka, PI), PI1 = PI - 1, PI1 mod 2 <> 0.
    test:- 
        not(find("���")),
        not(find("���")),
        not(find("����")),
        not(find("������")),
        not(find("����������������")),
        find("���"),
        find("��������"),
        find("��������").
  
goal
    test.