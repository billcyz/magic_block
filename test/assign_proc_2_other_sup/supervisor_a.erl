%% MagicBlock
%% Data: 16/08/2017

%% --- Code Description ---
%% Parent supervisor A

-module(supervisor_a).
-behaviour(supervisor).
-export([start_link/0,
		 count_child_num/0, check_child_all/0]).

-export([init/1]).

%% ===========================================================================

start_link() ->
	{ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
	io:format("Supervisor A: ~p~n", [Pid]).

init([]) ->
	io:format("Start supervisor A........~n"),
	{ok, {{one_for_all, 0, 1}, []}}.

%% Count child process number
count_child_num() ->
	supervisor:count_children(?MODULE).

%% List all children process belonging to the supervisor
check_child_all() ->
	supervisor:which_children(?MODULE).



