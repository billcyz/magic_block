%% MagicBlock
%% Data: 16/08/2017

%% --- Code Description ---
%% Simple worker

-module(worker_b).
-behaviour(gen_server).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, code_change/3,
		 terminate/2]).

-export([start_worker/0]).

-record(status, {}).

%% ===========================================================================

start_worker() ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
	{ok, #status{}}.

handle_call(hello, _From, State) ->
	io:format("Worker received hello~n"),
	{reply, got_message, State}.

handle_cast(_Request, State) -> {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

code_change(_Old, State, _Extra) -> {ok, State}.

terminate(_Reason, _State) -> ok.