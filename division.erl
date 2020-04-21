-module(division).
-export([division/2,divide/3]).
division(X,Y)->divide(X,Y,0).
divide(X,Y,K)->  
    if X>=Y -> 
        divide(X-Y,Y,K+1);
    true->
        K
    end.
