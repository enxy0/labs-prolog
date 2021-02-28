%-----------------------------------------------------------------
% ������������ ������ �2                       
% ������� �2-3
% �����: ������ ����� ���������     
% ����: 28.02.2021 
%-----------------------------------------------------------------
% 3*. (�� ���,2009,�8) ������� � ������� ����� Prolog, ����� 
% ���������� ��������� ����������� ��������� A&~(~BvC):
% (1) ~Av~Bv~C (2) A&~B&~C (3) A&B&~C (4) A&~B&C
%-----------------------------------------------------------------

domains
    bool=integer

predicates
    not_(bool, bool)
    and_(bool, bool, bool)
    or_(bool, bool, bool)
    
    expr(bool, bool, bool, bool) % �������� ��������� A&~(~BvC)

    first(bool, bool, bool, bool) % (1) ~Av~Bv~C
    second(bool, bool, bool, bool) % (2) A&~B&~C
    third(bool, bool, bool, bool) % (3) A&B&~C (���������� �������)
    fourth(bool, bool, bool, bool) % (4) A&~B&C

    is_first
    is_second
    is_third
    is_fourth
    find_expr(bool)

clauses
    not_(1, 0).
    not_(0, 1).

    and_(0, 0, 0).
    and_(0, 1, 0).
    and_(1, 0, 0).
    and_(1, 1, 1).

    or_(0, 0, 0).
    or_(0, 1, 1).
    or_(1, 0, 1).
    or_(1, 1, 1).

    expr(A, B, C, R):-
        not_(B, NOT_B),
        or_(NOT_B, C, NOT_B_OR_C),
        not_(NOT_B_OR_C, RIGHT_EXPR),
        and_(A, RIGHT_EXPR, R).

    first(A, B, C, R):-
        not_(A, NOT_A),
        not_(B, NOT_B),
        not_(C, NOT_C),
        or_(NOT_A, NOT_B, NOT_A_OR_NOT_B),
        or_(NOT_A_OR_NOT_B, NOT_C, R).

    second(A, B, C, R):-
        not_(B, NOT_B),
        not_(C, NOT_C),
        and_(A, NOT_B, A_AND_NOT_B),
        and_(A_AND_NOT_B, NOT_C, R).

    third(A, B, C, R):-
        not_(C, NOT_C),
        and_(A, B, A_AND_B),
        and_(A_AND_B, NOT_C, R).

    fourth(A, B, C, R):-
        not_(B, NOT_B),
        and_(A, NOT_B, A_AND_NOT_B),
        and_(A_AND_NOT_B, C, R).

    is_first:-
        expr(A, B, C, R1),
        first(A, B, C, R2),
        R1 <> R2.

    is_second:-
        expr(A, B, C, R1),
        second(A, B, C, R2),
        R1 <> R2.

    is_third:-
        expr(A, B, C, R1),
        third(A, B, C, R2),
        R1 <> R2.

    is_fourth:-
        expr(A, B, C, R1),
        fourth(A, B, C, R2),
        R1 <> R2.

    find_expr(R):-
        not(is_first), R = 1; 
        not(is_second), R = 2;  
        not(is_third), R = 3;
        not(is_fourth), R = 4.

goal
    find_expr(R), write("���������� �������: ", R), nl.