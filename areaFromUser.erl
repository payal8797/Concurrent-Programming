-module(areaFromUser).
-compile(export_all).


rectangle(Length,Breadth)->
    io:format("Area of Rectagle: ~p~n",[Length*Breadth]).
circle(Radius) ->
    io:format("Area of Circle: ~p~n",[math:pi() * Radius * Radius]).

start(Length,Breadth,Radius)->
    spawn(areaFromUser,rectangle,[Length,Breadth]),
    spawn(areaFromUser,circle,[Radius]).
