predicates
    pow(integer,integer,integer)
   
clauses
    pow(_, 0, 1).        
    pow(X, N, R):- N > 0, N1 = N - 1, pow(X, N1, R1), R = X * R1.       
goal
    pow(5, 3, R).