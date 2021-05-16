%------------------------------------------------------------------
% Лабораторная работа №7
% Задание №3
% Автор: Бушуев Никта Федорович
% Дата: 20.04.2021
%------------------------------------------------------------------
% 3. Даны символьные файлы f1 и f2.  Поменяйте содержимое двух за-
% данных файлов:  перепишите с сохранением порядка следования  компо-
% ненты  файла f1 в файл f2,  а компоненты файла f2 - в файл f1.  Ис-
% пользуйте вспомогательный файл h.
%------------------------------------------------------------------
constants
    temp_file_name = "..\\3-h.txt"

domains
    file = file1 ; file2 ; h

predicates
    swap(string, string)
    repfile(file)
    read_write_lines(file)
    write_file_to_file(file, string, file, string)
clauses
    repfile(_).
    repfile(F):- not(eof(F)), repfile(F).

    read_write_lines(F):- repfile(F), readln(Ln), write(Ln), nl, fail.
    read_write_lines(_).

    write_file_to_file(F1, FName1, F2, FName2):- 
        openread(F1, FName1), openwrite(F2, FName2),
        readdevice(F1), writedevice(F2),
        read_write_lines(F1),
        closefile(F1), closefile(F2).

    swap(Name1, Name2):- 
        not(existfile(Name1)), write("File ", Name1, " not found."), nl, fail; 
        not(existfile(Name2)), write("File ", Name2, " not found."), nl, fail.
    swap(Name1, Name2):-
        write_file_to_file(file1, Name1, h, temp_file_name), !,
        write_file_to_file(file2, Name2, file1, Name1), !,
        write_file_to_file(h, temp_file_name, file2, Name2), !,
        deletefile(temp_file_name).
                       
goal
    swap("..\\3-file1.txt", "..\\3-file2.txt").