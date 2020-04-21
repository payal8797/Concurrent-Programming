-module(fact).
-export([factorial/1]).

factorial(N) when N>1 ->
    Result=N*factorial(N-1),
    io:format("~w gives ~w ~n",[N,Result]),
    Result;
factorial(N) when N =< 1 ->
    io:format("1 gives 1.~n"),
1.