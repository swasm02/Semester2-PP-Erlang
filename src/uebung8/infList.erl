%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jun 2023 12:47
%%%-------------------------------------------------------------------
-module(infList).
-author("swasm").

%% API
-export([prim/1]).

prim(N) ->
    lists:reverse(eratosthenes(toList(N, []))).

toList(2, Acc) ->[2 | Acc];
toList(N, Acc) ->
  toList(N-1, [N| Acc]).

eratosthenes(List) ->
  eratosthenes(List, []).

eratosthenes([], Acc) -> Acc;
eratosthenes([H | T], Acc) ->
  eratosthenes(aussortieren(T, H), [H | Acc]).

aussortieren(List, N) ->
  lists:filter(fun(X) -> X rem N =/= 0 end, List).