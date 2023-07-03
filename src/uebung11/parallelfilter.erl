%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Jun 2023 14:26
%%%-------------------------------------------------------------------
-module(parallelfilter).
-author("swasm").

%% kompletter Müll, aber ich hab keine Lust mehr

%% API
-export([filter_parallel/3, filter_spawn/2]).

% Version 1: Filtern mit spawn für jedes Element
filter_spawn(_, []) -> [];
filter_spawn(F, [H|T]) ->
  Pid = spawn(fun() -> filter_spawn(F, T) end),
  case F(H) of
    true -> [H|Pid];
    false -> Pid
  end.

% Version 2: Parallelisierung durch Aufteilung der Eingabeliste
filter_parallel(_, [], _) -> [];
filter_parallel(F, L, K) ->
  Sublists = lists:split(K, L),
  Pids = [spawn(fun() -> filter_parallel(F, Sublist, K) end) || Sublist <- Sublists],
  Results = [Result || Pid <- Pids, Result <- Pid],
  lists:flatten(Results).