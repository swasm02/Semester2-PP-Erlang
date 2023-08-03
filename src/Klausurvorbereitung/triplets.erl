-module(triplets).
-export([pyreku/1,pythag/1]).


pyreku(K) -> pyreku(K,1).
pyreku(K, M) ->
  T = (pythag(M)),
  if
    length(T)<K -> pyreku(K, M+1);
    true -> kleiner(T,K)
  end.


kleiner(_,0)-> [];
kleiner([H|T],C) -> [H | kleiner(T,C-1)].
pythag(N) ->
  [ {A,B,C} ||
    A <- lists:seq(1,N),
    B <- lists:seq(1,N),
    C <- lists:seq(1,N),
    A+B+C =< N,
    A*A+B*B =:= C*C ].