%------------------------------------------------------------------
% ������������ ������ �1.1
% ������� �2-6
% �����: ������ ����� ���������
% ����: 15.05.2021
%------------------------------------------------------------------
% 6. [�������,2003,�.33]
% ������ �������� ������ � ������.  �� ������� ��������,  �������,
% �������� � ��������. ��������� ������� ������ ������������� �������
% ������ �� ������ �������.
% �������� ��������� ����� �������.  �������� ��������� ����� ���-
% ���. ������ �� ��������� ����� ������. ��� ����� ����� �� �������?
%------------------------------------------------------------------


predicates
    man(symbol)
    profession(symbol)
    rule0(symbol, symbol)
    rule1(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    rule2(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    rule3(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    find_all(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)
    find_task(symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol, symbol)

clauses
    man("��������").
    man("�������").
    man("��������").
    man("��������").

    profession("������").
    profession("������").
    profession("�������").
    profession("������").

    rule0("��������", "������") :- !, fail.
    rule0("�������", "������") :- !, fail.
    rule0("��������", "�������") :- !, fail.
    rule0("��������", "������") :- !, fail.
    rule0(_,_).
    
    % ����������� ���������� � �������� rule1, rule2, rule3
    % D - ������� ������ �����
    % DP - ��������� ������ �����
    % L - ������� ������ �����
    % LP - ��������� ������ �����
    % U - ������� ������ ������
    % UP - ��������� ������ ������
    % L - ������� ������ ������
    % LP - ��������� ������ ������
    rule1(D, DP, L, LP, U, UP, R, RP) :-
        D = "��������", UP = "�������";
        L = "��������", RP = "�������";
        U = "��������", DP = "�������";
        R = "��������", LP = "�������".
    rule2(D, DP, L, LP, U, UP, R, RP) :-
        D = "��������", UP = "������";
        L = "��������", RP = "������";
        U = "��������", DP = "������";
        R = "��������", LP = "������".
    rule3(D, DP, L, LP, U, UP, R, RP) :-
        D = "��������", RP = "������";
        L = "��������", DP = "������";
        U = "��������", LP = "������";
        R = "��������", UP = "������".

    find_all(D, DP, L, LP, U, UP, R, RP) :-
        rule0(D, DP), rule0(L, LP), rule0(U, UP), rule0(R, RP),
        rule1(D, DP, L, LP, U, UP, R, RP),
        rule2(D, DP, L, LP, U, UP, R, RP),
        rule3(D, DP, L, LP, U, UP, R, RP).

    find_task(_, "������", L, LP, _, _, _, _, L, LP).
    find_task(_, _, _, "������", U, UP, _, _, U, UP).
    find_task(_, _, _, _, _, "������", R, RP, R, RP).
    find_task(D, DP, _, _, _, _, _, "������", D, DP).

goal
    D = "��������",
    man(L), man(U), man(R),
    D <> L, D <> U, D <> R, L <> U, L <> R, U <> R,
    profession(DP), profession(LP), profession(UP), profession(RP),
    DP <> LP, DP <> UP, DP <> RP, LP <> UP, LP <> RP, UP <> RP,
    find_all(D, DP, L, LP, U, UP, R, RP),
    write("����� ����� ", D, ", ��������� - ", DP), nl,
    write("����� ����� ", L, ", ��������� - ", LP), nl,
    write("������ ����� ", U, ", ��������� - ", UP), nl,
    write("������ ����� ", R, ", ��������� - ", RP), nl,
    find_task(D, DP, L, LP, U, UP, R, RP, SOLUTION, SOLUTION_PROF),
    write("�������: ����� �� ������� ����� ", SOLUTION, ", ��������� - ", SOLUTION_PROF), nl.
