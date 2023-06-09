%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:37
%%%------------------------------------------------------------------
-module(filter).
-author("swasm").

%% API
-export([eqklassen/2, modThree/1]).

modThree(N) -> N rem 3.
id(X) -> X.

eqklassen(Func, List) -> filter([eq_helper(Func, List, X) || X <- List], []).
%% falsch, lists:filter verwenden!!!

% Chris Lösung:
eqclass (F, Ls) -> [[X || X <- Ls, F(X) =:= Key] || Key <- lists:usort([F(X) || X <- Ls])].

% Übunststunde Lösung:
eqklassenuebung(_, []) -> [];
eqklassenuebung(F, [H|T]) ->
  E = F(H),
  L = [X || X <- [H|T], F(X) == E],
  [L | eqklassenuebung(F, T -- L)].

eq_helper(Func, List, X) -> [Y || Y <- List, Func(X) =:= Func(Y)].

filter([H|T], Acc) -> filter(lists:member(H,Acc) , H, T, Acc);
filter([], Acc) -> lists:reverse(Acc).

filter(false, H, T, Acc) ->
  Neu = [H|Acc],
  filter(T, Neu);
filter(true, _, T, Acc) -> filter(T, Acc).