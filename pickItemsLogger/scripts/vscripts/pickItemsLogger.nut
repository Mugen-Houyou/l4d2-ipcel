// Squirrel

pickItemsLogger <-
{
	OnGameEvent_item_pickup = function(tParams)
	{
		if(tParams.item == "adrenaline"){
			printl(format("Logger: [%s] picked an %s", GetPlayerFromUserID(tParams.userid).GetPlayerName(), tParams.item));
		}
		if(tParams.item == "pain_pills"){
			printl(format("Logger: [%s] picked a %s", GetPlayerFromUserID(tParams.userid).GetPlayerName(), tParams.item));
		}
		if(tParams.item == "first_aid_kit"){
			printl(format("Logger: [%s] picked a %s", GetPlayerFromUserID(tParams.userid).GetPlayerName(), tParams.item));
		}
	}
	OnGameEvent_heal_success = function(tParams)
	{
		if(GetPlayerFromUserID(tParams.userid) == GetPlayerFromUserID(tParams.subject)){
			printl(format("Logger: [%s] successfully healed himself/herself", GetPlayerFromUserID(tParams.userid).GetPlayerName()));
		}
		printl(format("Logger: [%s] successfully healed [%s]", GetPlayerFromUserID(tParams.userid).GetPlayerName(), GetPlayerFromUserID(tParams.subject).GetPlayerName()));
	}
	OnGameEvent_map_transition = function(tParams)
	{
		printl("Logger: Now changing the map");
	}
	OnGameEvent_scavenge_gas_can_destroyed = function(tParams)
	{
		printl(format("Logger: [%s] destroyed a gas can", GetPlayerFromUserID(tParams.userid).GetPlayerName()));
	}
};

__CollectEventCallbacks(pickItemsLogger, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

printl("[Items Pickup and Critical Events Logger]\nAuthor: Himawari\nVersion: 1.0r");