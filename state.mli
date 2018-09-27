open Types
open Command

val init_state : Types.state

val step_state : state -> Types.player_action -> state
