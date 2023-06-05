%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:37
%%%-------------------------------------------------------------------
-module(fold).
-author("swasm").

%% API
-export([ggT/1, kgV/1]).

% Aufgabenteil 1:
ggT(List) ->
  lists:foldl(fun(X, GGT) -> ggT(X, GGT) end, 0, List).

ggT(A, B) when is_integer(A), is_integer(B) ->
  if
    B == 0 -> trunc(A);
    true -> if
              A > B -> ggT(A-B, B);
              true -> ggT(A,B-A)
            end
  end;
ggT(_,_) -> {wrongInput}.

% Annas Lösung
gg(X,Y) when Y == 0 -> X;
gg(X,Y) -> gg(Y, X rem Y).

gggT([H|T]) -> lists:foldl(fun gg/2, H, T).

% Aufgabenteil 2:
kgV(List) ->
  lists:foldl(fun(X, KGV) -> kgV(X, KGV) end, 1, List).

kgV(A, B) when is_integer(A), is_integer(B) ->
  trunc(abs(A * B) / ggT(A,B));
kgV(_,_) -> {wrongInput}.

% Annas Lösung
kg(X,Y) -> abs(X * Y) div gg(X,Y).
kkgV([H|T]) -> lists:foldl(fun kg/2, H, T).

% Aufgabenteil 3:
%  fold:kgV([2, 3, 6, 5]).
% 1. Uebergabe der Liste [2, 3, 6, 5] an:
%     lists:foldl(fun(X, KGV) -> kgV(X, KGV) end, 1, List).
% 2. Suche nach dem kgV von 2 und 1 -> 2
% 3. Suche nach dem kgV von 3 und 2 -> 6
% 4. Suche nach dem kgV von 6 und 6 -> 6
% 5. Suche nach dem kgV von 5 und 6 -> 30