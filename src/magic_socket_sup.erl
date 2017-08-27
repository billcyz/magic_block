%% MagicBlock
%% Data: 8/08/2017

%% --- Code Description ---
%% supervisor for magic block socket server

-module(magic_socket_sup).
-behaviour(supervisor).
-export([]).

-export([init/1]).

-include("magic_block_sys.hrl").

%% ===========================================================================

%% Start socket supervisor
start_link(PortSpec) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, [PortSpec]).

init([PortSpec]) ->
	
	magic_block_socket:check_port(PortSpec),
		
	
	{ok, {{one_for_all, 0, 1}, []}}.

%% Start supervisor for UDP port and connection
start_udp_sup(Type) ->
	start_udp_sup(Type, ?DEFAULT_SYS_PORT).

start_udp_sup(Type, Port) when is_integer(Port) ->
	supervisor:start_child(?MODULE,
						   {udp_sup,
							{?MODULE, udp_supervisor, [Port]},
							infinity, supervisor, [udp_supervisor]}).

%% Start supervisor for TCP port and connection
start_tcp_sup(Type, Port) when is_integer(Port) ->
	1.

%% UDP Supervisor
udp_supervisor() -> 1.

%% TCP Supervisor
tcp_supervisor() -> 2.



