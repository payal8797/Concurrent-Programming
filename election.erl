-module(election).
-compile(export_all).

result(candidate_name,votes)->
    io.format("Candidate Name:" ~p~n,candidate_name)
    io.format("Number of votes:" ~p~n,votes)

start()->
    Pid=self(),
    Pid_1=spawn(election,voters,[Pid,candidate_name]).