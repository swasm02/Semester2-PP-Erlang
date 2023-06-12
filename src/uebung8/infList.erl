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

%%% API ---------------------------------------------------------------
-export([prim/1, primes/1]).

% Aufgabenstellung falsch verstanden :(
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

%%%-------------------------------------------------------------------
%% Mikas Lösung
primes(K) ->
  sieb(from(2), K).

from(A) -> [A | fun() -> from(A + 1) end].

sieb([H | T], K) when K > 0 ->
  [H | sieb(aussortieren2(T(), H), K - 1)];
sieb(_, 0) -> [].

aussortieren2([H | T], N) when (H rem N) =:= 0 ->
  aussortieren2(T(), N);
aussortieren2([H | T], N) ->
  [H | fun() -> aussortieren2(T(), N) end].