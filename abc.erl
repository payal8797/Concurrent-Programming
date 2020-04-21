-module(abc).
-export([abc/2,successor/1]).

abc(_,0)->1;

abc(X, N) -> X * abc(X, N-1).

successor(Y)->Y+1.