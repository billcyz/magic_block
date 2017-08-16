%% MagicBlock
%% Data: 16/08/2017

%% --- Code Description ---
%% Supervisor which add child process into supervisor A

-module(supervisor_b).
-behaviour(supervisor).
-export([start_link/0,
		 assign_worker/4]).

-export([init/1]).

%% ===========================================================================

start_link() ->
	{ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
	io:format("Supervisor B: ~p~n", [Pid]).

init([]) ->
	io:format("Prepare worker.......~n"),
	{ok, {{one_for_all, 0, 1}, []}}.

assign_worker(SupName, Mod, Fun, Args) ->
	{ok, Pid} = supervisor:start_child(
				  SupName,
				  {Mod, {Mod, Fun, Args},
				   transient, 60, worker, [Mod]}),
	case is_pid(Pid) of
		true -> ok;
		_ -> no
	end.