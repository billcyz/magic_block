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

%% Analysis data packet


%% Once a process A is spawned, another backup process B should also be started
%% as well. Both process holds a memory storage. A stores data and its own state
%% in its memory storage, and B replicates the content in A's memory storage for
%% backup. If A terminates abnormally, B will continue A's job by using the backup
%% data.
%%
%% Memory management first generate unique id for the process, and (memory management
%% backup data for both process, and identify data according to the unique memory id).
start_process(Mod, Fun, Args) ->
	1.

