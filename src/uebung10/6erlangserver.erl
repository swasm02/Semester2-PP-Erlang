%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. Jun 2023 09:57
%%%-------------------------------------------------------------------
-module('6erlangserver').
-author("swasm").

%% API
-export([run/0]).

% kleine Client-Server-Anwendung in Erlang:
% zur Berechnung des Volumens bestimmter Körper
% Durchführung der Berechnung von Server-Prozess,
% Anforderung der Berechnung von Client-Prozess

% Quader, Kugeln und Zylinder -> Parameter als Tupel

server() ->
  receive
    {Pid, {quader, Laenge, Breite, Hoehe}} ->
      Pid ! Laenge * Breite * Hoehe,
      server();
    {Pid, {kugel, Radius}} ->
      Pid ! 4/3 * Radius * Radius * Radius * math:pi(),
      server();
    {Pid, {zylinder, Radius, Hoehe}} ->
      Pid ! Radius * Radius * math:pi() * Hoehe,
      server();
    {Pid, stop} ->
      Pid ! stopped,
      stopped;
    {Pid, _} ->
      Pid ! {error, unknown_request},
      server()
  end.

berechne(ServerPID, Anfrage) ->
  ServerPID ! {self(), Anfrage},
  receive
    X -> X
  after 1.0 ->
    {error, timeout}
  end.

run() ->
  Pid = spawn(fun server/0),
  berechne(Pid, {quader, 2, 3, 4}),
  berechne(Pid, {kugel, 2}),
  berechne(Pid, {zylinder, 2, 3}),
  berechne(Pid, {quader, 2, 3, 4}),
  berechne(Pid, stop).