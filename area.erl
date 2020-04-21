-module(area).
-compile(export_all).


rectangle(Length,Breadth)->
    io:format("Area of Rectagle: ~p~n",[Length*Breadth]).
circle(Radius) ->
    io:format("Area of Circle: ~p~n",[math:pi() * Radius * Radius]).

start()->
    spawn(area,rectangle,[5,3]),
    spawn(area,circle,[2]).
