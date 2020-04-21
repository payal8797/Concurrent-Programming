-module(printMessage).
-export([start/0,process1/2]).

process1(_,0)->
    done;
process1(Message,Time)->
    io:format(" ~p~n",[Message]),
    process1(Message,Time-1).   

start()->
    spawn(printMessage,process1,[hello,5]),
    spawn(printMessage,process1,[world,5]).
