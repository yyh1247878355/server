-module(test).
-include("person_pb.hrl").
-export([test/0]).


test() ->
	person_pb:encode_msg(#'Person'{name="yyh",id=123,email="yyh@qq.com"}).
