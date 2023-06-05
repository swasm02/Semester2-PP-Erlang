%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. Jun 2023 13:55
%%%-------------------------------------------------------------------
-module(a1).
-author("swasm").

%% API
-export([mitarbeiter/0, studenten/0, sort/1]).

mitarbeiter() -> [{name,"Micha"},{name,"Franz"},{name,"Micha"}].
studenten() -> [{name,"Daniel"},{name,"Alex"},{name,"Markus"}].

listTest(L) ->
  fun(X) -> lists:member(X,L) or lists:member({name, X} , L) end.

listAdd(L) ->
  fun({name, X}) when is_list(X) -> lists:append(L, [{name, X}]);
    (X) when is_list(X) -> lists:append(L, [{name, X}]);
    (_) -> L end.

listRemove(L) ->
  fun({name, X}) when is_list(X) -> lists:delete({name, X}, L);
    (X) when is_list(X) -> lists:delete({name, X}, L);
    (_) -> L end.

% Fehlermeldung in IntelliJ???
%% adding InsertionSort

insertion(Element, []) -> [Element];
insertion(Element, [H|T]) when Element < H -> [Element|[H|T]];
insertion(Element, [H|T]) -> [H|insertion(Element, T)].

sort(L) -> lists:foldl(fun insertion/2, [], L).