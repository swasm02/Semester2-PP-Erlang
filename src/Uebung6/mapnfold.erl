%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:38
%%%-------------------------------------------------------------------
-module(mapnfold).
-author("swasm").

%% API
-export([count/1, mapping/1]).

% eigene Lösung ohne Aufgabenstellung gelesen zu haben (richtige siehe unten.)
count(List) -> count(wandeln(List), 0).

count([H|T], Acc) when H == 1 -> count(T, Acc + 1);
count([_|T], Acc) -> count(T, Acc);
count(_, Acc) -> Acc.

wandeln(List) -> toB2(toErl(10,List), 2).

% Helper Funktionen (kopiert von Aufgabe 5)
toErl(N, [H|T]) -> fromB1(N, H, T);
toErl(_, []) -> 0.
fromB1(N,H,T) -> trunc(H*math:pow(N,erlang:length(T)) + toErl(N, T)).
toB2(N, B2) -> toB2_helper(N, B2,[]).
toB2_helper(0,_,List) -> List;
toB2_helper(N,B2,List) -> toB2_helper(trunc(N/B2),B2,[N rem B2 | List]).

% Lösung nach Aufgabenstellung mit map
mapping(List) ->
  one_sum([toB2(X,2) || X <- List]).

one_sum([]) -> 0;
one_sum([H|T]) -> one_sum(H, 0) + one_sum(T).

one_sum([], Acc) -> Acc;
one_sum([H|T], Acc) ->
  case H == 1 of
    true -> one_sum(T,Acc+1);
    false -> one_sum(T,Acc)
  end.