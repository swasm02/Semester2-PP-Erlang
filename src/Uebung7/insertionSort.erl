%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. Mai 2023 09:56
%%%-------------------------------------------------------------------
-module(insertionSort).
-author("swasm").

%% API
-export([sort/1]).

sort(List) -> lists:foldl(fun insertion/2, [], List).

% https://www.erlang.org/doc/man/lists.html#partition-2
insertion(Element, List) ->
  {_,X} = Element,
  % Aufteilung der übergebenen Liste in zwei Teillisten, welche die kleineren bzw. die
  % größeren Elemente verglichen mit einzufügenden Element enthalten.
  {Smaller, Greater} = lists:partition(fun({_,K}) -> K < X end, List),
  % Das einzufügende Element wird an der richtigen Position eingefügt.
  lists:append([Smaller ++ [Element] ++ Greater]).


% just for fun, ohne partition zu verwenden:
insertion_no_partition(Element, List) -> insertion_no_partition(Element, List, []).

% Basisfall: in Acc ist alles kleinere als Element => anhängen und reverse
insertion_no_partition(Element, [], Acc) -> lists:reverse([Acc | Element]);
insertion_no_partition(Element, [H | T], Acc) ->
  {_, X} = Element,       % Extrahieren der zu sortierenden Elemente
  {_, Y} = H,
  case Y < X of
    % wenn true: trivialerweise ist X > Y und somit kommt Y in den Acc und die Suche nach dem größeren Element geht weiter
    true -> insertion_no_partition(Element, T, [H | Acc]);
    % wenn false: trivialerweise ist Y > X und somit muss X zwischen dem Acc und Y eingefügt werden
    false -> lists:reverse(Acc) ++ [Element] ++ [H | T]
  end.