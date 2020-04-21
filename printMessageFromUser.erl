-module(printMessageFromUser).
-export([start/3,process/2]).

process(_,0)->
    done;
process(Message,Time)->
    io:format("~p~n",[Message]),
    process(Message,Time-1).   

start(Message1,Message2,Time)->
    spawn(printMessageFromUser,process,[Message1,Time]),
    spawn(printMessageFromUser,process,[Message2,Time]).
