% Depth-limited search (IDS with increasing depth)
ids :- 
    start(State), 
    length(Moves, N),         % Moves will be the list of moves made to solve the puzzle.
    dfs([State], Moves, Path), !, 
    show([start|Moves], Path), 
    format('~nmoves = ~w~n', [N]). 

% Base case: if the current state is the goal, we reverse the path
dfs([State|States], [], Path) :- 
    goal(State), !, 
    reverse([State|States], Path). 

% Recursive case: apply a move, ensuring the state is not visited
dfs([State|States], [Move|Moves], Path) :- 
    move(State, Next, Move), 
    \+(memberchk(Next, [State|States])),  % Negation as failure using \+ instead of not
    dfs([Next,State|States], Moves, Path). 

% Show the moves and states
show([], _). 
show([Move|Moves], [State|States]) :- 
    State = state(A,B,C,D,E,F,G,H,I), 
    format('~n~w~n~n', [Move]), 
    format('~w ~w ~w~n',[A,B,C]), 
    format('~w ~w ~w~n',[D,E,F]), 
    format('~w ~w ~w~n',[G,H,I]), 
    show(Moves, States). 

% Empty position is marked with '0' now (to avoid conflicts with operators)
start(state(6,1,3,4,0,5,7,2,8)). 

% The goal state: arranged in order with empty space '0'
goal(state(1,2,3,4,5,6,7,8,0)).

% Moves - swap the empty tile with adjacent tiles (right, left, up, down)
move(state(0,B,C,D,E,F,G,H,I), state(B,0,C,D,E,F,G,H,I), right).
move(state(0,B,C,D,E,F,G,H,I), state(D,B,C,0,E,F,G,H,I), down).
move(state(A,0,C,D,E,F,G,H,I), state(0,A,C,D,E,F,G,H,I), left).
move(state(A,0,C,D,E,F,G,H,I), state(A,C,0,D,E,F,G,H,I), right).
move(state(A,0,C,D,E,F,G,H,I), state(A,E,C,D,0,F,G,H,I), down).
move(state(A,B,0,D,E,F,G,H,I), state(A,0,B,D,E,F,G,H,I), left).
move(state(A,B,0,D,E,F,G,H,I), state(A,B,F,D,E,0,G,H,I), down).
move(state(A,B,C,0,E,F,G,H,I), state(0,B,C,A,E,F,G,H,I), up).
move(state(A,B,C,0,E,F,G,H,I), state(A,B,C,E,0,F,G,H,I), right).
move(state(A,B,C,0,E,F,G,H,I), state(A,B,C,G,E,F,0,H,I), down).
move(state(A,B,C,D,0,F,G,H,I), state(A,0,C,D,B,F,G,H,I), up).
move(state(A,B,C,D,0,F,G,H,I), state(A,B,C,D,F,0,G,H,I), right).
move(state(A,B,C,D,0,F,G,H,I), state(A,B,C,D,H,F,G,0,I), down).
move(state(A,B,C,D,0,F,G,H,I), state(A,B,C,0,D,F,G,H,I), left).
move(state(A,B,C,D,E,0,G,H,I), state(A,B,0,D,E,C,G,H,I), up).
move(state(A,B,C,D,E,0,G,H,I), state(A,B,C,D,0,E,G,H,I), left).
move(state(A,B,C,D,E,0,G,H,I), state(A,B,C,D,E,I,G,H,0), down).
move(state(A,B,C,D,E,F,0,H,I), state(A,B,C,D,E,F,H,0,I), left).
move(state(A,B,C,D,E,F,0,H,I), state(A,B,C,0,E,F,D,H,I), up).
move(state(A,B,C,D,E,F,G,0,I), state(A,B,C,D,E,F,0,G,I), left).
move(state(A,B,C,D,E,F,G,0,I), state(A,B,C,D,0,F,G,E,I), up).
move(state(A,B,C,D,E,F,G,0,I), state(A,B,C,D,E,F,G,I,0), right).
move(state(A,B,C,D,E,F,G,H,0), state(A,B,C,D,E,0,G,H,F), up).
move(state(A,B,C,D,E,F,G,H,0), state(A,B,C,D,E,F,G,0,H), left).
