%-------------------------------------------
% ������������ ������ �2                       
% ������� �2-2-1
% �����: ������ ����� ���������     
% ����: 28.02.2021 
%-----------------------------------------------------------------
% 2*. �������� ���������,  � ������� ������� ����������,  ����� ��
% ��������� �����������:
%    (1) ~(A&~(B&C))=~(A&~B)&~(A&~C);
%-----------------------------------------------------------------

domains
    bool=integer

predicates
    not_(bool, bool)
    and_(bool, bool, bool)
    eq_(bool, bool, bool)
    expression(bool, bool, bool, bool)

clauses
    not_(1, 0).
    not_(0, 1).

    and_(0, 0, 0).
    and_(0, 1, 0).
    and_(1, 0, 0).
    and_(1, 1, 1).
    
    eq_(0, 0, 1).
    eq_(0, 1, 0).
    eq_(1, 0, 0).
    eq_(1, 1, 1).

    expression(A, B, C, R):-
        % ����� ����� ���������, ��������� ���������
        % ������� � ������ �����������
        and_(B, C, B_AND_C),
        not_(B_AND_C, NOT_B_AND_C),
        and_(A, NOT_B_AND_C, A_AND_NOT_B_AND_C),
        not_(A_AND_NOT_B_AND_C, LEFT_EXPR),

        % ������ ����� ���������
        not_(B, NOT_B),
        and_(A, NOT_B, A_AND_NOT_B),
        not_(A_AND_NOT_B, NOT_A_AND_NOT_B),
        not_(C, NOT_C),
        and_(A, NOT_C, A_AND_NOT_C),
        not_(A_AND_NOT_C, NOT_A_AND_NOT_C),
        and_(NOT_A_AND_NOT_B, NOT_A_AND_NOT_C, RIGHT_EXPR),

        % ��������� ������������
        eq_(LEFT_EXPR, RIGHT_EXPR, R).

goal
    % ��������� � ������� ��������� ���������� ������:
    % link: https://programforyou.ru/calculators/postroenie-tablitci-istinnosti-sknf-sdnf
    % 0, 0, 0 = 1
    % 0, 0, 1 = 1
    % 0, 1, 0 = 1
    % 0, 1, 1 = 1
    % 1, 0, 0 = 1
    % 1, 0, 1 = 1
    % 1, 1, 0 = 1
    % 1, 1, 1 = 1
    expression(A, B, C, R).