%% @author billcyz
%% @doc @todo Add description to magic_block_subscription.


-module(magic_block_subscription).

-export([]).

-record(state, {}).
-record(subscription, {subscription_name,
					   subscription_client,
					   subscription_option}).


%% ---------------------------------------------------------------------------

start_link() ->
	gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
	case init_subtable() of
		ok -> {ok, #state{}};
		E -> E
	end.

%% Create initial subscription ets table
%% Table stores subscription basic info
-spec init_subtable() -> 'ok'.
init_subtable() ->
	ok.

%% Start subscription service
-spec start_subscription(atom()) -> 'ok'.
start_subscription(SubName) ->
	
	ok.

%% List subscription service
-spec list_subscriptions() -> list().
list_subscriptions() ->
	1.

%% Add subscription client
-spec add_subscription_client(atom()) -> 'ok'.
add_subscription_client(Client) ->
	1.
