/// @function                 state_machine_init();
/// @description              Initialize the state machine.
function state_machine_init() {
	state=noone;
	state_next=state;
	state_name="Unknown";
	state_timer=0;
	state_map=ds_map_create();
	state_stack=ds_stack_create();
	state_new=true;
	state_var[0]=0; //Useful for storing variables specific to a specific state.
	//Add any new variables you might need for your game here.
	state_can_interrupt=true;
	//Good examples might be
	//state_can_interrupt = false;
	//state_is_invincible = false;
	//state_direction = -1;
}

/// @function                 state_cleanup();
/// @description              Removes related data structures
function state_cleanup() {
	ds_map_destroy(state_map);
	ds_stack_destroy(state_stack);
}

/// @function                 state_create(stateName,scriptName);
/// @param {string}  stateName The name of the state
/// @param {string}  scriptName The name of the state script as found in the asset browser
/// @description              Adds a new state to the state map
function state_create() {
	ds_map_replace(state_map,argument[0],argument[1]);
}

/// @function                 state_execute();
/// @description              Executes the script associated with the current state. Defaults to first state.
function state_execute() {
	if(script_exists(state))
	  script_execute(state)
	else
	  state_switch(ds_map_find_first(state_map));
}

/// @function                 state_switch_previous();
/// @description              sets the currents state to the previous state
function state_switch_previous() {
	ds_stack_pop(state_stack);
	var _state=ds_stack_top(state_stack);
	state_switch(_state,false);
}

/// @function                 state_update();
/// @description              Checks to see if there is a new state to switch to
function state_update() {
	if(state_next != state)	{
	  state=state_next;
	  state_timer=0;
	  state_new=true;
	} else {
	  state_timer++;
	  state_new=false;
	}
}

/// @function                 state_init(stateName);
/// @param {string}  stateName		The state to initialize
/// @description              Sets the default state for the object.  Called only in the create event.
function state_init(stateName) {
	if(is_real(stateName)) {
	    state=stateName;
	    state_name="Unknown (Use the name to switch next time)";
	} else {
	    state=ds_map_find_value(state_map,stateName);
	    state_name=stateName;
	}    
	state_next=state;
	ds_stack_push(state_stack,state);
	state_new=true;
}

/// @function                 state_switch(stateName);
/// @param {string}  stateName  The name of the state to switch to next
/// @description              Show a message whenever the function is called.
function state_switch(stateName) {
	
	if(is_real(stateName))
	{ //you passed a specific script, set it as our next state.
	  state_next=argument[0];
	  state_name="Unknown (Use the name to switch next time)";
	}
	else
	{   //you passed the name of a state, let's try and find it.
	  if(ds_map_exists(state_map,stateName))
	  {
	    state_next=ds_map_find_value(state_map,stateName);
	    state_name=stateName; 
	  }
	  else
	  {
	    show_debug_message("Tried to switch to a non-existent state.  Moving to first state.")
	    state_next=ds_map_find_first(state_map);
	    state_name="Unknown (Tried to switch to a non-existant state)";
	  }
	}
	ds_stack_push(state_stack,state_next);
}

