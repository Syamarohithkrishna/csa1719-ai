trusts(john, doe).
trusts(doe, alice).

indirect_trusts(X, Z) :- trusts(X, Y), trusts(Y, Z).

assert_if_new(Fact) :- Fact, !.
assert_if_new(Fact) :- assertz(Fact).

forward :-
    % Apply the rule to infer new knowledge
    (indirect_trusts(X, Z),
     not(trusts(X, Z)),
     assert_if_new(trusts(X, Z)),
     fail;  % Fail to backtrack and find more solutions
     true).

query :- forward, trusts(john, What).

display_trusts :- trusts(X, Y), format("~w trusts ~w~n", [X, Y]), fail; true.

