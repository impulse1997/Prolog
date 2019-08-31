% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

inserting(X,[],[X]).
inserting(X,[H|T],R) :- append([X],[H],R1), append(R1,T,R).
inserting(X,[H|T],R) :- inserting(X,T,R1), append([H],R1,R).

delete_one(X,[X],[]).
delete_one(X,[X|T],T).
delete_one(X,[H|T],R) :- delete_one(X,T,R1), append([H],R1,R).

delete_all(X,[X],[]).
delete_all(X,[X|T],R):- delete_all(X,T,R),!.
delete_all(X,[H|T],L) :- delete_all(X,T,L1),append([H],L1,L).


range(A, A, [A]) :- !.
range(A, B, [A|L]) :- A1 is A+1, range(A1, B, L).

rotate([X], _, [X|[]]) :- !.
rotate([H|T], 1, [H1|T1]) :- rotate(T, 1, [H1|T2]), append([H], T2, T1), !.
rotate(L, N, L1) :- rotate(L, 1, L2), N1 is N-1, N1 > 0, rotate(L2, N1, L1).


flatten_list([], []).
flatten_list([H|T], L) :- is_list(H), flatten_list(H, L1), flatten_list(T, L2), append(L1, L2, L), !.
flatten_list([H|T], L) :- flatten_list(T, L1), append([H], L1, L).



inverting([], []).
inverting([H], [H]) :- !.
inverting([H|T], [H1|T1]) :- inverting(T, [H1|T2]), append(T2, [H], T1).



duplicate([], []) :- !.
duplicate([H|T], [H1|T1]) :- H1 = [H, H], duplicate(T, T1).
