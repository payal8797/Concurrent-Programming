-module(remainder).
-export([remainder/2]).

remainder(X,Y)->
    if X>=Y ->
        remainder(X-Y,Y);
    true->
        X
    end.