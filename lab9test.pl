% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.
%

:-dynamic(node/1).
:-dynamic(edge/3).

menu:- write("1. Add node \n"),
    write("2. Add edge \n"),
    write("3. Remove node \n"),
    write("4. remove edge \n"),
    write("5. show graph \n"),
    write(" 6. Exit \n "),
    read(X),menu(X), !.
menu(6) :- !.
menu(1) :- write("Adauga node(X)"),
    read(X), not(node(X)), assert(node(X)), menu, !.

menu(2) :- write("adauga edge(C,Y,Z)"),
     read(C), read(Y), read(Z),
     node(C),
     node(Y),
     assert(edge(C,Y,Z)),
     menu, !.
menu(3) :- write("sterge node(X)"),
    read(X) ,
    retract(node(X)),
    retractall(edge(X,_,_)),
    retractall(edge(_,X,_)),
    menu, !.
menu(4) :- write("Sterge edge(C,Y,Z)"),
    read(C), read(Y), read(Z),
     retract(edge(C,Y,Z)),
     menu, !.
menu(5) :- findall(X,node(X),Rez),
write("Noduri"),
write(Rez),
  write(" "),
  findall([C,Y,Z],edge(C,Y,Z),Rez1),
  write("Edge"),
  write(Rez1),
  write(" "),
  menu, !.































:-dynamic(cuvant/1).
functie(C,Cuv,Dim):- atom_chars(C,C1),nth1(1,C1,C2),Cuv=C2,proper_length(C1,Dim).

meniu:- write("1. Adauga cuvant\n"),
    write("2. Sterge cuvant\n"),
    write("3. Afisare\n"),
    write("4. Afisare cuv litere L si dim =cu x\n"),
    write("5.?\n"),
    write("6. Exit\n"),read(X),
    meniu(X), !.
meniu(6) :- !.
meniu(1) :- write(" cuvant"),
read(X),
    not(cuvant(X)),
    assert(cuvant(X)),
    meniu, !.
meniu(2):- write("sterge cuvant"),
    read(X),
    retract(cuvant(X)),meniu, !.
meniu(3) :- findall(X, cuvant(X), Rez),
    write(Rez),
    write(" "),meniu,!.
meniu(4) :-

    read(Cuv),
    read(Dim),
    cuvant(X),
    findall(X, functie(X,Cuv,Dim), Rez),
    write(Rez).




solve(S):- S=[_,_,_,_,_],
    nationality(O1,englishman),color(O1,red),member(O1,S),
    color(O2,green),drink(O2,coffee),member(O2,S),
	nationality(O3,italian),drink(O3,tea),member(O3,S),
	color(O4,yellow),cigarette(O4,kent),member(O4,S),
	drink(O5,milk),middle(O5,S),
	nationality(O6,russian),leftmost(O6,S),
	cigarette(OA7,marlboro),pet(OB7,fox),near(OA7,OB7,S),
	cigarette(OA8,kent),pet(OB8,horse),near(OA8,OB8,S),
	drink(O9,juice),cigarette(O9,pall_mall),member(O9,S),
	nationality(O10,japanese),cigarette(O10,assos),member(O10,S),
	nationality(OA11,russian),color(OB11,blue),near(OA11,OB11,S),
	nationality(O12,spanish),pet(O12,dog),member(O12,S),
	pet(O13,snake),cigarette(O13,camel),member(O13,S),
	color(OA14,gray),color(OB14,green),near(OA14,OB14,S),
	pet(OA15,cat),drink(OB15,vodka),lateral(OA15,S),lateral(OB15,S).

lateral(X,[X,_,_,_,_]).
lateral(X,[_,_,_,_,X]).
color([Color,_,_,_,_],Color).
nationality([_,Nationality,_,_,_],Nationality).
drink([_,_,Drink,_,_],Drink).
cigarette([_,_,_,Cigarette,_],Cigarette).
pet([_,_,_,_,Pet],Pet).
leftmost([X,_,_,_,_],X).
righmost([_,_,_,_,X],X).
middle([_,_,X,_,_],X).
left(A,B,S) :- append(_,[A,B|_],S).
near(A,B,S) :- left(A,B,S).
near(A,B,S) :- left(B,A,S).



distance(A,B,S,D) :- nth0(Ia,S,A),nth0(Ib,S,B),D= abs(Ia-Ib).
solve1(S):- S=[_,_,_,_],distance(a,c,S,D1),distance(c,d,S,D2),D1>D2,distance(b,c,S,D3),distance(b,d,S,D4),D3<D4.


:-dynamic(masini/2).
masini(audi,2010).
masini(bmw,2019).
fct(masini(_,X),Z):- X>Z.
fct2(X,S):- S is S+X, X>=S/2.
menu2:- read(X),menu2(X),!.
menu2(1):-

    findall(Marca,(masini(Marca,An),S is S+An,An>S//2),List),
    write(List), menu2,!.

d1(S) :- S=[p,t].
d2(S):- S=[t,p].
d3(S):- d1(S),not(d2(S)).
d3(S):-not(d1(S)),d2(S).

solve2(S):- S=[_,_], member(p,S),member(t,S), d3(S).

























