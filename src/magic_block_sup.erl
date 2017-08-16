%% MagicBlock
%% Data: 8/08/2017

%% --- Code Description ---
%% supervisor for whole application

-module(magic_block_sup).
-behaviour(supervisor).
-export([start/0,
		 start_child_sup/1, start_child_sup/2, start_child_sup/3,
		 start_child/1, start_child/2, start_child/3, start_child/4,
		 stop_child/1]).

-export([init/1]).

%% ===========================================================================

%% Start supervisor for whole application
start() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% Start child supervisor
start_child_sup(Mod) ->
	start_child_sup(Mod, []).

start_child_sup(Mod, Args) ->
	start_child_sup(Mod, Mod, Args).

start_child_sup(ChildId, Mod, Args) ->
	child_reply(supervisor:start_child(
				  ?MODULE,
				  {ChildId, {Mod, start_link, Args},
				   transient, infinity, supervisor, [Mod]})).

%% Start child worker
start_child(Mod) ->
	start_child(Mod, []).

start_child(Mod, Args) ->
	start_child(Mod, Mod, Args).

start_child(ChildId, Mod, Args) ->
	child_reply(supervisor:start_child(
				  ?MODULE,
				  {ChildId, {Mod, start_link, Args},
				   transient, 60, worker, [Mod]})).

start_child(ChildId, Mod, Fun, Args) ->
	child_reply(supervisor:start_child(
				  ?MODULE,
				  {ChildId, {Mod, Fun, Args},
				   transient, 60, worker, [Mod]})).

%% Stop child process
stop_child(ChildId) ->
	case supervisor:terminate_child(?MODULE, ChildId) of
		ok -> supervisor:delete_child(?MODULE, ChildId);
		E  -> E
	end.

init([]) -> {ok, {{one_for_all, 0, 1}, []}}.

%% Result of child process
child_reply({ok, _Pid}) -> ok;
child_reply(E) -> E.
