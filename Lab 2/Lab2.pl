n_queen(N, Solution) :- 
    % Create a list of N dummy variables 
    length(Solution, N), 
    queen(Solution, N).  % Search for a configuration of N queens

% Returns a list of integers from K to N (e.g., up2N(1,3,X) X = [1,2,3])
up2N(N, N, [N]) :- !.
up2N(K, N, [K|Tail]) :- 
    K < N, 
    K1 is K + 1, 
    up2N(K1, N, Tail). 

% Base case: no queens left to place
queen([], _).  % No queens is a valid solution for any N-queens problem

% Recursive case: placing queens safely
queen([Q|Qlist], N) :- 
    queen(Qlist, N),  % Solve the subproblem for the rest of the queens
    up2N(1, N, Candidate_positions_for_queenQ),  % Generate all possible positions for Q
    member(Q, Candidate_positions_for_queenQ),  % Pick a valid position
    check_solution(Q, Qlist, 1).  % Check if Q is safe

% Check if the current queen is safe from others
check_solution(_, [], _).  % Base case: no more queens to check
check_solution(Q, [Q1|Qlist], Xdist) :- 
    Q =\= Q1,  % Not in the same row
    Test is abs(Q1 - Q), 
    Test =\= Xdist,  % Not on the same diagonal
    Xdist1 is Xdist + 1, 
    check_solution(Q, Qlist, Xdist1).
