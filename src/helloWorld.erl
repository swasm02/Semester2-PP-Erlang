%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mai 2023 14:58
%%%-------------------------------------------------------------------
-module(helloWorld).
-author("swasm").

%% API
-export([helloworld/0]).

helloworld() ->
  io:write("hello, world").