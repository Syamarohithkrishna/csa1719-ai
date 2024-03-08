planet(mercury, rocky, 0.39).
planet(venus, rocky, 0.72).
planet(earth, rocky, 1.00).
planet(mars, rocky, 1.52).
planet(jupiter, gas_giant, 5.20).
planet(saturn, gas_giant, 9.58).
planet(uranus, ice_giant, 19.22).
planet(neptune, ice_giant, 30.05).

rocky_planet(X) :- planet(X, rocky, _).
gas_giant(X) :- planet(X, gas_giant, _).
ice_giant(X) :- planet(X, ice_giant, _).

habitable_zone(X) :-
    planet(X, _, Distance),
    Distance > 0.5,
    Distance < 2.5.
