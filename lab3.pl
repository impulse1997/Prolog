% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

abs(X,Y) :-  Y is X ,X>0;
             Y is -X, X=<0.

fibonacci(0,0):-!.

fibonacci(1,1) :-!.

fibonacci(N,F) :- N1 is N-1, N2 is N-2, fibonacci(N1,A), fibonacci(N2,B), F is A+B.


gcd(A,B,D) :- B=\=0, A1 is B, B2 is A mod B,  gcd(A1,B2,D).
gcd(A,B,D) :- B =:=0, D is A.

gcd2(A,B,D) :- B < A, B1 is  A - B , gcd2(B1,B,D).
gcd2(A,B,D) :- B > A, B1 is  B - A , gcd2(A,B1,D).
gcd2(A,B,D) :- A =:=B, D is A.

eval(Expression,Expression) :- number(Expression).
eval(Expression1+Expression2,Value) :- eval(Expression1,X),eval(Expression2,Y),plus(X,Y,Value).
eval(Expression1-Expression2,Value) :- eval(Expression1,X),eval(Expression2,Y),plus(Value,Y,X).

