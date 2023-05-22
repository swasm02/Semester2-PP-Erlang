%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:37
%%%-------------------------------------------------------------------
-module(reziproke).
-author("swasm").

%% API
-export([inverse/1, altInverse/1, inv/1, inverse2/1]).

inverse(N) when is_number(N) and (N /= 0) -> 1/N;
inverse(_) -> fail.

inverse2(N) -> try 1/N catch _:_ -> fail end.

% siehe Aufgabe vorher lists: fehlt!
% map(_, []) -> [];
% map(Func, [H|T]) -> [Func(H)|map(Func, T)].

inv(L) -> lists:map(fun inverse/1, L).

% das gleiche per List Comprehension:
altInverse(List) -> [inverse(X) || X <- List].