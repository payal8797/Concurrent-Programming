-module(star).
-export([start/2,edge_node/0,central_node/2]).

send_all(Node_List, Message) ->
  lists:foreach(fun(Elem)->Elem ! Message end, Node_List).

central_node(0, Edge_PIDs) ->
  send_all(Edge_PIDs, finished), % Send the edge process: finished
  io:format("~w: Central node finished~n",[self()]);

central_node(M, Edge_PIDs) ->
  send_all(Edge_PIDs, {message, self()}),
  central_node(M, Edge_PIDs, length(Edge_PIDs)).

central_node(M, Edge_PIDs, K) ->
  receive
    {response, Edge_PID} ->
      io:format("~w: received response~n",[self()])
  end,
  if
    K > 1 ->
      central_node(M, Edge_PIDs, K-1);
    true ->
      central_node(M-1, Edge_PIDs)
  end.

edge_node() ->
  receive
    finished ->
      io:format("~w: Edge node finished~n",[self()]);
    {message, From_PID} ->
      io:format("~w: received message~n",[self()]),
      From_PID ! {response,self()},
      edge_node()
  end.

spawn_nodes(0,Acc) -> Acc;
spawn_nodes(N,Acc) ->
  Child_PID = spawn(star,edge_node,[]),
  io:format("Started edge node ~w~n",[Child_PID]),
  spawn_nodes(N-1, [Child_PID | Acc]).

start(N,M) ->
  Edge_PIDs = spawn_nodes(N-1,[]),
  Cent_PID = spawn(star, central_node, [M, Edge_PIDs]),
  io:format("~w: Central node starting~n",[Cent_PID]).