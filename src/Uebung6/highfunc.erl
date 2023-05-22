%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:36
%%%-------------------------------------------------------------------
-module(highfunc).
-author("swasm").

%% API
-export([q/1, q2/1]).

square(N) -> N*N.

% nicht korrekt, lists muss mit eingebunden werden!
% map(_, []) -> [];
% map(Func, [H|T]) -> [Func(H)|map(Func,T)].
%% Aufruf erfolgt mit highfunc:map(fun highfunc:square/1, [1,2,3,4]).

% Übungsstunde:
q(L) -> lists:map(fun square/1, L).

%alternativ mit anonymer Funktion:
q2(L) -> lists:map(fun(E) -> E*E end, L).
% "fun(E) -> E*E end" ist Closure