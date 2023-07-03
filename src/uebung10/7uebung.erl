%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Jul 2023 13:24
%%%-------------------------------------------------------------------
-module('7uebung').
-author("swasm").

%% API
-export([fermat/2]).

fermat(X, 0) -> true;
fermat(X, K) ->
  Y = random:uniform(X-2) + 3,
  Res = round(math:pow(Y, X-1)) rem X,
  case Res of
    1 -> fermat(X, K-1);
    _ -> false
  end.