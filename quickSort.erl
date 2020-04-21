-module(quickSort).
-compile(export_all).

quickSort([])->[];
quickSort([X|Y])->
    if X>1+quickSort ->
        [X]++quickSort(Y);
    true ->
        quickSort(Y)++[X]
    end.

    
