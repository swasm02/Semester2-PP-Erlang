%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. Aug 2023 18:37
%%%-------------------------------------------------------------------
-module(sortingAlgorithms).
-author("swasm").

%% API
-export([]). %add export if you want to export any function

ms([],_)->[];
ms(L,_) when length(L) == 1 -> L;
ms(L,K) ->  % K ^= Anzahl der Threads
  Parent = self(),
  {L1 , L2} = lists:split(length(L) div 2, L),
  case (K > 0) of
    true -> spawn(fun()-> Parent ! ms(L1, K-1) end),
      L22 = ms(L2,K-1),
      lists:merge(receive T2 -> T2 end, L22);
    false -> L12 = ms(L1, K),
      L22 = ms(L2, K),
      lists:merge(L12, L22)
  end.

%merge([H1| T1], [H2|T2])->
%  case (H1 < H2) of
%    true -> [H1 | merge(T1, [H2|T2])];
%    false -> [H2 | merge([H1|T1], T2)]
%  end;
%merge([],L)-> L;
%merge(L,[])-> L.



test(K) ->
  Seq = lists:seq(1,1000),
  Data = lists:map(fun() -> random:uniform(999998)+2 end, Seq),
  ms(Data, K).

benchmark(K) ->
  Times = [timer:tc(mergesort, test, [K]) || K <- lists:seq(1, 100)],
  lists:sum([T || {T, _} <- Times]) / length(Times).
sort(L) -> lists:foldl(fun insertion/2,[],L).   % schieben in neue Liste

insertion(E, []) -> [E];
insertion(E,[X|Y]) -> if
                        E < X -> [E,X |Y];
                        true -> lists:append([X], insertion(E, Y))
                      end.