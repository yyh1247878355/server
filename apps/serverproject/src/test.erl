-module(test).
-include("person_pb.hrl").
-export([start/0]).


start() ->
	Pid = spwan(?MODULE, loop, []),
	erlang:start_timer(2000, Pid, "test timer").

rpc(Pid, Request) ->
	Pid ! {self(), Request},
	receive
		{Pid, Response} ->
			Response
	end.

loop(X) ->
	receive
		Any ->
			io:format("Receive:~p~n", [Any]),
			loop(X)
	end.