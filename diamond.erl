-module(diamond).

-export([rows/1]).


rows([Letter]) ->
	First = $A,
	Lentgh = (Letter - First) * 2 + 1,
	Pos = Lentgh div 2,
	Rows = rows(First, 0, Letter, Pos, []),
	lists:reverse(Rows) ++ tl(Rows).

rows(Current, _, Last, _, Accum) when Current > Last -> Accum;
rows(Current = $A, Offset, Last, Pos, Accum) ->
	Row = lists:duplicate(Pos, $ ) ++ [Current] ++ lists:duplicate(Pos, $ ),
	rows(Current + 1, Offset + 1, Last, {Pos - 1, Pos + 1}, [Row|Accum]);
rows(Current, Offset, Last, {Pos1, Pos2}, Accum) ->
	Row = lists:duplicate(Pos1, $ ) ++ [Current] ++ lists:duplicate(Pos2 - Pos1 - 1, $ ) ++ [Current] ++ lists:duplicate(Pos1, $ ),
	rows(Current + 1, Offset + 1, Last, {Pos1 - 1, Pos2 + 1}, [Row|Accum]).