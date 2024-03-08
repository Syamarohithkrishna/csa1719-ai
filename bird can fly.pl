can_fly(eagle).
can_fly(robin).
can_fly(parrot).

cannot_fly(ostrich).
cannot_fly(penguin).

is_flyable(Bird) :-
    can_fly(Bird),
    write(Bird),
    write(' can fly.'),
    nl.

is_flyable(Bird) :-
    cannot_fly(Bird),
    write(Bird),
    write(' cannot fly.'),
    nl.

is_flyable(Bird) :-
    \+ can_fly(Bird),
    \+ cannot_fly(Bird),
    write('It is unknown whether '),
    write(Bird),
    write(' can fly.'),
    nl.
