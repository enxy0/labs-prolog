%------------------------------------------------------------------
% ������������ ������ �7
% ������� �6
% �����: ������ ����� ���������
% ����: 20.04.2021
%------------------------------------------------------------------
% 6. ��� ���������� ���� f,  ���������� �� ����� ���� �����������.
% ����������,  �������� �� ��� ������ ������� ����� �������. ���� ��-
% ��� - "��",  �� ����������,  �������� �� ������ �����, ������������
% �� ���� ����.
%------------------------------------------------------------------
domains
    file = fd
  
predicates
    read_write_lines(integer)
    repfile(file)
    get_number(string, integer)
    parity(integer)
clauses
    repfile(_).
    repfile(F):- not(eof(F)), repfile(F).
  
    parity(N):- N mod 2 = 0, write("����� ", N, " �������� ������"), nl, !.
    parity(N):- write("����� ", N, " �������� ��������"), nl.

    read_write_lines(R):- repfile(fd), readln(Ln), 
        substring(Ln, 1, 1, H1),
        substring(Ln, 2, 1, H2),
        concat(H1, H2, N), !,
        str_int(N, R), parity(R).
  
    get_number(Name, R):- not(existfile(Name)), write("File ", Name, " not found."), nl, !, fail.
    get_number(Name, R):- openread(fd, Name), readdevice(fd),
        read_write_lines(R), closefile(fd).
  
goal
    get_number("..\\6-file1.txt", R).