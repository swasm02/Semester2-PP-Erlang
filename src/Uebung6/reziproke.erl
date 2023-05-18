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
-export([inverse/1, map/2, altInverse/1]).

inverse(N) when is_integer(N) -> 1/N;
inverse(_) -> fail.

map(_, []) -> [];
map(Func, [H|T]) -> [Func(H)|map(Func, T)].

% das gleiche per List Comprehension:
altInverse(List) -> [inverse(X) || X <- List].