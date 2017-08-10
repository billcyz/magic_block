%% MagicBlock
%% Data: 10/08/2017

%% --- Code Description ---
%% The traffic management controller

-module(magic_traffichandler).
-behaviour(gen_server).
-export([]).

-define(SERVER, ?MODULE).

%% ===========================================================================

%% Start traffic handler
start_link() ->
	gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).



