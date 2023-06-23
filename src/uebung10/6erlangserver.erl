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
    {quader, Laenge, Breite, Hoehe} ->
      io:format("Volumen Quader: ~p~n", [Laenge * Breite * Hoehe]),
      server();
    {kugel, Radius} ->
      io:format("Volumen Kugel: ~p~n", [4/3 * Radius * Radius * Radius * math:pi()]),
      server();
    {zylinder, Radius, Hoehe} ->
      io:format("Volumen Zylinder: ~p~n", [math:pi() * Radius * Radius * Hoehe]),
      server();
    stop -> true;
    _ ->
      io:format("Falsche Parameter! :(~n"),
      server()
  end.

run() ->
  Pid = spawn(fun server/0),
  Pid ! {quader, 2, 3, 4},
  Pid ! {kugel, 2},
  Pid ! {quadrat, 2},
  Pid ! {zylinder, 2, 3},
  Pid ! stop.
