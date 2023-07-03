%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 30. Jun 2023 14:32
%%%-------------------------------------------------------------------
-module(mergesort).
-author("swasm").

%% API
-export([mergeS/1]).

m(X, []) -> X;
m([], Y) -> Y;
m([X|Xs], [Y|Ys]) when X < Y -> [X | m(Xs, [Y|Ys])];
m([X|Xs], [Y|Ys]) -> [Y | m([X|Xs], Ys)].

mergeS(L) when length(L) < 2 -> L;
mergeS(L) ->
  {L1, L2} = lists:split(length(L) div 2, L),
  Pid = self(),
  spawn(fun() -> Pid ! mergeS(L1) end),
  m(mergeS(L2), receive X-> X end).