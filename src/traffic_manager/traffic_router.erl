%% @author billcyz
%% @doc @todo Add description to traffic_router.

%% Might not related to this project, but
%% might be a blueprint of future traffic
%% routing design

%% routing method: unicast / multicast
%% load balancing: round robin / random sequence / even


-module(traffic_router).
%% -behavior(gen_server).
%% -export([]).

-export([start_link/1,
		 test_config/1]).

-record(state, {config}).

-record(conf, {unicast,
			   multicast,
			   round_robin,
			   split_even,
			   rand_sequence}).

%% --------------------------------------------------------------

start_link(Config) ->
	gen_server:start_link(?MODULE, Config, []).

%% init(Config) ->
%% 	ConfList = read_config(Config),
%% 	1.
%% 
%% %% load config
%% load_config(ConfList) ->
%% 	gen_server:cast(?MODULE, {init_config, ConfList}).
%% 
%% handle_cast({init_config, ConfList}, S = #state{config = false}) ->
%% 	P = #conf{unicast = false,
%% 			  multicast = false,
%% 			  round_robin = false,
%% 			  split_even = false,
%% 			  rand_sequence = false},
%% 	read_config(ConfList, P),
%% 	{noreply, S#state{config = true}}.


%% test config
test_config(Config) ->
	P = #conf{unicast = false,
			  multicast = false,
			  round_robin = false,
			  split_even = false,
			  rand_sequence = false},
	read_config(Config, P).


%% read_config([], )
read_config([], P) -> P;
read_config(Config, P) ->
	[H|T] = Config,
	case H of
		{unicast, ConfValue} ->
			case ConfValue of
				true -> io:format("Unicast enabled~n");
				false -> io:format("Unicast disabled~n")
			end,
			read_config(T, P#conf{unicast = ConfValue});
		{multicast, ConfValue} ->
			case ConfValue of
				true -> io:format("Multicast enabled~n");
				false -> io:format("Multicast disabled~n")
			end,
			read_config(T, P#conf{multicast = ConfValue});
		{round_robin, ConfValue} ->
			case ConfValue of
				true -> io:format("Round Robin enabled~n");
				false -> io:format("Round Robin disabled~n")
			end,
			read_config(T, P#conf{round_robin = ConfValue});
		{split_even, ConfValue} ->
			case ConfValue of
				true -> io:format("Split Even enabled~n");
				false -> io:format("Split Even disabled~n")
			end,
			read_config(T, P#conf{split_even = ConfValue});
		{rand_sequence, ConfValue} ->
			case ConfValue of
				true -> io:format("Rand Sequence enabled~n");
				false -> io:format("Rand Sequence disabled~n")
			end,
			read_config(T, P#conf{rand_sequence = ConfValue})
	end.






