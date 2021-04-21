%------------------------------------------------------------------
% ������������ ������ �7
% ������� �4-1
% �����: ������ ����� ���������
% ����: 20.04.2021
%------------------------------------------------------------------
% 4. ��� ���������� ���� f. �������� ���� g, ������������ �� �����
% f ������� ���� ���:  (1) �������� ���� ����������� ����������
%------------------------------------------------------------------
domains
    file = f ; g
  
predicates
    read_write_lines(file)
    repfile(file)
    capitalize(string, string)
  
clauses
    repfile(_).
    repfile(F):- not(eof(F)), repfile(F).
  
    read_write_lines(F):- repfile(F), readln(Ln), upper_lower(LnInUpper, Ln), write(LnInUpper), nl, fail.
    read_write_lines(_).
  
    capitalize(Name1, Name2):- existfile(Name1), !,
        openread(f, Name1), openwrite(g, Name2),
        readdevice(f), writedevice(g),
        read_write_lines(f),
        closefile(f), 
        closefile(g).
  capitalize(_, _):- fail.
  
goal
    capitalize("..\\4-1-file1.txt", "..\\4-1-file2.txt").