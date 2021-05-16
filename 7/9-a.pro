%------------------------------------------------------------------
% Лабораторная работа №7
% Задание №9-a
% Автор: Бушуев Никта Федорович
% Дата: 20.04.2021
%------------------------------------------------------------------
% 9. Дан символьный файл f. (а) Подсчитайте число вхождений в файл
% сочетаний "ab";
%------------------------------------------------------------------
domains
    file = fd
  
predicates
    read_write_lines(integer)
    count_ab(string, integer)
    file_count(string, integer)
  
clauses
    count_ab(Ln, 0):- not(searchstring(Ln, "ab", _)).
    count_ab(Ln, R):- searchstring(Ln, "ab", P), P1 = P + 1, 
        frontstr(P1, Ln, _, S2), 
        count_ab(S2, Rr),
        R = Rr + 1.
  
    read_write_lines(0):- eof(fd), !.
    read_write_lines(R):- readln(Ln), count_ab(Ln, Rn), read_write_lines(Rr), R = Rn + Rr.
  
    file_count(Name, _):- not(existfile(Name)), write("File ", Name, " not found."), nl, !, fail.
    file_count(Name, R):- openread(fd, Name), readdevice(fd), read_write_lines(R), closefile(fd).
 
goal
    file_count("..\\9-a-file.txt", R).