location(monkey, floor).
location(chair, floor).
location(banana, ceiling).

action(pick(Object)) :- location(Object, floor).
action(climb) :- holding(chair).
action(push(Object)) :- holding(chair), location(Object, floor).

state(on_floor(monkey)), state(on_floor(chair)), state(on_ceiling(banana)).

goal(holding(banana)).

update_state(pick(Object), [on_floor(Object)|State]) :- select(on_floor(Object), State, _).
update_state(climb, [holding(chair)|State]) :- select(on_floor(chair), State, _).
update_state(push(Object), [on_floor(Object)|State]) :- select(holding(chair), State, _).

goal_satisfied(State) :- goal(Goal), member(Goal, State).

monkey_banana_problem(State, Actions) :- dfs([State], [], Actions).

dfs([State|_], _, []) :- goal_satisfied(State).
dfs([State|Rest], Visited, [Action|Actions]) :-
    \+ member(State, Visited),
    action(Action),
    update_state(Action, NewState),
    dfs([NewState, State|Rest], [State|Visited], Actions).
