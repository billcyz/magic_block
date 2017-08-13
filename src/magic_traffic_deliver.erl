%% MagicBlock
%% Data: 13/08/2017

%% --- Code Description ---
%% Deliver traffic to destination
%% The deliver is a temporary process, which starts and stop
%% based on current request status.

-module(magic_traffic_deliver).

-export([]).

%% ===========================================================================

%% Start traffic deliver
%% Each deliver is identical to every allocator. 
start_link(AlloId) ->
	gen_server:start_link(Module, Args, Options).




