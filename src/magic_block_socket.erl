%% MagicBlock
%% Data: 9/08/2017

%% --- Code Description ---
%% Socket server behaviour for TCP and UDP connection.

-module(magic_block_socket).

-export([]).

%% ===========================================================================

%% Check port open status. If no ports are defined, then check
%% default port.
check_port(PortSpec) -> 
	[ || X <- PortSpec],

 
-spec check_port_status([tuple()]) -> 'ok' | 'no'.
check_port_status(PortList) ->
	case PortList of
		[] -> 1;
		_ -> 2
	end.
