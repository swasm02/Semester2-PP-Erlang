%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mai 2023 18:12
%%%-------------------------------------------------------------------
-module(squareroot).
-author("swasm").

%% API
-export([wurzel/1]).

wurzel(X) -> wurzel(X, 1, 0.001).

wurzel(X,Y,Epsilon) ->
  case abs(Y*Y - X) < Epsilon of
    true -> Y;
    false -> wurzel(X, 1/2 * (Y + X/Y), Epsilon)
  end.

