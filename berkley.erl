-module(berkley).
-compile(export_all).
for(0) -> [];
   for(N) when N > 0 ->
   [spawn(berkley,slave,[])|for(N-1)].
start(N,T)->
	 P=for(N-1),
	 io:format("~p",[P]),
	 Pid1=spawn(berkley,master,[P,N-1,[T]]),
	 input(Pid1,N-1),
	 Pid1 ! {calculate}.
input(_,0)->done;
input(Pid1,N)->
	{ok,Time}=io:read("enter time:"),
	Pid1 ! {slave,Time},
	input(Pid1,N-1).
master(P,N,Ts)->
	receive
		       {slave,Time}->
		       	  master(P,N,[Time|Ts]);
    	   	       {calculate}->
	   		 X=average(N,Ts,0),
			 [L1,L2]=[X/60,X rem 60],
		send(P,[L1,L2])
	end,
	master(P,N,Ts).	
average(N,[],Ag)->Ag/N;
average(N,[[L1,L2]|Ts],Ag)->
		       average(N,Ts,Ag+(L1*60+L2)).
send(_,[])->io:format("~n",[]);
send([T|P],[L1,L2])->
    T ! {[L1,L2]},
    send(P,[L1,L2]).
slave()->
	receive
         {[L1,L2]}->
	io:format("~p:",self()),
	    io:format("~p",[[L1,L2]]),
          slave()
    end,
	slave().