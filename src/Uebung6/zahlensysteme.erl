%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Mai 2023 13:38
%%%-------------------------------------------------------------------
-module(zahlensysteme).
-author("swasm").

%% API
-export([toErl/2, toB2/2, wandeln/3]).

wandeln(B1, List, B2) -> toB2(toErl(B1,List), B2).

toErl(N, [H|T]) -> fromB1(N, H, T);
toErl(_, []) -> 0.

fromB1(N,H,T) -> trunc(H*math:pow(N,erlang:length(T)) + toErl(N, T)).


toB2(N, B2) -> toB2_helper(N, B2,[]).

toB2_helper(0,_,List) -> List;
toB2_helper(N,B2,List) -> toB2_helper(trunc(N/B2),B2,[N rem B2 | List]).