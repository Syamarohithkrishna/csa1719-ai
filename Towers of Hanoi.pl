move(1, X, Y, _) :-
    write('Move top disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl.

hanoi(N, X, Y, Z) :-
    N > 0,
    M is N-1,
    hanoi(M, X, Z, Y),  % Move N-1 disks from X to Z, using Y as auxiliary.
    move(1, X, Y, _),   % Move the nth disk from X to Y.
    hanoi(M, Z, Y, X).  % Move N-1 disks from Z to Y, using X as auxiliary.

solve_hanoi(N) :-
    hanoi(N, left, right, center).
