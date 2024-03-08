edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 3).
edge(c, e, 4).
edge(d, f, 2).
edge(e, f, 1).

best_first_search(Start, Goal, Path) :-
    best_first_search_helper([[(Start, 0)]], Goal, ReversePath),
    reverse(ReversePath, Path).

best_first_search_helper([[(Current, _)|Path]|_], Goal, [(Current, Cost)|Path]) :-
    Current = Goal,
    !.

best_first_search_helper([Path|Paths], Goal, FinalPath) :-
    expand(Path, NewPaths),
    append(Paths, NewPaths, CombinedPaths),
    sort_paths(CombinedPaths, SortedPaths),
    best_first_search_helper(SortedPaths, Goal, FinalPath).

expand([(Current, Cost)|Path], NewPaths) :-
    findall([(Next, NewCost), (Current, Cost)|Path],
            (edge(Current, Next, StepCost),
             \+ member((Next, _), Path),
             NewCost is Cost + StepCost),
            NewPaths).

sort_paths(Paths, SortedPaths) :-
    predsort(compare_paths, Paths, SortedPaths).

compare_paths(Order, Path1, Path2) :-
    path_cost(Path1, Cost1),
    path_cost(Path2, Cost2),
    compare(Order, Cost1, Cost2).

path_cost(Path, Cost) :-
    last(Path, (_, Cost)).
