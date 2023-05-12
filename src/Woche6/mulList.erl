%%%-------------------------------------------------------------------
%%% @author swasm
%%% @copyright (C) 2023, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Mai 2023 17:58
%%%-------------------------------------------------------------------
-module(mulList).
-author("swasm").

%% API
-export([multiply/1, multendrec/1]).

multiply([]) -> 1;
multiply([L | Lremains]) -> L * multiply(Lremains).

% endrekursiv
multendrec(L) -> multendrec(L, 1).

multendrec([], End) -> End;
multendrec([L | Lremains], End) -> multendrec(Lremains, L * End).