parent(john, michael).
parent(susan, michael).
parent(michael, lily).
parent(michael, james).
parent(anna, sophie).

father(X, Y) :- parent(X, Y), male(X).

mother(X, Y) :- parent(X, Y), female(X).

sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

male(john).
male(michael).
male(james).
female(susan).
female(lily).
female(anna).
female(sophie).
