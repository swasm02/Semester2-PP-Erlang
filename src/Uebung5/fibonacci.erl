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
-export([fib/1, fib_end_rec/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 ->
  fib(N - 1) + fib(N - 2);
fib(_) ->
  {error, invalid_input}.

fib_end_rec(N) when N > 1 -> fib_end_rec(N, 0, 1);
fib_end_rec(_) -> {error, invalid_input}.

fib_end_rec(N, X, Y) when N == 0 -> X;
fib_end_rec(N, X, Y) -> fib_end_rec(N - 1, Y, X + Y).


% Herausfinden der Dauer: timer:tc(fibonacci, fib, [42]).