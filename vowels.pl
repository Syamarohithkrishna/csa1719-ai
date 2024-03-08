sentence([t,h,i,s, ' ', i,s, ' ', m,y, ' ', f,i,r,s,t, ' ', d,e,g,r,e,e, ' ', i,n, ' ', s,a,v,e,e,t,h,a, ' ', s,c,h,o,o,l, ' ', o,f, ' ', e,n,g,i,n,e,e,r,i,n,g]).

vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

print_vowels([]) :- nl.
print_vowels([H|T]) :-
    vowel(H),
    write(H),
    print_vowels(T);
    print_vowels(T).

start :-
    sentence(S),
    print_vowels(S).
