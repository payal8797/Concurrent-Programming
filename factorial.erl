-module(factorial).
-compile(export_all).
fact(0)->1;
fact(1)->1;
fact(N)->
    K=N*fact(N-1).
    %"factorial= ~p~n",[K].

start(N)->
    spawn(factorial,fact,[N]).