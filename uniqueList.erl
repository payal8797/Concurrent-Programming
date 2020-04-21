-module(uniqueList).
-compile(export_all).


unique_sort([]) -> [];
unique_sort([Pivot|T]) ->
unique_sort ([X || X <- T, X < Pivot) ]++
[Pivot] ++
unique_sort ([X || X <- T, X > Pivot ]).
count([Y|Z])-> 1+count(Z).

    

