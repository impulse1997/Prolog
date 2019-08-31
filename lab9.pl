missionaries_cannibals :-
	StartingState = [1,3,3,0,0],
	depth_first_search([],StartingState,Solution),
	write(Solution),
	nl.

depth_first_search(CurrentPath,CurrentState,Solution) :-
	CurrentState=[-1,0,0,3,3],
	Solution=[CurrentState|CurrentPath].

depth_first_search(CurrentPath,CurrentState,Solution) :-
	successor(CurrentState,NewState),
	not(member(NewState,CurrentPath)),
	depth_first_search([CurrentState|CurrentPath],NewState,Solution).

successor([Side,LM,LC,RM,RC],[NewSide,NewLM,LC,NewRM,RC]) :-
	NewLM is LM-1*Side,
	NewRM is RM+1*Side,
	NewSide is (-1)*Side,
	test(NewLM,LC,NewRM,RC).

successor([Side,LM,LC,RM,RC],[NewSide,NewLM,LC,NewRM,RC]) :-
	NewLM is LM-2*Side,
	NewRM is RM+2*Side,
	NewSide is (-1)*Side,
	test(NewLM,LC,NewRM,RC).

successor([Side,LM,LC,RM,RC],[NewSide,LM,NewLC,RM,NewRC]) :-
	NewLC is LC-1*Side,
	NewRC is RC+1*Side,
	NewLM is LM-1*Side,
	NewRM is RM+1*Side,
	NewSide is (-1)*Side,
	test(NewLM,NewLC,NewRM,NewRC).

successor([Side,LM,LC,RM,RC],[NewSide,LM,NewLC,RM,NewRC]) :-
	NewLC is LC-1*Side,
	NewRC is RC+1*Side,
	NewSide is (-1)*Side,
	test(LM,NewLC,RM,NewRC).

successor([Side,LM,LC,RM,RC],[NewSide,LM,NewLC,RM,NewRC]) :-
	NewLC is LC-2*Side,
	NewRC is RC+2*Side,
	NewSide is (-1)*Side,
	test(LM,NewLC,RM,NewRC).

test(LeftMissionaries,LeftCannibals,RightMissionaries,RightCannibals) :-
	LeftMissionaries>=0,
	LeftCannibals>=0,
	RightMissionaries>=0,
	RightCannibals>=0,
	LeftMissionaries>=LeftCannibals,
	RightMissionaries>=RightCannibals.

test(LeftMissionaries,LeftCannibals,RightMissionaries,RightCannibals) :-
	LeftMissionaries>=0,
	LeftCannibals>=0,
	RightMissionaries>=0,
	RightCannibals>=0,
	LeftMissionaries>=LeftCannibals,
	RightMissionaries=0.

test(LeftMissionaries,LeftCannibals,RightMissionaries,RightCannibals) :-
	LeftMissionaries>=0,
	LeftCannibals>=0,
	RightMissionaries>=0,
	RightCannibals>=0,
	LeftMissionaries=0,
	RightMissionaries>=RightCannibals.
solve :-
breadth_first_search([[[1,3,3,0,0]]],[-1,0,0,3,3],Solution),
write(Solution),
nl.
breadth_first_search([[Node|Path]|_],TargetNode,[Node|Path]) :-
Node=TargetNode.
breadth_first_search([[Node|Path]|RestPaths],TargetNode,Solution) :-
findall([NewNode,Node|Path],
(successor(Node,NewNode),not(member(NewNode,Path))),NewPaths),
append(RestPaths,NewPaths,CurrentPaths),
breadth_first_search(CurrentPaths,TargetNode,Solution).
