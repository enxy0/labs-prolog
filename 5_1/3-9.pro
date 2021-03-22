domains
    list = symbol*

predicates
    contains(list, list)
    % equals(list, list)
clauses  
    % equals([], []).
    % equals([], [_]):- fail.
    % equals([_], []):- fail.
    % equals([Ha|Ta], [Hb|Tb]):- Ha = Hb, equals(Ta, Tb); fail.

    contains([], []).
    contains([], [_]).
    contains([_], []):- fail, !.
    % contains([Ha|[]],[Hb|_]):- write("Ha=", Ha, ", Hb=", Hb, "\n"), Ha <> Hb, !, fail.
    % contains([Ha|[]],[Hb|_]):- write("Ha=", Ha, ", Hb=", Hb, "\n"), Ha = Hb.
    contains([Ha|Ta], [Hb|Tb]):- Ha = Hb, write("Ha=", Ha, ", Hb=", Hb, "\n"), contains(Ta, Tb), !; contains([Ha|Ta], Tb), !; fail.

goal
    contains(["1", "2", "3"], ["1","2","3","4","5","6","7", "8", "9", "10"]).
    % contains(["4", "5", "6"],  ["1","2","3","4","5","6","7", "8", "9", "10"]),
    % contains(["9"],  ["1","2","3","4","5","6","7", "8", "9", "10"]).
    % contains(["9", "10"],  ["1","2","3","4","5","6","7", "8", "9", "10"]),
    % not(contains(["1", "2", "4"],  ["1","2","3","4","5","6","7", "8", "9", "10"])),
    % not(contains([],  ["1","2","3","4","5","6","7", "8", "9", "10"])),
    % not(contains(["3", "7"], ["1","2","3","4","5","6","7", "8", "9", "10"])).
