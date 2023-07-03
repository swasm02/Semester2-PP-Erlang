%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Jul 2023 13:40
%%%-------------------------------------------------------------------
-module(mikapfilter).
-author("swasm").

%% API
-export([pfilter2/2]).

pfilter(F, L) ->
  S = self(), % Berechnung der Fibonacci-Zahl für F
  Pids = lists:map(fun(I) ->
    % Prozess erzeugen
    spawn(fun() -> do_fun(S, F, I) end)
                   end, L),
  gather(Pids). % Ergebnisse einsammeln

do_fun(Parent, F, I) ->
  case F(I) of
    true -> Parent ! {self(), I};
    false -> Parent ! weg_damit
  end.

gather([Pid | T]) ->
  receive
    {Pid, Ret} -> [Ret | gather(T)];
    _ -> gather(T)
  end;
gather([]) -> [].

pfilter(F, L, K) ->
  S = self(),
  Sublists = split_list(L, K),
  Pids = lists:map(fun(Sublist) ->
    spawn(fun() -> do_fun2(S, F, Sublist) end)
                   end, Sublists),
  gather2(Pids, []).

do_fun2(Parent, F, Sublist) ->
  Filtered = lists:filter(F, Sublist),
  Parent ! {self(), Filtered}.

gather2([Pid | T], Acc) ->
  receive
    {Pid, Ret} -> gather2(T, [Ret | Acc]);
    _ -> gather2([Pid | T], Acc)
  end;
gather2([], Acc) -> lists:flatten(lists:reverse(Acc)).

split_list(L, K) when length(L) > K ->
  {Sublist, Rest} = lists:split(K, L),
  [Sublist | split_list(Rest, K)];
split_list(L, _) -> [L].

%% für wenige Elemente und rechenaufwändiger Filterfunktion effizient
%% Version der Übung für die restliche Teilaufgabe
%% mikapfilter:pfilter2(fun(X) -> case X rem 3 of 0 -> true; _ -> false end end, [1,2,3,4,5,6,7,8,9]).

splitL(L, N) when N < 2 -> L;
splitL(L, N) ->
  {L1, L2} = lists:split(round(length(L) / N), L),
  [L1 | splitL(L2, N-1)].

pfilter2(F, L) ->
  S = self(),
  LNeu = splitL(L, 10),
  Pids = lists:map(fun(I) ->
    spawn(fun() -> do_fun_neu(S, F, I) end)
                   end, LNeu),
  lists:flatten(gather(Pids)).

do_fun_neu(Parent, F, List) ->
  Parent ! {self(), lists:filter(F, List)}.