%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mai 2023 17:30
%%%-------------------------------------------------------------------
-module(fibonacci).
-author("swasm").

%% API
-export([fib/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 ->
  fib(N - 1) + fib(N - 2);
fib(_) ->
  {error, invalid_input}.