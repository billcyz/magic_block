%% @author billcyz
%% @doc @todo Add description to traffic_sup.


-module(traffic_sup).
-behaviour(supervisor).
-export([init/1]).

-export([start_link/0,
		 start_router/1]).


%% ------------------------------------------------------

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
	{ok, {{one_for_all, 0, 60}, []}}.

%% @doc Start router with config options
%% 	start_router(Config) -> router_reply()
%% 		Types
%% 		  	Config = router_config()
%%			
start_router(Config) ->
	supervisor:start_child(traffic_sup, 
						   [{traffic_router,
							 {traffic_router, start_link, [Config]},
							 permanent, worker, 1000, [traffic_router]}]).



