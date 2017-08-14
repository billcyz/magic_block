%% MagicBlock
%% Data: 13/08/2017

%% --- Code Description ---
%% Memory management.

-module(magic_block_memory).

-export([]).

%% ===========================================================================

%% Create ETS table for process
%% Each process has a memory storage for process backup. Once the process
%% is terminated abnormally, the backup process will retrive necessary
%% data from memory storage of original process, and continute the task.
%%
create_pid_ets(Pid, Type) ->
	case Type of
		1.




