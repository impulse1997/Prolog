% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

parent(andrew,george).

class('Vehicle').
class('EnginePoweredVehicle').
class('HumanPoweredVehicle').
class('Car').
class('Bus').
class('Bicycle').

inherits('EnginePoweredVehicle','Vehicle').

inherits('HumanPoweredVehicle','Vehicle').

inherits('Car','EnginePoweredVehicle').
inherits('Bus','EnginePoweredVehicle').
inherits('Bicycle','HumanPoweredVehicle').
member('numberOFSeats',public,int,'EnginePoweredVehicle').
member('engineCapacity',protected,float,'EnginePoweredVehicle').
member('nameOfOwner',private,'java.lang.String','Car').
member('nameOfOwnerCompany',private,'java.lang.String','Bus').
member('nameOfGears',public,int,'Bicycle').



brother(X,Y) :-  inherits(X,Z),inherits(Y,Z), not(X=Y).
ancestor(X,Y) :-inherits(X,Y);inherits(X,Z),inherits(Z,Y).
descendent(X,Y) :- inherits(Y,X); inherits(Y,Z),inherits(Z,X).
containPublicMembers(X) :- member(_,public,_,X).
abs(X,Y) :- Y is  X , X > 0; Y is -X , X <0.
fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N,F) :- N1 is N-1, N2 is N-2, fibonacci(N1,F1),fibonacci(N2,F2), F is F1+F2.
gcd(A,B,D) :- D is A, B =:=0; A1 is B, B1 is A mod B, gcd(A1,B1,D).
gcd1(A,B,D) :- D is A, B =:=A ; B1 is B - A, gcd1(A,B1,D), A < B; A1 is A- B ,
    gcd1(A1,B,D), A>B .
evaluating(Value,Value) :- number(Value).
evaluating(Expression1+Expresssion2,Value) :- evaluating(Expression1,X),evaluating(Expresssion2,Y), plus(X,Y,Value).
evaluating(E1-E2,Value) :- evaluating(E1,X),evaluating(E2,Y), plus(Value,Y,X).
