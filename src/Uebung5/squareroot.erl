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
-export([wurzel/1, wurzel2/2]).

wurzel(X) -> wurzel(X, 1, 0.0001).
wurzel(X,Y,Epsilon) ->
  case abs(Y*Y - X) < Epsilon of
    true -> Y;
    false -> wurzel(X, 1/2 * (Y + X/Y), Epsilon)
  end.

wurzel2(X, U) -> wurzel2(X, 1, U).
wurzel2(X,Y, U) ->
  Z = 1/2 * (Y + X/Y),
  %io:fwrite("Y: ~p  Z: ~p ", [Y, Z]),
  case abs(Y-Z) < U of
    true -> Y;
    false -> wurzel2(X, Z , U)
  end.

wurzelUebungsstunde (X,Y,Epsilon) ->
  Yneu = wurzel(X, 1/2 * (Y + X/Y), Epsilon),
  case abs(Yneu - Y) < Epsilon of
    true -> Y;
    false -> Yneu
  end.