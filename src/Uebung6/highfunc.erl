%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:36
%%%-------------------------------------------------------------------
-module(highfunc).
-author("swasm").

%% API
-export([map/2, square/1]).

square(N) -> N*N.

map(_, []) -> [];
map(Func, [H|T]) -> [Func(H)|map(Func,T)].

% Aufruf erfolgt mit highfunc:map(fun highfunc:square/1, [1,2,3,4]).