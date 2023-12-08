%%%-------------------------------------------------------------------
%% @doc serverproject public API
%% @end
%%%-------------------------------------------------------------------

-module(serverproject_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    serverproject_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
