-module(erlang_and_if).
-export([some_function/0]).

some_function() ->
  if 42 =:= 42 ->
    yay
  end,
  if 42 =:= 73; 42 =:= 42 ->
    yay
  end,
  if 42 =:= 73, 42 =:= 42 ->
    meh
  end.