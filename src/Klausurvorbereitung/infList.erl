%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 27. Jul 2023 13:56
%%%-------------------------------------------------------------------
-module(infList).
-author("swasm").

%% API
-export([next/1, infList/1, tupellist/0, pT/0]).


% How to construct an infinite list?
infList(A) -> [A | fun() -> infList(A + 1) end].

next({N,M}) -> next({N,M}, [], N).
next({0,_}, List, Y) ->
  %io:format("~p~n",[lists:reverse(List)]),
  if
    Y==100 -> lists:reverse(List);
    true -> next({Y,1}, List, Y+1)
  end;
next({N,M}, List, Y) ->
  next({N-1,M+1}, [{N,M} | List], Y).

tupellist() -> next({1,1}).

pT() -> [{A,B} ||
  {A,B} <- tupellist(),
  C <- lists:seq(1,1000),
  A*A + B*B =:= C*C].