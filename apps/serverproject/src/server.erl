-module(server).
-export([start/0, start/1, send/2]).

%%主动服务器
start()->
    Port = 10666,
    start(Port).
start(Port)->
    %监听端口
    {ok,Listen}=gen_tcp:listen(Port,[binary, {active, true}]),
    io:format("服务器已启动,监听端口:~p~n",[Prot]),
    spawn(fun() -> par_connect(Listen) end).

%%链接处理
par_connect(Listen) ->
    {ok,Socket}=gen_tcp:accept(Listen),
    case inet:peername(Socket) of
        {ok, {IP, Port}} ->
            io:format("客户端~p已连接~n", [IP]),
            loop({Socket, IP, Port});
        {error, Reason} ->
            io:format("客户端连接异常:~p~n", [Reason])
    end,
    spawn(fun() -> par_connect(Listen) end).

loop({Socket, IP, _} = Session) ->
    receive
        {tcp, Socket, Msg} ->
            io:format("收到~p消息,长度:~p~n", [IP, byte_size(Msg)]),
            c2s:decode_msg(Session, Msg);
        {tcp_closed, Socket} ->
            io:format("客户端~p连接已断开~n", [IP])
    end.

%%发送消息
send({Socket, _, _}, Msg) ->
    gen_tcp:send(Socket, Msg),
    io:format("消息已回复~n").

%%关闭套接字
close({Socket, _, _}) ->
    gen_tcp:close(Socket).
