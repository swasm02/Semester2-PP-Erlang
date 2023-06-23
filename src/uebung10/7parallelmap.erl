%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Jun 2023 13:31
%%%-------------------------------------------------------------------
-module('7parallelmap').
-author("swasm").

%% API
-export([fermat/2, get_list/0, check/1]).

fermat(X, K) ->
  fermat(X, K, random:uniform(1000)).

fermat(_, 0, _) ->
  true;
fermat(X, K, Y) ->
  case (pot(Y, X-1, X, Y) rem X) of
    1 -> fermat(X, K-1, random:uniform(1000));
    _ -> false
  end.


pot(A, 0, _, _) ->
  A;
pot(A, B, X, S) ->
  pot((A*S) rem X, B-1, X, S).

get_list() ->
  get_list(10, []).
get_list(0, List) ->
  io:format("List: ~p~n", [List]),
  List;
get_list(N,List) ->
  get_list(N-1, [random:uniform(999998) + 2 | List]).

check(K) ->
  lists:map(fun(X) -> fermat(X, K) end, get_list()).