%% MagicBlock
%% Data: 13/08/2017

%% --- Code Description ---
%% Memory management.

-module(magic_block_memory).

-export([]).

%% ===========================================================================

%% Start backup process
start_backup(Pid) -> 1.

%% Manage backup process
%%% Q: what is required for backup process?
%%% A: original process id; 

manage_backup(Pid, BPid) ->
	1.



%% Create ETS table for process
%% Each process has a memory storage for process backup. Once the process
%% is terminated abnormally, the backup process will retrive necessary
%% data from memory storage of original process, and continute the task.
%%
create_pid_ets(Pid, Type) ->
	case Type of
		1.




