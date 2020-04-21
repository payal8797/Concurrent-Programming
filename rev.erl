-module(rev).
-compile(export_all).

rev1([])->[];
rev1([X|Xs]) ->
		rev1([Y || Y<-Xs]) ++ [X].
