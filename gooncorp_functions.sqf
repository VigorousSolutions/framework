//bale2


gooncorp_frameworktest = {
hint "test for framework hardlink successful, its actually a shortcut! C: drive updated!";
};

gooncorp_onplayerrespawn = {
if (player distance specpen < 200) then {
	  [true] call acre_api_fnc_setSpectator;
[] execVM "spectator.sqf";
[player] join grpnull; };
};

gooncorp_search = {
_nBuilding = nearestBuilding player;



if (player distance lastSpot < 5) exitwith {player globalchat "I already searched this area!";};


loc = [];
_searchedbefore = false;
private ["_searchedbefore"];

{
//player sidechat format ["%1 , %2", _x, placessearched];





if (player distance _x < 10) then {
_searchedbefore = true;

};



} foreach placessearched;
if (_searchedbefore  || player distance location3 < 200) exitwith {player globalchat "Already searched this spot.";};

placessearched = placessearched + [lastspot];


if (player distance _nBuilding > 4  ) exitwith {player globalchat "I dont see any buildings!";};
lastSpot = getpos player;











player removeaction search;
_dum = ceil random 120;
_mags = 2 + ceil (random 25);
tik = ceil random 2;
player globalchat "Searching house...";
sleep 1;
player globalchat format [ "Searching house.  This should take about %1 seconds..." , tik];
//if (gad distance player < 50) exitwith  {
//player globalchat "I cannot search this house for some reason, I may have already searched nearby...";
//};

//deletevehicle gad;
//gad = "HeliHEmpty" createVehicle getPos player; 





while {tik > 1} do {
_goz = [] spawn {boot = ceil random 6;
sleep random 2;
//playsound format ["boots0%1", boot];
player switchmove "AinvPknlMstpSnonWrflDr_medic4";
};
tik = tik - 1;
sleep 1;
};








// end weapons


if (random 1 > .8) exitwith {player globalchat "Nothing here...";search = player addaction ["search", "_handle = [] spawn gooncorp_search;"];};
		




allPrimaryWeapons = "
( getNumber ( _x >> 'scope' ) isEqualTo 2
&&
{ getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
&&
{ getNumber ( _x >> 'type' ) isEqualTo 1 } } )
"configClasses ( configFile >> "cfgWeapons" );




_allWeapons = "
( getNumber ( _x >> 'scope' ) isEqualTo 2
&&
{ getText ( _x >> 'simulation' ) isEqualTo 'Weapon'
&&
{ getNumber ( _x >> 'type' ) isEqualTo 2 } } )
"configClasses ( configFile >> "cfgWeapons" );

_allVests = "
( true
&&
{ true
&&
true)
"configClasses ( configFile >> "cfgWeapons" );




_rndallWeapons = configName ( _allweapons select (floor (random (count _allweapons ))) );

//Get a random weapon from the list

_rndWeaponAll = configName ( _allweapons select (floor (random (count _allweapons ))) );
_rndWeapon = configName ( allPrimaryWeapons select (floor (random (count allPrimaryWeapons ))) );

_magazine = ( getArray ( configFile >> "CfgWeapons" >> _rndWeapon >> "magazines" )) select 0 ;
//hint format ["%1", _rndWeapon];



_zon = floor random 2;
//_zon = 3;
_sling = "GroundWeaponHolder" createVehicle getPos player; 

	if (_zon == 0) then {	
_magazine = ( getArray ( configFile >> "CfgWeapons" >> _rndWeapon >> "magazines" )) select 0 ;
iwep = _rndWeapon;
imags = _magazine;
player globalchat "I found something..";

_sling addWeaponCargo [iwep,1]; 
//_sling setPos [(getPos _sling select 0),(getPos _sling select 1),(getPos _sling select 2)]; 
_sling addMagazineCargo [imags,_mags]; _sling setdir (random 360);
//_sling = "handgrenade" createVehicle getPos player; 

//_sling addWeaponCargo [iwep,1]; 
_sling setPos [(getPos _sling select 0),(getPos _sling select 1),((getPosATL player) select 2) + .1]; 
//_sling addMagazineCargo [imags,_mags]; _sling setdir (random 360);
//playsound "buchot1"; 

player switchmove "";
};
if (_zon >= 1) then {


_rndWeapon = configName ( _allweapons select (floor (random (count _allweapons ))) );
_magazine = ( getArray ( configFile >> "CfgWeapons" >> _rndWeapon >> "magazines" )) select 0 ;
iwep = _rndWeapon;
imags = _magazine;
player globalchat "I found something..";

_sling addWeaponCargo [iwep,1]; 
//_sling setPos [(getPos _sling select 0),(getPos _sling select 1),(getPos _sling select 2)]; 
if (!isnil "imags") then {_sling addMagazineCargo [imags,floor random 4]; _sling setdir (random 360);};
//_sling = "handgrenade" createVehicle getPos player; 

//_sling addWeaponCargo [iwep,1]; 
_sling setPos [(getPos _sling select 0),(getPos _sling select 1),((getPosATL player) select 2) + .1]; 
//_sling addMagazineCargo [imags,_mags]; _sling setdir (random 360);
//playsound "buchot1"; 

player switchmove "";


};
if (_zon >= 2) then {


_rndWeapon = configName ( _allvests select (floor (random (count _allvests ))) );

iwep = _rndWeapon;
imags = _magazine;
player globalchat "I found something..";


//if (_rndWeapon isKindOf ["Item", configFile >> "CfgWeapons"]) then {hint "its an item";};



//try {
//_sling addItemCargo [iwep,1]; 
//};

_sling addItemCargo [iwep,1]; 
private ["_magazine"];








_sling addWeaponCargo [iwep,1]; 
//_sling setPos [(getPos _sling select 0),(getPos _sling select 1),(getPos _sling select 2)]; 

//_sling = "handgrenade" createVehicle getPos player; 

//_sling addWeaponCargo [iwep,1]; 
_sling setPos [(getPos _sling select 0),(getPos _sling select 1),((getPosATL player) select 2) + .1]; 
//_sling addMagazineCargo [imags,_mags]; 
_sling setdir (random 360);
//playsound "buchot1"; 

player switchmove "";

_magazine = ( getArray ( configFile >> "CfgWeapons" >> _rndWeapon >> "magazines" )) select 0 ;
if (!isnil "_magazine") then {_sling addMagazineCargo [_magazine,3 + (floor random 7)];};

};
//player setpos getpos _sling;	
//_currentMagazine = getArray ( configFile >> "CfgWeapons" >> primaryWeapon _unit >> "magazines" );

player switchmove "";



search = player addaction ["search", "_handle = [] spawn gooncorp_search;"];

sleep 120;


deletevehicle _sling;






};

gooncorp_spawnai_z = {
if (!isserver) exitwith {};

_eastCount = 0;
private ["_eastCount"];
{
if (side _x == east) then {
_eastCount = _eastCount + 1;
};

} foreach allunits;

if (_eastCount > 220) exitwith {};









_groupAlpha = creategroup east;
x = 0;
_detected = false;
private ["_detected"];
while {x < (_this select 1) } do {
sleep .2;
x = x + 1;
"O_Soldier_F" createUnit [ position (_this select 0), _groupAlpha,"loon1 = this", 0.6, "corporal"];};
{

[_x] call gooncorp_clearclothing_zombie;
//_x move position (_this select 2);
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
_x addMpEventHandler ["mphit", {_this execVM "zombiehit.sqf"}];
_x addMpEventHandler ["mpkilled", {_this execVM "zombiekilled.sqf"}];
} foreach units _groupAlpha;


	[{
["textures\zombiecostume1.paa","textures\zombiecostume2.paa","textures\zombiecostume3.paa","textures\zombiecostume4.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;






_id = [(leader _groupAlpha), (_this select 2)] execFSM "handmele.fsm";


};

gooncorp_spawnailocal_z = {


_eastCount = 0;
private ["_eastCount"];
{
if (side _x == east) then {
_eastCount = _eastCount + 1;
};

} foreach allunits;

if (_eastCount > 320) exitwith {};









_groupAlpha = creategroup east;
x = 0;
_detected = false;
private ["_detected"];
while {x < (_this select 1) } do {
sleep .2;
x = x + 1;
"O_Soldier_F" createUnit [ position (_this select 0), _groupAlpha,"loon1 = this", 0.6, "corporal"];};
{

[_x] call gooncorp_clearclothing_zombie;
_x move position (_this select 2);
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
_x addMpEventHandler ["mphit", {_this execVM "zombiehit.sqf"}];
_x addMpEventHandler ["mpkilled", {_this execVM "zombiekilled.sqf"}];
} foreach units _groupAlpha;




_val = floor random 4;


if (_val == 0) then {
	[{
["textures\zombiecostume1.paa","textures\zombiecostume2.paa","textures\zombiecostume3.paa","textures\zombiecostume4.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};

if (_val == 1) then {
	[{
["textures\zombiecostume2.paa","textures\zombiecostume2.paa","textures\zombiecostume2.paa","textures\zombiecostume2.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};




if (_val == 2) then {
	[{
["textures\zombiecostume3.paa","textures\zombiecostume3.paa","textures\zombiecostume3.paa","textures\zombiecostume3.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};


if (_val == 3) then {
	[{
["textures\zombiecostume4.paa","textures\zombiecostume4.paa","textures\zombiecostume4.paa","textures\zombiecostume4.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
//if (random 1 < .5) then {
//_id = [(leader _groupAlpha), (_this select 2)] execFSM "handmele.fsm";} else {
_id = [(leader _groupAlpha), (_this select 2)] execFSM "handmele.fsm";
//};


};

gooncorp_genericaispawn = {// call with gameobject to spawn them at and amount and destination
if (!isserver) exitwith {};
eastCount = 0;
private ["eastCount"];
{
if (side _x == east) then {
eastCount = eastCount + 1;
};
} foreach allunits;
if (eastCount > 220) exitwith {};
_groupAlpha = creategroup east;
x = 0;
while {x < (_this select 1) } do {
sleep .2;
x = x + 1;
"O_Soldier_F" createUnit [ position (_this select 0), _groupAlpha,"loon1 = this", 0.6, "corporal"];};
{
_x move position (_this select 2);
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
[_x,"insurgentrandomizer"] call gooncorp_fnc_globalgear;
} foreach units _groupAlpha;
};













gooncorp_waves = {
//gooncorp
if (!isserver) exitwith {};



sleep 5;



duration = time;

target = duration + 3200;



while {true} do {

{if (side _x == east) then {_x move position base1};} foreach allunits;

realleft = (((target - (time - duration)) - duration) / 60);
publicvariable "realleft";
sleep .2;
	[{
hint format ["Defend for %1 more minutes!", realleft];






	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;


_artycount = 5 + (floor random 20);
i = 0;
while {i < _artycount} do {
sleep 2 + (random 5);
i = i + 1;
_pos = position town1;
hint "bomb";
_handle = "Missile_AGM_01_F" createvehicle [(_pos select 0) + ((Random 2220)-1210), (_pos select 1)  + ((Random 2240)-1210), 0];
};




sleep 20;

[spawn1, usbase] execVM "retaliateNva2.sqf";

if (random 1 < .3) then {
sleep (random 15);
_pos = getpos napalmer;
lastpos = [(_pos select 0) + ((Random 1220)-510), (_pos select 1)  + ((Random 1240)-510), 0];
publicvariable "lastpos";
sleep .24;
[{
_handle = [lastpos] spawn gooncorp_napalm;
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;// my way works for several years now
};



_val = floor random 4;
//_val = 0;// switch this back
switch (_val) do
{


    case 0:

    {




if (random 1 < .3) then {

if (random 1 < .5) then {
[spawn1, usbase] execVM "retaliateNva.sqf";} else {
[spawn1, usbase] execVM "retaliateNva2.sqf";};

} else {
[spawn1, usbase] execVM "retaliateVc.sqf";
};


    };

	case 1:
    {

if (random 1 < .2) then {
if (random 1 < .5) then {
[spawn2, usbase] execVM "retaliateNva.sqf";} else {
[spawn2, usbase] execVM "retaliateNva2.sqf";
};

} else {
[spawn2, usbase] execVM "retaliateVc.sqf";
};

    };

	case 2:
    {

if (random 1 < .2) then {
if (random 1 < .5) then {
[spawn3, usbase] execVM "retaliateNva.sqf";} else {
[spawn3, usbase] execVM "retaliateNva2.sqf";
};

} else {
[spawn3, usbase] execVM "retaliateVc.sqf";
};

    };

	case 3:
    {

if (random 1 < .2) then {
[spawn4, usbase] execVM "retaliateNva.sqf";} else {
//[spawn4, usbase] execVM "retaliateVc.sqf";
};

    };
	


};

sleep 30;
};
};




gooncorp_retaliatevc = {
if (!isserver) exitwith {};
_p = 0;
{
   if ((side _x) == East && alive _x) then {
    _p = _p + 1;
   };
} forEach allUnits;
if (_p > 120) exitwith {};
_pos = position (_this select 0);
_area = position (_this select 1);


_grp=creategroup east;
"JO_Insurgent_R" CreateUnit [ _pos ,_grp,"szldier1 = this",.1,"sergeant"];
sleep .04;
_randomizer = (ceil random 55);
for "x" from 0 to (5 + _randomizer) do {
"JO_Insurgent_R" CreateUnit [_pos,_grp,"szldier_gis = this",.1,"private"];
sleep .02;
};

call gooncorp_addaddarmor;
sleep 1;

{
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];

	removeallweapons _x ;
	removeAllAssignedItems _x ;
	removeHeadgear _x ;
} foreach units _grp;



[{

["textures\vietnam_vc_goon.paa","textures\nva.jpg"] call gooncorp_aitextures;

},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;


_theLeader = leader _grp;
_theLeader move (position usbase);

sleep 60;
_theLeader = leader _grp;
_handle = [_theLeader, usbase]  execfsm "handmelee.fsm";













};






gooncorp_spectator1 = {

//gdtmod_seagull.sqf
//by HeinBloed
//http://www.gdt-server.net/
//Modified by TinfoilHate for reasons

	private["_keydown_Help", "_keydown_NightVision", "_keydown_camconstruct", "_keydown_switchCamera", "_mousez", "_playableUnits", "_z"];

	gdtmod_seagull_nvg = false;
	gdtmod_seagull_ti = false;
	gdtmod_seagull_camera_on = true;
	gdtmod_seagull_camera_help = false;
	gdtmod_seagull_nvgPressed = 0;
	gdtmod_seagull_players = [specstart];
	
	{if (alive _x && _x distance specPen > 250 and _x != player) then {gdtmod_seagull_players = gdtmod_seagull_players + [_x]; }} foreach allUnits;
	
	gdtmod_seagull_players_count = count gdtmod_seagull_players - 1;
	gdtmod_seagull_initPos	 		= getPos specstart;
	gdtmod_seagull_initDir			= 0;
	gdtmod_seagull_target 			= specstart;
	gdtmod_seagull_players_select 	= 0;

	gdtspec_on = true;

	setAperture -1;
	gdtmod_seagull_camera = "camconstruct" camCreate gdtmod_seagull_initPos;
	gdtmod_seagull_camera setdir gdtmod_seagull_initDir;
	gdtmod_seagull_camera camConstuctionSetParams [gdtmod_seagull_initPos, 20000, 10000];
	gdtmod_seagull_camera cameraeffect ["internal","back"];

	_keydown_help = (finddisplay 46) displayaddeventhandler ["keydown", "
		if ((_this select 1) in (actionkeys 'Help')) then {
			if (not gdtmod_seagull_camera_help) then {
				cutText ['Mousewheel:                     Camera jumps to player positions\nLeft mouse button:                                     Freelock\nRight mouse button:                     Camera locked on Player\nMovement keys and mouse:                          Move camera\n\nQ:                                              Move camera up\nY or Z:                                      Move camera down\nSHIFT Left:                                      Slow movement\n\nNightvision key:                              Nightvision On/Off\n\nWhile the camera is locked on a player you can change between\n1st/3rd person, optics and group view.\nPress the help button to exit the help screen.', 'BLACK OUT'];
				gdtmod_seagull_camera_help = true;
			}
			else {
				cutText ['Mousewheel:                     Camera jumps to player positions\nLeft mouse button:                                     Freelock\nRight mouse button:                     Camera locked on Player\nMovement keys and mouse:                          Move camera\n\nQ:                                              Move camera up\nY or Z:                                      Move camera down\nSHIFT Left:                                      Slow movement\n\nNightvision key:                              Nightvision On/Off\n\nWhile the camera is locked on a player you can change between\n1st/3rd person, optics and group view.\nPress the help button to exit the help screen.', 'BLACK IN'];
				gdtmod_seagull_camera_help = false;
			};
		};
	"];

	_keydown_nightVision = (finddisplay 46) displayaddeventhandler
	["keydown", "
		if ((_this select 1) in (actionkeys 'NightVision')) then
		{
			switch (gdtmod_seagull_nvgPressed) do
			{
				case 0:
				{
					camUseNVG true;
					gdtmod_seagull_nvgPressed = 1;
				};

				case 1:
				{
					camUseNVG false;
					true setCamUseTi 1;
					gdtmod_seagull_nvgPressed = 2;
				};

				case 2:
				{
					camUseNVG false;
					false setCamUseTi 1;
					true setCamUseTi 0;
					gdtmod_seagull_nvgPressed = 3;
				};

				case 3:
				{
					camUseNVG false;
					false setCamUseTi 0;
					true setCamUseTi 4;
					gdtmod_seagull_nvgPressed = 4;
				};

				case 4:
				{
					camUseNVG false;
					false setCamUseTi 4;
					gdtmod_seagull_nvgPressed = 0;
				};
			};
		};"
	];

	_keydown_camConstruct = (finddisplay 46) displayaddeventhandler ["MouseButtonDown", "
		if (((_this select 1) == 0) and (not gdtmod_seagull_camera_on)) then {
			gdtmod_seagull_camera cameraeffect ['internal', 'back'];
			gdtmod_seagull_camera setpos [((position gdtmod_seagull_target) select 0) + ((sin (getdir gdtmod_seagull_target)) * ( - 10)), ((position gdtmod_seagull_target) select 1) + ((cos (getdir gdtmod_seagull_target)) * (- 10)), ((position gdtmod_seagull_target) select 2) + 2];
			gdtmod_seagull_camera setdir getdir gdtmod_seagull_target;
			gdtmod_seagull_camera_on = true;
	  };
	"];

	_keydown_switchCamera = (finddisplay 46) displayaddeventhandler ["MouseButtonDown", "
		if (((_this select 1) == 1) and gdtmod_seagull_camera_on) then {
			if (not (alive (gdtmod_seagull_players select gdtmod_seagull_players_select)) || (gdtmod_seagull_players select gdtmod_seagull_players_select) distance specPen < 200) then {
				while {not (alive (gdtmod_seagull_players select gdtmod_seagull_players_select)) || (gdtmod_seagull_players select gdtmod_seagull_players_select) distance specPen < 200} do {
					gdtmod_seagull_players_select = gdtmod_seagull_players_select + 1;
					if (gdtmod_seagull_players_select > gdtmod_seagull_players_count) then {gdtmod_seagull_players_select = 0};
				};
				gdtmod_seagull_target = vehicle (gdtmod_seagull_players select gdtmod_seagull_players_select);
			};
			gdtmod_seagull_camera cameraeffect ['Terminate', 'back'];
			cutText [format['                   %1', name gdtmod_seagull_target],'PLAIN DOWN'];
			gdtmod_seagull_target switchCamera 'EXTERNAL';
			gdtmod_seagull_camera_on = false;
			gdtmod_seagull_camera_help = false;
	  };
	"];

	_keydown_mouseZ = (findDisplay 46) displayAddEventHandler ["mousezchanged", "
		if (count gdtmod_seagull_players > 0) then {
			_z = _this select 1;
			if (_z  < 0) then {
				gdtmod_seagull_players_select = gdtmod_seagull_players_select - 1;
				if (gdtmod_seagull_players_select < 0) then {gdtmod_seagull_players_select = gdtmod_seagull_players_count};
				while {not (alive (gdtmod_seagull_players select gdtmod_seagull_players_select)) || (gdtmod_seagull_players select gdtmod_seagull_players_select) distance specPen < 200} do {
					gdtmod_seagull_players_select = gdtmod_seagull_players_select - 1;
					if (gdtmod_seagull_players_select < 0) then {gdtmod_seagull_players_select = gdtmod_seagull_players_count};
				};
				gdtmod_seagull_target = vehicle (gdtmod_seagull_players select gdtmod_seagull_players_select);
			}
			else {
				gdtmod_seagull_players_select = gdtmod_seagull_players_select + 1;
				if (gdtmod_seagull_players_select > gdtmod_seagull_players_count) then {gdtmod_seagull_players_select = 0};
				while {not (alive (gdtmod_seagull_players select gdtmod_seagull_players_select)) || (gdtmod_seagull_players select gdtmod_seagull_players_select) distance specPen < 200} do {
					gdtmod_seagull_players_select = gdtmod_seagull_players_select + 1;
					if (gdtmod_seagull_players_select > gdtmod_seagull_players_count) then {gdtmod_seagull_players_select = 0};
				};
				gdtmod_seagull_target = vehicle (gdtmod_seagull_players select gdtmod_seagull_players_select);
			};
			cutText [format['                   %1', name gdtmod_seagull_target], 'PLAIN DOWN'];
			if (gdtmod_seagull_camera_on) then {
			  gdtmod_seagull_camera setpos [((position gdtmod_seagull_target) select 0) + ((sin (getdir gdtmod_seagull_target)) * ( - 10)), ((position gdtmod_seagull_target) select 1) + ((cos (getdir gdtmod_seagull_target)) * (- 10)), ((position gdtmod_seagull_target) select 2) + 2];
			  gdtmod_seagull_camera setdir getdir gdtmod_seagull_target;
			}	else {
			  gdtmod_seagull_target switchCamera 'EXTERNAL';
			};
			gdtmod_seagull_camera_help = false;
		};
	"];

	while {true} do {

		gdtmod_seagull_players = [];
		{if ((alive _x) && (_x distance specPen > 250) && (_x != player) && (vehiclevarname _x != "camman")) then {gdtmod_seagull_players = gdtmod_seagull_players + [_x]; }} foreach allUnits;
		gdtmod_seagull_players_count = count gdtmod_seagull_players - 1;


		if (player distance specPen > 250) exitwith {
			player cameraEffect ["terminate","back"];
			camDestroy gdtmod_seagull_camera;
			(finddisplay 46) displayRemoveEventHandler ["mousezchanged", _keydown_mouseZ];
			(finddisplay 46) displayRemoveEventHandler ["MouseButtonDown", _keydown_switchCamera];
			(finddisplay 46) displayRemoveEventHandler ["MouseButtonDown", _keydown_camConstruct];
			(finddisplay 46) displayRemoveEventHandler ["KeyDown", _keydown_help];
			(finddisplay 46) displayRemoveEventHandler ["KeyDown", _keydown_nightVision];

			sleep 4;
			player switchCamera "INTERNAL";
			player cameraEffect ["terminate", "FRONT"];

			gdtspec_on = false;
			lynx_specModeOut = true;
		};

	  sleep 0.25;
	};
};



gooncorp_retaliatenva2 = {
if (!isserver) exitwith {};
_p = 0;
{
   if ((side _x) == East && alive _x) then {
    _p = _p + 1;
   };
} forEach allUnits;
if (_p > 160) exitwith {};
_pos = position (_this select 0);
_area = position (_this select 1);


_grp=creategroup east;
"JO_Insurgent_R2" CreateUnit [ _pos ,_grp,"szldier1 = this",.4,"sergeant"];
sleep .04;
_randomizer = (ceil random 11);
for "x" from 0 to (22 + _randomizer) do {
"JO_Insurgent_R2" CreateUnit [_pos,_grp,"szldier_gis = this",.4,"private"];
sleep .04;
};

{
_x disableAI "SUPPRESSION";
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
if (random 1 < .3) then {
[_x,"nva_player_rpg"] call gooncorp_fnc_globalgear;} else {
[_x,"insurgent6a"] call gooncorp_fnc_globalgear;
};
} foreach units _grp;
sleep 4;

[{
[  "textures\vietnam_vc_goon.paa", "textures\nva.jpg"] call gooncorp_aitextures_mod1;

},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
_b = "B_G_Offroad_01_armed_F" createvehicle (position (_this select 0));
_VEH = "O_Truck_02_covered_F" createvehicle (position (_this select 0));
_VEH2 = "O_Truck_02_covered_F" createvehicle (position (_this select 0));
_b addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
_VEH addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
_VEH2 addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
{
if (random 1 < .2) then {
_x moveincargo _b;};
if (random 1 < .2) then {
_x moveindriver _b;};
if (random 1 < .2) then {
_x moveindriver _VEH;};
_x moveincargo _VEH;
if (random 1 < .2) then {
_x moveindriver _VEH2;};
} foreach units _grp;
(leader _grp) moveindriver _VEH;
sleep .3;
{
if (side _x == east) then {
_x move position town1;};
} foreach allunits;

sleep 1;
(leader _grp) move position (_this select 1);

sleep 200;

_fairway = _grp addWaypoint [position (_this select 1), 0];
_fairway setWaypointType "move";
_fairway setWaypointBehaviour "combat";
if (random 1 < .5) then {
_fairway setWaypointFormation "LINE";} else {
_fairway setWaypointFormation "WEDGE";};












};


gooncorp_carrier_men = {
if (side player == east) exitwith {};
if (local player) then {
if (random 1 < .2) then {
player setposASL [(getpos pad1 select 0), (getpos pad1 select 1) + random 4, 11.9];} else {
player setposASL [(getpos pad1_outside select 0), (getpos pad1_outside select 1) + random 20, 11.9];
};
};
};



gooncorp_carrier_men_param = {
if (side player == east) exitwith {};
if (local player) then {

player setposASL [(getpos pad1_outside select 0), (getpos pad1_outside select 1) + random 20, 12];

};
};



gooncorp_retaliatenva = {

if (!isserver) exitwith {};
_p = 0;
{
   if ((side _x) == East && alive _x) then {
    _p = _p + 1;
   };
} forEach allUnits;
if (_p > 140) exitwith {};
_pos = position (_this select 0);
_area = position (_this select 1);


_grp=creategroup east;
"JO_Insurgent_R2" CreateUnit [ _pos ,_grp,"szldier1 = this",.1,"sergeant"];
sleep .04;
_randomizer = (ceil random 25);
for "x" from 0 to (2 + _randomizer) do {
"JO_Insurgent_R2" CreateUnit [_pos,_grp,"szldier_gis = this",.1,"private"];
sleep .04;
};

{
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
if (random 1 < .3) then {
[_x,"insurgent5a"] call gooncorp_fnc_globalgear;} else {
[_x,"insurgent6a"] call gooncorp_fnc_globalgear;
};
} foreach units _grp;
sleep 4;

[{
[  "textures\vietnam_vc_goon.paa", "textures\nva.jpg"] call gooncorp_aitextures_mod1;

},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;


(leader _grp) move position (_this select 1);

sleep (200 + (random 320));

_fairway = _grp addWaypoint [position (_this select 1), 0];
_fairway setWaypointType "move";
_fairway setWaypointBehaviour "combat";
if (random 1 < .5) then {
_fairway setWaypointFormation "LINE";} else {
_fairway setWaypointFormation "WEDGE";};












};

gooncorp_limitspeed = {
_vehicle = (_this select 0);
hint "limiting speed";
while {true} do {
_vel = velocity _vehicle;
_vehicle setvelocity [_vel select 0 * .49,_vel select 1 * .49,_vel select 2];
sleep .12;
};

gooncorp_napalmstarter = {
//gooncorp
//2013

debug = false;

plane = (_this select 0);
// 190 138 256 // 130 198 245
ved = velocity plane;
_tracker = true; 
_bullet = _this select 6; 
_dir=getdir _bullet; 
_planedir = getdir plane;
_oldpos = []; 

//////
bombtype = "bomb_04_f";// change this for different bomb
//////
if ((_this select 4) != bombtype) exitwith {};//emergency change this back
//hint format ["is %1", _this select 4];












private ["_oldpos"];

while {not (isnull _bullet)} do { _oldpos = getposASL _bullet; sleep .01;};

lastpos = _oldpos;
publicvariable "lastpos";
sleep .24;
[{
_handle = [lastpos] spawn gooncorp_napalm;
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;// my way works for several years now



//[[_oldpos], "gooncorp_napalm","BIS_fnc_spawn",true,true ] call BIS_fnc_MP;// bi way doesnt work

};

};



gooncorp_groupgear = {
_weaponName = "";
_sweaponName = "";
_hweaponName = "";
_conf = "";
_name = "";
_image = "";
_imgPath = "";
_itemCount = 0;
_items = [];
_i = 0;
_j = 0;

{
	_sweaponName = secondaryWeapon _x;
	_hweaponName = handgunWeapon _x;
	_weaponName = primaryWeapon _x;
	
	_conf = configFile >> "CfgVehicles" >> typeOf _x;
	_name = getText(_conf >> "displayName");
	if(_x getVariable "displayName" != "") then {
		_name = (_x getVariable "displayName");
	};
	_imgPath = _imgPath + format ["<font size='18'>%1 - %2 - %3kg</font><br/>", name _x, _name, round ((loadAbs _x) * 0.1 * 0.45359237 * 10) / 10];
	
	///////////////////////////////////////////////
	//P��ASE JA SEN H�RP�KKEET
	///////////////////////////////////////////////
	if(_weaponName != "") then {
	_conf = configFile >> "CfgWeapons" >> _weaponName;
	_name = getText(_conf >> "displayName");
	_image = getText(_conf >> "picture");
	if((_image find ".paa") == -1) then {_image = _image + ".paa";};
	_imgPath = _imgPath + format ["<font color='#FFFF00'>Primary: </font>%1<br/><img image='%2' width='100' height='50'/>", _name, _image];
	
	_items = primaryWeaponItems _x;
	{	
		_weaponName = _items select _i;
		
		if(_weaponName != "") then {
			_conf = configFile >> "CfgWeapons" >> _weaponName;
			_image = getText(_conf >> "picture");
			if((_image find ".paa") == -1) then {_image = _image + ".paa";};
			_imgPath = _imgPath + format ["<img image='%1' width='50' height='50'/>", _image];
		};
		
		_i = _i + 1;

	} forEach _items;
	_imgPath = _imgPath + "<br/>";
	};
	_i = 0;
	///////////////////////////////////////////////
	//PUTKI JA K�SIASE
	///////////////////////////////////////////////
	if(_sweaponName != "" || _hweaponName != "") then {
	
		if(_sweaponName != "") then {
		_conf = configFile >> "CfgWeapons" >> _sweaponName;
		_name = getText(_conf >> "displayName");
		_imgPath = _imgPath + format ["<font color='#FFFF00'>Launcher: </font>%1  ", _name];
		};
		if(_hweaponName != "") then {
		_conf = configFile >> "CfgWeapons" >> _hweaponName;
		_name = getText(_conf >> "displayName");
		_imgPath = _imgPath + format ["<font color='#FFFF00'>Sidearm: </font>%1", _name];
		};
		
		_imgPath = _imgPath + "<br/>";
		
		if(_sweaponName != "") then {
			_conf = configFile >> "CfgWeapons" >> _sweaponName;
			_image = getText(_conf >> "picture");
			if((_image find ".paa") == -1) then {_image = _image + ".paa";};
			_imgPath = _imgPath + format ["<img image='%1' width='100' height='50'/>", _image];
			
			_items = secondaryWeaponItems _x;
			{	
				_weaponName = _items select _i;
				
				if(_weaponName != "") then {
					_conf = configFile >> "CfgWeapons" >> _weaponName;
					_image = getText(_conf >> "picture");
					if((_image find ".paa") == -1) then {_image = _image + ".paa";};
					_imgPath = _imgPath + format ["<img image='%1' width='50' height='50'/>", _image];
				};
				
				_i = _i + 1;

			} forEach _items;
			_i = 0;
		};
		if(_hweaponName != "") then {
			_conf = configFile >> "CfgWeapons" >> _hweaponName;
			_image = getText(_conf >> "picture");
			if((_image find ".paa") == -1) then {_image = _image + ".paa";};
			_imgPath = _imgPath + format ["<img image='%1' width='50' height='50'/>", _image];
			
			_items = handgunItems _x;
			{	
				_weaponName = _items select _i;
				
				if(_weaponName != "") then {
					_conf = configFile >> "CfgWeapons" >> _weaponName;
					_image = getText(_conf >> "picture");
					if((_image find ".paa") == -1) then {_image = _image + ".paa";};
					_imgPath = _imgPath + format ["<img image='%1' width='50' height='50'/>", _image];
				};
				
				_i = _i + 1;

			} forEach _items;
			_i = 0;
		};
		_imgPath = _imgPath + "<br/>";
	};
	
	_imgPath = _imgPath + format ["<font color='#FFFF00'>Magazines and items: </font>(Click count for info.)<br/>", _x];
	
	///////////////////////////////////////////////
	//MAGAZINES[] LIPPAAT / KRANAATIT...
	///////////////////////////////////////////////

	_items = magazines _x;
	if(count _items > 0) then {
		while{_i < count _items} do {
			_weaponName = _items select 0;
			_itemCount = {_x == _weaponName} count _items;
			
			_conf = configFile >> "CfgMagazines" >> _weaponName;
			_image = getText(_conf >> "picture");
			_name = getText(_conf >> "displayName");
			_imgPath = _imgPath + format ["<img image='%2' width='32' height='32'/><execute expression='systemChat ""Item: %3""'>x%1</execute>, ", _itemCount, _image, _name];
			_items = _items - [_weaponName];
			_i = 0;
			_j = _j + 1;
			if((_j mod 6) == 0) then {_imgPath = _imgPath + "<br/>";};
		};
	};

	///////////////////////////////////////////////
	//ITEMS[] BANDAGE / MORFIINI...
	///////////////////////////////////////////////
	_items = items _x;
	if(count _items > 0) then {
		while{_i < count _items} do {
			_weaponName = _items select 0;
			_itemCount = {_x == _weaponName} count _items;
			
			_conf = configFile >> "CfgWeapons" >> _weaponName;
			_image = getText(_conf >> "picture");
			if((_image find ".paa") == -1) then {_image = _image + ".paa";};
			_name = getText(_conf >> "displayName");
			_imgPath = _imgPath + format ["<img image='%2' width='32' height='32'/><execute expression='systemChat ""Item: %3""'>x%1</execute>, ", _itemCount, _image, _name];
			
			_items = _items - [_weaponName];
			_i = 0;
			_j = _j + 1;
			if((_j mod 6) == 0) then {_imgPath = _imgPath + "<br/>";};
		};
		_imgPath = _imgPath + "<br/>";
	};
	_j = 0;
	///////////////////////////////////////////////
	//ASSIGNEDITEMS[] KIIKARIT / KARTTA...
	///////////////////////////////////////////////
	_items = assignedItems _x;
	if(uniform _x != "") then {_items pushBack (uniform _x);};
	if(vest _x != "") then {_items pushBack (vest _x);};
	
	if(count _items > 0) then {
		while{_i < count _items} do {
			_weaponName = _items select 0;
			_itemCount = {_x == _weaponName} count _items;
			
			_conf = configFile >> "CfgWeapons" >> _weaponName;
			_image = getText(_conf >> "picture");
			if((_image find ".paa") == -1) then {_image = _image + ".paa";};
			_name = getText(_conf >> "displayName");
			_imgPath = _imgPath + format ["<img image='%1' width='32' height='32'/><execute expression='systemChat ""Item: %2""'>*</execute>  ", _image, _name];
			
			_items = _items - [_weaponName];
			_i = 0;
		};
	};
	
	//BACKPACK
	if(backpack _x != "") then {
		_image = getText(configFile >> "CfgVehicles" >> (backpack _x) >> "picture");
		_name = getText(configFile >> "CfgVehicles" >> (backpack _x) >> "displayName");
		if((_image find ".paa") == -1) then {_image = _image + ".paa";};
		_imgPath = _imgPath + format ["<img image='%1' width='32' height='32'/><execute expression='systemChat ""Item: %2""'>*</execute>  ", _image, _name];
	};
	
	_imgPath = _imgPath + "<br/>__________________________________________________<br/>";
	
} forEach units group player;


if(!(player diarySubjectExists "Group")) then {player createDiarySubject ["Group", "Group"];};
player createDiaryRecord ["Group",[format ["GEAR: %1", groupID (group player)],_imgPath]];

};

gooncorp_cavelight = {



_lantern = "#lightpoint" createVehicleLocal [0,0,0];

_lantern setlightBrightness (_this select 2);

_lantern setlightAmbient (_this select 1);

_lantern setlightColor (_this select 1);

_lantern lightAttachObject [(_this select 0), [0,0,(_this select 3)]];





};

gooncorp_findnearestobjects = {
hint "findnearestobjects";
_objects = nearestObjects [player, [""], 300];

{
sleep .5;
hint format ["%1", typeof _x];
} foreach _objects;


};

gooncorp_repairvehicle = {
hint "trying to repair";
if (!isnil "truck1") then {
if (!isnil "heli1") then {
if (heli1 distance truck1 < 19) then {heli1 setdammage 0; heli1 setvehicleammo 1; heli1 setfuel 1;hint "Repairing and refueling vehicle!";};};
if (!isnil "heli2") then {
if (heli2 distance truck1 < 19) then {heli2 setdammage 0; heli2 setvehicleammo 1; heli2 setfuel 1;hint "Repairing and refueling vehicle!";};};
if (!isnil "heli3") then {
if (heli3 distance truck1 < 19) then {heli3 setdammage 0; heli3 setvehicleammo 1; heli3 setfuel 1;hint "Repairing and refueling vehicle!";};};
};

};


gooncorp_m113 = {
if (!isserver) exitwith {};


sleep 4;



z1 setposASL [(getpos m113_1 select 0), (getpos m113_1 select 1), 19.3];
z2 setposASL [(getpos m113_2 select 0), (getpos m113_2 select 1), 19.3];
z3 setposASL [(getpos m113_3 select 0), (getpos m113_3 select 1), 19.3];
z4 setposASL [(getpos m113_4 select 0), (getpos m113_4 select 1), 19.3];
z5 setposASL [(getpos m113_5 select 0), (getpos m113_5 select 1), 19.3];
z6 setposASL [(getpos m113_6 select 0), (getpos m113_6 select 1), 19.3];

heli1 allowdammage false;
heli2 allowdammage false;
heli3 allowdammage false;
_dis = 11.9;
heli1 setposASL [(getpos helipad1 select 0), (getpos helipad1 select 1), _dis];
heli2 setposASL [(getpos helipad2 select 0), (getpos helipad2 select 1), _dis];
heli3 setposASL [(getpos helipad3 select 0), (getpos helipad3 select 1), _dis];

truck1 setposASL [(getpos supportpad1 select 0), (getpos supportpad1 select 1), _dis];

heli1 allowdammage true;
heli2 allowdammage true;
heli3 allowdammage true;

};


gooncorp_delayedmove = {
(_this select 0) setposASL [getpos ((_this select 1) select 0), getpos ((_this select 1) select 1), 11.9];
};


gooncorp_delayedheal = {
(_this select 0) allowdammage false;
sleep 10;
(_this select 0) setdammage 0;
(_this select 0) allowdammage true;

};
//this enableRopeAttach true;

gooncorp_jipaircraft = {
if (!isnil "pilot1") then {
if (player == pilot1) then {
//_veh = "I_Plane_Fighter_03_AA_F" createVehicle [getpos (_this select 0) select 0, getpos (_this select 0) select 1, 4000];
_veh = createVehicle ["I_Plane_Fighter_03_AA_F", [getpos (_this select 0) select 0, getpos (_this select 0) select 1, 4000], [], 0, "fly"];
_veh setpos [getpos (_veh) select 0, getpos (_veh) select 1, 4000];
_veh addEventHandler ["fired", {_this execvm "napalm.sqf"}]; 
_veh addmagazine "4Rnd_Bomb_04_F"; 
_veh addweapon "Bomb_04_Plane_CAS_01_F";
_veh removeweapon "Missile_AA_03_Plane_CAS_02_F";
_veh removeweapon "Missile_AA_04_Plane_CAS_01_F";
_veh removeweapon "missiles_ASRAAM";
_veh addmagazine "20Rnd_Rocket_03_HE_F";
_veh addweapon "Rocket_03_HE_Plane_CAS_02_F";
_veh removeweapon "missiles_Zephyr";
_veh setdir 180;
player moveindriver _veh;
hint "Warning: This aircraft is hard to fly and stalls frequently, make sure to take wide straight turns at high speeds";

sleep 5;


(unitBackpack player) addItemCargoGlobal ["ACRE_PRC117F",1];
[player,"pilot"] call gooncorp_fnc_globalgear;


};
};

};
gooncorp_testfunction = {


sleep 10;

hint "test function 1234";


};

gooncorp_lhd = {


if (!isServer) exitWith {};

private ["_logic", "_pos", "_dir"];

_logic = _this select 0;
_pos = getpos _logic;
_dir = getdir _logic;
_p = 0;
private ["_p"];
private ["_veh"];
private ["_pos"];

_parts = [
	"Land_LHD_house_1",	"Land_LHD_house_2",	
	"Land_LHD_1",	"Land_LHD_2",	"Land_LHD_3",
	"Land_LHD_4",	"Land_LHD_5",	"Land_LHD_6","Land_LHD_elev_R"
];



{

_veh = _x createvehicle _pos;

	_veh setdir _dir;
	_veh setpos _pos;

_p = _p + 1;	

} foreach _parts;





_logic setpos [(getpos _logic) select 0, (getpos _logic select 1) - 100, 0];


_pos = getpos _logic;
_dir = getdir _logic;



systemChat "LHD initilized";
//deletevehicle _logic;




};



gooncorp_aipatrols = {
{[group _x, getPos _x, 1000] call bis_fnc_taskPatrol;} foreach (_this select 0);
};
gooncorp_aipatrols_param = {
{[group _x, getPos _x, (_this select 1)] call bis_fnc_taskPatrol;} foreach (_this select 0);
};


gooncorp_napalm2 = {
_oldpos = (_this select 0);
_damageradius = 140;
_deathradius = 70;

				_slight6 = "#lightpoint" createVehicleLocal [ _oldpos select 0, _oldpos select 1, 10];
				_slight6 setlightBrightness 15.4;
				_slight6 setlightAmbient[.3, .1, 0];
				_slight6 setlightColor[.3, .1, 0];

				_slight1 = "#lightpoint" createVehicleLocal [_oldpos select 0, _oldpos select 1, 10];
				_slight1 setlightBrightness 55.4;
				_slight1 setlightAmbient[1, 1, 1];
				_slight1 setlightColor[1, 1, .9];

			   _color = [1, 1, 1];
			   _obj = (vehicle player);
			   _pos = [lastpos select 0, lastpos select 1, 5];
               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.1, .1, .06];
               _alpha = 0.47 + random 0.12;
               _ps2 = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 75 + random 10, [0, 0, 1], _velocity, 25, 1.36, 1.15, 0, [25 + (random 55)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2 setParticleRandom [3, [4 + (random 10), 4 + (random 10), 1 + random 1], [random 2, random 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps2 setParticleCircle [0.1, [0, 0, 0]];
               _ps2 setDropInterval 0.05;
_alpha = 0.17 + random 0.04;
_color = [.13, .2, .4];
               _ps3 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke
               _ps3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 1 + random 5, [0, 0, 1], _velocity, 1, 1.39, 1.15, 0, [.1 + (random 6)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps3 setParticleRandom [3, [25 + (random 1), 25 + (random 1), 2], [random 2, random 2, 0], 1, 0, [0, 0, 0, 4], 0, 0];
               _ps3 setParticleCircle [0.1, [0, 0, 0]];
               _ps3 setDropInterval 0.01;

_color = [1, 1, 1];
_alpha = 0.31 ;
               _ps4 = "#particlesource" createVehicleLocal _pos;  // this is fire i think yellow
               _ps4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 12, 0], "", "Billboard", 1, 2 + random 3, [0, 0, 5], _velocity, 1, 1.1, 1, 0, [.3 + (random 1)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps4 setParticleRandom [3, [5 + (random 1), 4 + (random 1), 7], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps4 setParticleCircle [0.1, [0, 0, 0]];
               _ps4 setDropInterval 0.022;

_alpha = 0.35 ;
               _ps7 = "#particlesource" createVehicleLocal _pos;  //this is fire i think red
               _ps7 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 1 + random 1, [5, 5, 4], _velocity, 1, 1.1, 1, 0, [.5 + (random .5)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps7 setParticleRandom [3, [1 + (random 1), 4 + (random 1), 9], [random 5, random 2, 1], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps7 setParticleCircle [0.1, [0, 0, 0]];
               _ps7 setDropInterval 0.006;


_alpha = 0.15 ;

               _ps8 = "#particlesource" createVehicleLocal _pos;
               _ps8 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 3, 0], "", "Billboard", 1, 2 + random 4, [5, 5, 10], _velocity, 1, 1, 1, 1, [.01 + (random .01)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", 1];
               _ps8 setParticleRandom [0, [15 + (random 15), 15 + (random 15), 15 + random 15], [25, 25, 53], 14, 3, [0, 0, 0, 12], 1, 0];
               _ps8 setParticleCircle [0.1, [5, 5, 5]];
               _ps8 setDropInterval 0.2;

_alpha = 0.08 ;
               _ps10 = "#particlesource" createVehicleLocal _pos;
               _ps10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 3, [1, 1, 1], _velocity, 1, 1, 1, 1, [.1 + (random .1)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", 1];
               _ps10 setParticleRandom [0, [5, 5, 5], [25, 25, 53], 14, 3, [0, 0, 0, 0], 1, 0];
               _ps10 setParticleCircle [0.1, [5, 5, 5]];
               _ps10 setDropInterval .1;

               _color = [1, 1, .9];
               _ps9 = "#particlesource" createVehicleLocal _pos;
               _ps9 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 5, 0], "", "Billboard", 1, 15, [5, 5, 2], _velocity, 1, 1.4, 0, 0, [.03 + (random .04)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", 1];
               _ps9 setParticleRandom [0, [1 + (random 1), 4 + (random 1), 5 + random 5], [8, 8, 19], 14, 3, [0, 0, 0, 22], 1, 0];
               _ps9 setParticleCircle [0.1, [5, 5, 5]];
               _ps9 setDropInterval 0.001;
sleep .8;
deletevehicle _ps9;
_color = [1, 1, 0];
_velocity = [10, 10, 35];
sleep .05;
_x = 0;
_brightness = 55.4;
while {_x < 50} do {
_brightness = _brightness - 1;
_slight1 setlightBrightness _brightness;
sleep .01;
_x = _x + 1;
};
//hint "1"; //////////////////////////////////////////////////////////// DEBUG
deletevehicle _ps9;
sleep 1 + (random 2);
deletevehicle _ps3;
deletevehicle _slight1;
deletevehicle _ps8;
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], _deathradius];
{
_ps7 setpos getpos _x;
_ps4 setpos getpos _x;

if (random 1 < .2) then {
_ps7 setpos _pos;
_ps4 setpos _pos;
	};

_x setdammage 2 + (getdammage _x);
sleep .5;
} foreach _units;

//hint "2"; //////////////////////////////////////////////////////////// DEBUG
_ps7 setpos _pos;
_ps4 setpos _pos;
_delay = 16 + random 16;
sleep _delay;
{
_x setdammage 2 + (getdammage _x);
sleep .5;
} foreach _units;

deletevehicle _ps10;
deletevehicle _ps8;


_units = nearestobjects [_pos, ["All", "", "House", "Wall"], _damageradius];
{
_x setdammage .4 + (getdammage _x);
_ps4 setpos _pos;
sleep .5;
} foreach _units;
//hint "3"; //////////////////////////////////////////////////////////// DEBUG


_delay = 16 + random 16;
sleep _delay;

hint "4"; //////////////////////////////////////////////////////////// DEBUG

_units = nearestobjects [_pos, ["All", "", "House", "Wall"], _deathradius];
{
_x setdammage .4 + (getdammage _x);
_ps4 setpos getpos _x;
sleep 2;
} foreach _units;

_ps4 setpos _pos;
sleep 10;
//hint "5"; //////////////////////////////////////////////////////////// DEBUG
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], _damageradius];
{
_x setdammage .4 + (getdammage _x);
sleep .5;
} foreach _units;


deletevehicle _ps2;
sleep 5;
deletevehicle _ps7;
sleep 10;

deletevehicle _ps4;

sleep 15;
deletevehicle _slight6;
};






















// sorry this script is so messy i did not feel like formatting it
// enjoy

gooncorp_nuke = {




_oldpos = (_this select 0);
_damageradius = 1240;
_deathradius = 550;


setaperture 14;


				_slight6 = "#lightpoint" createVehicleLocal [ (_oldpos select 0) + 50, (_oldpos select 1) - 50, 60];
				_slight6 setlightBrightness 114.4;
				_slight6 setlightAmbient[.3, .2, 0];
				_slight6 setlightColor[.3, .2, 0];


				_slight6a = "#lightpoint" createVehicleLocal [ _oldpos select 0, (_oldpos select 1) + 50, 60];
				_slight6a setlightBrightness 34.4;
				_slight6a setlightAmbient[.3, .2, 0];
				_slight6a setlightColor[.3, .2, 0];


				_slight6b = "#lightpoint" createVehicleLocal [ (_oldpos select 0) - 50, (_oldpos select 1) - 50, 60];
				_slight6b setlightBrightness 64.4;
				_slight6b setlightAmbient[.3, .2, 0];
				_slight6b setlightColor[.3, .2, 0];









				_slight1bbb = "#lightpoint" createVehicleLocal [(_this select 0) select 0, (_this select 0) select 1, 50];
				_slight1bbb setlightBrightness 2400;
				_slight1bbb setlightAmbient[.93, .90, 1];
				_slight1bbb setlightColor[.93, .90, 1];




				
				_handle = [_slight1bbb] spawn {

						_brightness = 2400;
						_x = 0;
						while {_x < 100} do {
						(_this select 0) setpos [(getpos (_this select 0) select 0), (getpos (_this select 0) select 1), (_x * .9)];
						_brightness = _brightness - 24;
						(_this select 0) setlightBrightness _brightness;
						sleep .01;
						_x = _x + 1;
						};

						deletevehicle (_this select 0);
					};












				_slight1 = "#lightpoint" createVehicleLocal [(_this select 0) select 0, (_this select 0) select 1, 50];
				_slight1 setlightBrightness 600;
				_slight1 setlightAmbient[1, .9, .7];
				_slight1 setlightColor[1, .9, .7];




				
				_handle = [_slight1] spawn {

						_brightness = 600;
						_x = 0;
						while {_x < 600} do {
						(_this select 0) setpos [(getpos (_this select 0) select 0), (getpos (_this select 0) select 1), (_x * .77)];
						_brightness = _brightness - 1;
						(_this select 0) setlightBrightness _brightness;
						sleep .01;
						_x = _x + 1;
						};

						deletevehicle (_this select 0);
					};





















































				_slight1z = "#lightpoint" createVehicleLocal [(_this select 0) select 0, (_this select 0) select 1, 50];
				_slight1z setlightBrightness 300;
				_slight1z setlightAmbient[1, 1, .8];
				_slight1z setlightColor[1, 1, .8];
		

				sleep .05;
				



































			   _color = [1, 1, 1];
			   _obj = (vehicle player);
			   _pos = _oldpos;
               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.1, .1, .1];
               _alpha = 0.97 + random 0.12;
               _ps2 = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 25, [0, 0, 0], _velocity, 25, 1.58, 1.15, 0, [85 + (random 25)], [_color + [0], 		_color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2 setParticleRandom [3, [4 + (random 10), 4 + (random 10), 1 + random 1], [125, 125, 25], 1, 0, [0, 0, 0, 0.2], 0, 0];
               _ps2 setParticleCircle [0.1, [0, 0, 0]];
               _ps2 setDropInterval 0.01;







               _ps2b = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2b setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 6, 0], "", "Billboard", 1, 55, [0, 0, 0], _velocity, 25, 1.39, 1.15, 0, [85 + (random 25)], [_color + [0], 		_color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2b setParticleRandom [3, [245, 245, 35], [2, 2, 4], 1, 0, [0, 0, 0, .2], 0, 0];
               _ps2b setParticleCircle [0.1, [0, 0, 0]];
               _ps2b setDropInterval 0.15;
		_alpha = 0.17 + random 0.12;
		_color = [.13, .13, .06];


               _ps3 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke  balls of smoke
               _ps3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 75, [0, 0, 25], _velocity, 45, 1.11, 1,0, [35 + (random 13)], [_color + [0], _color 		+ [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps3 setParticleRandom [0, [85 + (random 1), 85 + (random 1), 2], [.5, .5, 2], 1, 1, [0, 0, 0, 1.1], 0, 0];
               _ps3 setParticleCircle [0.1, [0, 0, 0]];
               _ps3 setDropInterval 0.01;
_slight6 attachto [_ps3, [0, 0, 15]];



               _ps38 = "#particlesource" createVehicleLocal _pos;  // column of smoke
               _ps38 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 75, [0, 0, 25], _velocity, 45, 1.11, 1,0, [45 + (random 13)], [_color + [0], _color 		+ [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps38 setParticleRandom [0, [15 + (random 1), 15 + (random 1), 5], [.2, .2, 2], 1, 1, [0, 0, 0, 1.4], 0, 0];
               _ps38 setParticleCircle [0.1, [0, 0, 0]];
               _ps38 setDropInterval 0.04;
_slight6 attachto [_ps3, [0, 0, 15]];



               _ps31 = "#particlesource" createVehicleLocal _pos;  // fire
               _ps31 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 8, 0], "", "Billboard", 1, 27, [0, 0, 25], _velocity, 5, 1.11, 1, 0.01, [25 + (random 13)], [_color + [0], _color 		+ [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps31 setParticleRandom [0, [25 + (random 1), 25 + (random 1), 2], [.5, .5, 2], 1, 1, [0, 0, 0, 1], 0, 0];
               _ps31 setParticleCircle [0.1, [0, 0, 0]];
               _ps31 setDropInterval 0.02;
_slight6 attachto [_ps3, [0, 0, 15]];


               _ps22 = "#particlesource" createVehicleLocal _pos;  // dust
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 14, 0], "", "Billboard", 1, 25, [0, 0, 0], _velocity, 25, 1.7, 1, .05, [25 + (random 13)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps22 setParticleRandom [0, [185 + (random 1), 185 + (random 1), 2], [1, 1, 125], .1, .2, [0, 0, 0, .01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.001;



               _ps23 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke  balls of smoke
               _ps23 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 7, 1, 0], "", "Billboard", 1, 2, [0, 0, 25], _velocity, 1, 1.32, 1.15, 0, [145 + (random 13)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps23 setParticleRandom [0, [45 + (random 1), 45 + (random 1), 24], [1, 1, 1], .1, .2, [0, 0, 0, .8], 0, 0];
               _ps23 setParticleCircle [0.1, [0, 0, 0]];
               _ps23 setDropInterval 0.1;

		_color = [1, 1, 1];
		_alpha = 0.11 ;
               _ps4 = "#particlesource" createVehicleLocal _pos;  // residual fire
               _ps4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 9, 0], "", "Billboard", 1, 6, [0, 0, 0], _velocity, 1, 1.12, 1, 0, [1], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps4 setParticleRandom [0, [15 + (random 1), 15, 3], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps4 setParticleCircle [0.1, [0, 0, 0]];
               _ps4 setDropInterval 0.04;



_alpha = 0.15 ;

               _ps14 = "#particlesource" createVehicleLocal _pos;  //sparks
               _ps14 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 16, [5, 5, 15], _velocity, 1, 1.22, 1, 0,[.06], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps14 setParticleRandom [0, [1 + (random 1), 1, 3], [25, 25, 34], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps14 setParticleCircle [0.1, [0, 0, 0]];
               _ps14 setDropInterval 0.0002;


		_alpha = 0.15 ;



		_alpha = 0.25 ;
               _ps10 = "#particlesource" createVehicleLocal _pos;
               _ps10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 13, [1, 1, 25], _velocity, 1, 1.22, 1, 0, [25], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps10 setParticleRandom [0, [125, 125, 35], [1, 1, 1], 14, 3, [0, 0, 0, 0], 1, 0];
               _ps10 setParticleCircle [0.1, [5, 5, 5]];
               _ps10 setDropInterval .02;
		_alpha = 0.1 ;
               _color = [1, 1, .9];


sleep .8;


_color = [1, 1, 0];
_velocity = [10, 10, 35];
sleep .6;
setaperture 20;

sleep .1;
deletevehicle _slight6;





deletevehicle _ps14;
deletevehicle _ps31;
deletevehicle _ps22;

sleep 2;
//deletevehicle _slight1;
deletevehicle _ps2;
_handle = [ player distance _oldpos ] spawn {sleep ((_this select 0) * .0019); playsound "nukesound";player setvelocity [random 3,random 4,5];[4, 1] call BIS_fnc_earthquake;};

sleep .4;
deletevehicle _ps23;


_x = 0;
_brightness = 111.4;


				_slight7 = "#lightpoint" createVehicleLocal [ _oldpos select 0, _oldpos select 1, 200];
				_slight7 setlightBrightness 50.4;
				_slight7 setlightAmbient[.3, .2, 0];
				_slight7 setlightColor[.3, .2, 0];

deletevehicle _ps3;
sleep 1;
_num = 0;
private ["_num"];
sleep 2;

_units = nearestobjects [_pos, ["Wreck","House", "Wall"], 340];
{

_ps4 setpos getpos _x;
if (random 1 < .2) then {

_ps4 setpos _pos;
	};
if (isserver) then {

if (isplayer _x) then 
	{
	if (_x distance _pos < _deathradius) then 
		{
		_x setdammage 2 + (getdammage _x);
		};
if (_x distance _pos < _damageradius) then {
	_x setdammage .2 + (getdammage _x);};
} else {
_num = _num + 1;
if (_num == 10) then {
_num = 0;
_x setdammage 2;} else {
deletecollection _x;
};
};

};

} foreach _units;

sleep 2;
deletevehicle  _slight1z;



deletevehicle _slight7;

				_slight8 = "#lightpoint" createVehicleLocal [ _oldpos select 0, _oldpos select 1, 21];
				_slight8 setlightBrightness 30.4;
				_slight8 setlightAmbient[.3, .2, 0];
				_slight8 setlightColor[.3, .2, 0];

sleep 2;

deletevehicle _ps38;
sleep 14;

sleep 2;



// end of beggining part
/// start loop
_p = 0;
while {_p < 5} do {
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], 340];
{

_ps4 setpos getpos _x;
if (random 1 < .2) then {

_ps4 setpos _pos;
	};
if (isserver) then {
if (_x distance _pos < _deathradius) then {
	_x setdammage 2 + (getdammage _x);
	};
if (_x distance _pos < _damageradius) then {
	_x setdammage .2 + (getdammage _x);
};
};
sleep .3;
} foreach _units;
sleep 30;
_p = _p + 1;
};
/// end loop

deletevehicle _ps10;
deletevehicle _ps2b;
sleep 16;
// end part
deletevehicle _ps2;
sleep 5;

sleep 10;



deletevehicle _ps4;
sleep 15;
deletevehicle _slight8;
deletevehicle _slight6a;
deletevehicle _slight6b;
};
































gooncorp_oldnuke = {




_oldpos = (_this select 0);
_damageradius = 540;
_deathradius = 350;





				_slight6 = "#lightpoint" createVehicleLocal [ _oldpos select 0, _oldpos select 1, 30];
				_slight6 setlightBrightness 25.4;
				_slight6 setlightAmbient[.3, .2, 0];
				_slight6 setlightColor[.3, .2, 0];

				_slight1 = "#lightpoint" createVehicleLocal [_oldpos select 0, _oldpos select 1, 30];
				_slight1 setlightBrightness 700.4;
				_slight1 setlightAmbient[1, 1, 1];
				_slight1 setlightColor[1, 1, .9];

			   _color = [1, 1, 1];
			   _obj = (vehicle player);
			   _pos = _oldpos;
               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.1, .1, .1];
               _alpha = 0.97 + random 0.12;
               _ps2 = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 25, [0, 0, 0], _velocity, 25, 1.54, 1.15, 0, [85 + (random 25)], [_color + [0], 		_color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2 setParticleRandom [3, [4 + (random 10), 4 + (random 10), 1 + random 1], [125, 125, 25], 1, 0, [0, 0, 0, 0.2], 0, 0];
               _ps2 setParticleCircle [0.1, [0, 0, 0]];
               _ps2 setDropInterval 0.01;







               _ps2b = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2b setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 6, 0], "", "Billboard", 1, 55, [0, 0, 0], _velocity, 25, 1.39, 1.15, 0, [85 + (random 25)], [_color + [0], 		_color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2b setParticleRandom [3, [245, 245, 35], [2, 2, 4], 1, 0, [0, 0, 0, .2], 0, 0];
               _ps2b setParticleCircle [0.1, [0, 0, 0]];
               _ps2b setDropInterval 0.15;
		_alpha = 0.17 + random 0.12;
		_color = [.13, .13, .06];


               _ps3 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke  balls of smoke
               _ps3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 75, [0, 0, 25], _velocity, 45, 1.11, 1,0, [15 + (random 13)], [_color + [0], _color 		+ [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps3 setParticleRandom [0, [25 + (random 1), 25 + (random 1), 2], [.5, .5, 2], 1, 1, [0, 0, 0, 2], 0, 0];
               _ps3 setParticleCircle [0.1, [0, 0, 0]];
               _ps3 setDropInterval 0.01;
_slight6 attachto [_ps3, [0, 0, 15]];



               _ps31 = "#particlesource" createVehicleLocal _pos;  // fire
               _ps31 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 8, 0], "", "Billboard", 1, 27, [0, 0, 25], _velocity, 45, 1.13, 1, 0, [15 + (random 13)], [_color + [0], _color 		+ [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps31 setParticleRandom [0, [25 + (random 1), 25 + (random 1), 2], [.5, .5, 2], 1, 1, [0, 0, 0, 5], 0, 0];
               _ps31 setParticleCircle [0.1, [0, 0, 0]];
               _ps31 setDropInterval 0.02;
_slight6 attachto [_ps3, [0, 0, 15]];


               _ps22 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke  balls of smoke
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 11, 2, 0], "", "Billboard", 1, 8, [0, 0, 25], _velocity, 1, 1.22, 1, 0, [25 + (random 13)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps22 setParticleRandom [0, [25 + (random 1), 25 + (random 1), 2], [1, 1, 15], .1, .2, [0, 0, 0, 2], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.01;



               _ps23 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke  balls of smoke
               _ps23 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 7, 1, 0], "", "Billboard", 1, 2, [0, 0, 25], _velocity, 1, 1.32, 1.15, 0, [145 + (random 13)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps23 setParticleRandom [0, [45 + (random 1), 45 + (random 1), 24], [1, 1, 1], .1, .2, [0, 0, 0, .8], 0, 0];
               _ps23 setParticleCircle [0.1, [0, 0, 0]];
               _ps23 setDropInterval 0.1;

		_color = [1, 1, 1];
		_alpha = 0.11 ;
               _ps4 = "#particlesource" createVehicleLocal _pos;  // residual fire
               _ps4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 9, 0], "", "Billboard", 1, 6, [0, 0, 0], _velocity, 1, 1.12, 1, 0, [1], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps4 setParticleRandom [0, [15 + (random 1), 15, 3], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps4 setParticleCircle [0.1, [0, 0, 0]];
               _ps4 setDropInterval 0.04;



_alpha = 0.15 ;

               _ps14 = "#particlesource" createVehicleLocal _pos;  //sparks
               _ps14 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 16, [5, 5, 15], _velocity, 1, 1.22, 1, 0,[.1], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps14 setParticleRandom [0, [1 + (random 1), 1, 3], [25, 25, 34], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps14 setParticleCircle [0.1, [0, 0, 0]];
               _ps14 setDropInterval 0.001;


		_alpha = 0.15 ;



		_alpha = 0.25 ;
               _ps10 = "#particlesource" createVehicleLocal _pos;
               _ps10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 13, [1, 1, 25], _velocity, 1, 1.22, 1, 0, [1], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps10 setParticleRandom [0, [15, 15, 15], [1, 1, 1], 14, 3, [0, 0, 0, 0], 1, 0];
               _ps10 setParticleCircle [0.1, [5, 5, 5]];
               _ps10 setDropInterval .04;
		_alpha = 0.1 ;
               _color = [1, 1, .9];


sleep .8;


_color = [1, 1, 0];
_velocity = [10, 10, 35];
sleep .6;


sleep .1;



deletevehicle _ps14;
deletevehicle _ps31;
deletevehicle _ps22;

sleep 2;

deletevehicle _ps2;
_handle = [ player distance _oldpos ] spawn {player setvelocity [random 3,random 4,5];sleep ((_this select 0) * .0019); playsound "nukesound";player setvelocity [random 3,random 4,5];[1, 1] call BIS_fnc_earthquake;};

sleep .4;
deletevehicle _ps23;


_x = 0;
_brightness = 111.4;


deletevehicle _ps3;
sleep 1;

sleep 2;
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], 340];
{

_ps4 setpos getpos _x;
if (random 1 < .2) then {

_ps4 setpos _pos;
	};
if (isserver) then {
if (_x distance _pos < _deathradius) then {
	_x setdammage 2 + (getdammage _x);
	};
if (_x distance _pos < _damageradius) then {
	_x setdammage .2 + (getdammage _x);
};
};
sleep .1;
} foreach _units;

sleep 2;
deletevehicle _slight1;



sleep 18;



// end of beggining part
/// start loop
_p = 0;
while {_p < 5} do {
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], 340];
{

_ps4 setpos getpos _x;
if (random 1 < .2) then {

_ps4 setpos _pos;
	};
if (isserver) then {
if (_x distance _pos < _deathradius) then {
	_x setdammage 2 + (getdammage _x);
	};
if (_x distance _pos < _damageradius) then {
	_x setdammage .2 + (getdammage _x);
};
};
sleep .3;
} foreach _units;
sleep 30;
_p = _p + 1;
};
/// end loop
deletevehicle _ps10;
deletevehicle _ps2b;
sleep 16;
// end part
deletevehicle _ps2;
sleep 5;

sleep 10;
deletevehicle _ps4;
sleep 15;
deletevehicle _slight6;
};





















gooncorp_napalm = {
_oldpos = (_this select 0);
_damageradius = 140;
_deathradius = 70;

				_slight6 = "#lightpoint" createVehicleLocal [ _oldpos select 0, _oldpos select 1, 10];
				_slight6 setlightBrightness 21.4;
				_slight6 setlightAmbient[.3, .1, 0];
				_slight6 setlightColor[.3, .1, 0];

				_slight1 = "#lightpoint" createVehicleLocal [_oldpos select 0, _oldpos select 1, 10];
				_slight1 setlightBrightness 55.4;
				_slight1 setlightAmbient[1, 1, 1];
				_slight1 setlightColor[1, 1, .9];

			   _color = [1, 1, 1];
			   _obj = (vehicle player);
			   _pos = [lastpos select 0, lastpos select 1, 5];
               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.1, .1, .06];
               _alpha = 0.47 + random 0.12;
               _ps2 = "#particlesource" createVehicleLocal _pos;  // this is black smoke
               _ps2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 75 + random 10, [0, 0, 1], _velocity, 25, 1.36, 1.15, 0, [45 + (random 145)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps2 setParticleRandom [3, [4 + (random 10), 4 + (random 10), 1 + random 1], [random 2, random 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps2 setParticleCircle [0.1, [0, 0, 0]];
               _ps2 setDropInterval 0.05;
_alpha = 0.17 + random 0.04;
_color = [.13, .2, .06];
               _ps3 = "#particlesource" createVehicleLocal _pos;  // this is gray white smoke
               _ps3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 9, 8, 0], "", "Billboard", 1, 1 + random 5, [0, 0, 0], _velocity, 1, 1.39, 1.15, 0, [3 + (random 3)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps3 setParticleRandom [3, [25 + (random 1), 25 + (random 1), 2], [random 2, random 2, 0], 1, 1, [0, 0, 0, 4], 0, 0];
               _ps3 setParticleCircle [0.1, [0, 0, 0]];
               _ps3 setDropInterval 0.01;

_color = [1, 1, 1];
_alpha = 0.31 ;
               _ps4 = "#particlesource" createVehicleLocal _pos;  // this is fire i think yellow
               _ps4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 1, 12, 0], "", "Billboard", 1, 2 + random 3, [0, 0, 5], _velocity, 1, 1.1, 1, 0, [.3 + (random 1)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps4 setParticleRandom [3, [5 + (random 1), 4 + (random 1), 7], [random 4, random 4, 2], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps4 setParticleCircle [0.1, [0, 0, 0]];
               _ps4 setDropInterval 0.022;

_alpha = 0.35 ;
               _ps7 = "#particlesource" createVehicleLocal _pos;  //this is fire i think red
               _ps7 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 3, 12, 0], "", "Billboard", 1, 1 + random 1, [5, 5, 4], _velocity, 1, 1.1, 1, 0, [.5 + (random .5)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps7 setParticleRandom [3, [1 + (random 1), 4 + (random 1), 9], [random 5, random 2, 1], 14, 3, [0, 0, 0, .1], 1, 0];
               _ps7 setParticleCircle [0.1, [0, 0, 0]];
               _ps7 setDropInterval 0.006;


_alpha = 0.15 ;



_alpha = 0.25 ;
               _ps10 = "#particlesource" createVehicleLocal _pos;
               _ps10 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 3, [1, 1, 1], _velocity, 1, 1.3, 1, 1, [2 + (random 7)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", 1];
               _ps10 setParticleRandom [0, [5, 5, 5], [1, 1, 1], 14, 3, [0, 0, 0, 0], 1, 0];
               _ps10 setParticleCircle [0.1, [5, 5, 5]];
               _ps10 setDropInterval .1;
_alpha = 0.1 ;
               _color = [1, 1, .9];
               _ps9 = "#particlesource" createVehicleLocal _pos;
               _ps9 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 5, 0], "", "Billboard", 1, 16, [0, 0, 1], _velocity, 1, 1.52,1, 0, [.007 + (random .02)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", 1];
               _ps9 setParticleRandom [0, [1 + (random 1), 4 + (random 1), 5 + random 5], [.2, .2, 4], 14, 3, [0, 0, 0, 22], 1, 0];
               _ps9 setParticleCircle [0.1, [5, 5, 5]];
               _ps9 setDropInterval 0.0005;
sleep .8;
deletevehicle _ps9;
_color = [1, 1, 0];
_velocity = [10, 10, 35];
sleep .05;
_x = 0;
_brightness = 55.4;
while {_x < 50} do {
_brightness = _brightness - 1;
_slight1 setlightBrightness _brightness;
sleep .01;
_x = _x + 1;
};

deletevehicle _ps9;
sleep 3;
deletevehicle _slight1;
sleep 3;
deletevehicle _ps3;
// end of beggining part
/// start loop
_p = 0;
while {_p < 5} do {
_units = nearestobjects [_pos, ["All", "", "House", "Wall"], 140];
{
_ps7 setpos getpos _x;
_ps4 setpos getpos _x;
if (random 1 < .2) then {
_ps7 setpos _pos;
_ps4 setpos _pos;
	};
if (isserver) then {
if (_x distance _pos < _deathradius) then {
	_x setdammage 2 + (getdammage _x);
	};
if (_x distance _pos < _damageradius) then {
	_x setdammage .2 + (getdammage _x);
};
};
sleep .3;
} foreach _units;
sleep 10;
_p = _p + 1;
};
/// end loop
deletevehicle _ps10;

sleep 16;
// end part
deletevehicle _ps2;
sleep 5;
deletevehicle _ps7;
sleep 10;
deletevehicle _ps4;
sleep 15;
deletevehicle _slight6;
};










gooncorp_heliheal = {
sleep 21;
//hint "healing helis";
heli1 setdammage 0;
heli2 setdammage 0;
heli3 setdammage 0;
heli1 setfuel 1;
heli2 setfuel 1; 
heli3 setfuel 1;
truck1 setdammage 0;
//boat1 setdammage 0;
};



gooncorp_vki = {
gar = "Logic" createVehicle (position lal);
["m3",getPos gar,east,["inf"],4,3,[west,east],"Regional VC and NVA 3rd Division"] call vk_fnc_addMarker;
};

gooncorp_flashlights = {
if (side player == west) then {
player addPrimaryWeaponItem "acc_flashlight";} else {
player addPrimaryWeaponItem "rhs_acc_2dpZenit";
};
};





gooncorp_light2 = {



_lantern = "#lightpoint" createVehicleLocal [0,0,0];

_lantern setlightBrightness .46;

_lantern setlightAmbient[1.1, 1.0, 1];

_lantern setlightColor[1.1, 1.0, 1];

_lantern lightAttachObject [(_this select 0), [0,0,4]];





};



gooncorp_militarylight = {



_lantern = "#lightpoint" createVehicleLocal [0,0,0];

_lantern setlightBrightness 5;

_lantern setlightAmbient[1, 0, 0];

_lantern setlightColor[1, 0, 0];

_lantern lightAttachObject [(_this select 0), [0,0,15]];





};




gooncorp_militarylight_test = {



hint "test";





};


gooncorp_militarylight_param = {



_lantern = "#lightpoint" createVehicleLocal [0,0,0];

_lantern setlightBrightness 5;

_lantern setlightAmbient(_this select 1);

_lantern setlightColor(_this select 1);

_lantern lightAttachObject [(_this select 0), [0,0,15]];





};



gooncorp_light = {



_lantern = "#lightpoint" createVehicleLocal [0,0,0];

_lantern setlightBrightness .16;

_lantern setlightAmbient[1.1, 1.0, 0];

_lantern setlightColor[1.1, 1.0, 0];

_lantern lightAttachObject [(_this select 0), [0,0,4]];





};


gooncorp_vehiclecargo_specific = {
if (!isserver) exitwith {};
clearItemCargoGlobal (_this select 0) ;
clearItemCargoGlobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
(_this select 0) addmagazinecargoglobal ["HandGrenade", 24];
(_this select 0) addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 12];
(_this select 0) addmagazinecargoglobal ["30Rnd_556x45_Stanag", 25];
(_this select 0) addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 25];
};

gooncorp_vehiclecargo_demo_specific = {
if (!isserver) exitwith {};
clearItemCargoGlobal (_this select 0) ;
clearItemCargoGlobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
clearmagazinecargoglobal (_this select 0) ;
(_this select 0) additemcargoglobal ["NVGoggles", 8];
(_this select 0) addmagazinecargoglobal ["HandGrenade", 24];
(_this select 0) addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 12];
(_this select 0) addmagazinecargoglobal ["30Rnd_556x45_Stanag", 25];
(_this select 0) addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 25];
(_this select 0) addmagazinecargoglobal ["SatchelCharge_Remote_Mag",4];
(_this select 0) addmagazinecargoglobal ["ClaymoreDirectionalMine_Remote_Mag",1];
(_this select 0) addmagazinecargoglobal ["ATMine_Range_Mag",3];
};

gooncorp_nilboat = {

if (isnil "west1") then {
deletevehicle boat1;
};

if (!isnil "west1") then {
if (!isplayer west1) then {
deletevehicle boat1;
};
};

};




gooncorp_countarray = {
p = 0;
{
p = p + 1;
} foreach (_this select 0);
p;
};


gooncorp_startmarkersforbuildings = {
if (local player) then {
_closebuildings = nearestObjects [player, ["house"], 1200];
x = 0;
{
_availablepositions = [_x] call BIS_fnc_buildingPositions;
_numberofpositions = [_availablepositions] call gooncorp_countarray;
_Xpos = (getpos _x) select 0;
_Ypos = (getpos _x)select 1;
x = x + 1;
_name = format ["markername%1", x];
_markerstr = createMarkerLocal [_name,[_Xpos,_Ypos]];
_name setMarkerShapeLocal "Rectangle";
_name setMarkerBrushLocal "Solid";
_name setMarkerColorLocal "ColorGrey";
_name setMarkerSizeLocal [1.1 + (_numberofpositions / 6), 1.1 + (_numberofpositions / 6)];
_name setMarkerAlphaLocal 1;
_name setMarkerTextLocal format [" %1", name player];
_name setMarkerdir (getdir _x);
} foreach _closebuildings;
sleep 5;
};
};

gooncorp_playanimationglobally = {
if (playinganimation || vehicle player != player) exitwith {playinganimation = false;
xxx = player;
publicvariable "xxx";
sleep .3;
[{
xxx switchmove "";
xxx switchmove "";
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
xxx = player;
publicvariable "xxx";
xanim = (_this select 0);
publicvariable "xanim";
playinanimation = true;
sleep .3;
[{
xxx switchmove xanim;
},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};

gooncorp_directai = {
{
if (side _x == east) then {
_x move position (_this select 0);
};
} foreach allunits;

};

gooncorp_straightenbuildings = {
if (!isnil "center") then {
areaobjects = nearestObjects [center, [], 1200];
{
_x setVectorUp [0,0,1];
} foreach areaobjects;
};
};


gooncorp_destroygrass = {
hint "destroying grass!";
if (!isnil "center") then {
_areaobjects2 = nearestObjects [center, [], 1200];
{
deletevehicle _x;
hideobject _x;
deleteCollection _x;
} foreach _areaobjects2;
};
};

gooncorp_spawnai = {
if (!isserver) exitwith {};

eastCount = 0;
private ["eastCount"];
{
if (side _x == east) then {
eastCount = eastCount + 1;
};

} foreach allunits;

if (eastCount > 220) exitwith {};









_groupAlpha = creategroup east;
x = 0;
_detected = false;
private ["_detected"];
while {x < (_this select 1) } do {
sleep .2;
x = x + 1;
"O_Soldier_F" createUnit [ position (_this select 0), _groupAlpha,"loon1 = this", 0.6, "corporal"];};
{

[_x] call gooncorp_clearclothing_zombie;
_x move position (_this select 2);
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
} foreach units _groupAlpha;


	[{
["textures\zombiecostume1.paa","textures\zombiecostume2.paa","textures\zombiecostume3.paa","textures\zombiecostume4.paa"] call gooncorp_randomaitextures;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;


_id = [(leader _groupAlpha), (_this select 2)] execFSM "infected.fsm";
while {alive (leader _groupAlpha) && (leader _groupAlpha) distance (_this select 2) > 50 && !_detected} do {
sleep 8;


{
if (_x distance (leader _groupAlpha) < 400) exitwith {_detected = true;};
} foreach playableunits;

{
if (getdammage _x > .1) exitwith {_detected = true;};
} foreach units _groupAlpha;


};





};



gooncorp_genericaispawn = {// call with gameobject to spawn them at and amount and destination
if (!isserver) exitwith {};
eastCount = 0;
private ["eastCount"];
{
if (side _x == east) then {
eastCount = eastCount + 1;
};
} foreach allunits;
if (eastCount > 220) exitwith {};
_groupAlpha = creategroup east;
x = 0;
while {x < (_this select 1) } do {
sleep .2;
x = x + 1;
"O_Soldier_F" createUnit [ position (_this select 0), _groupAlpha,"loon1 = this", 0.6, "corporal"];};
{
_x move position (_this select 2);
_x addEventHandler ["killed", {_this spawn gooncorp_deletebody}];
[_x,"insurgentrandomizer"] call gooncorp_fnc_globalgear;
} foreach units _groupAlpha;
};





















gooncorp_deletebody = {
sleep 20;
deletevehicle (_this select 0);
};

gooncorp_assignboatpositions = {// puts people in boat safely negating jip broken features
if (!isnil "sl1") then {
if (player == sl1) then {
player moveindriver boat1;
};
};
if (!isnil "m1") then {
if (player == m1) then {
player moveInCargo [boat1, 2];
};
};
if (!isnil "mg1") then {
if (player == mg1) then {
player moveInCargo [boat1, 3];
};
};
if (!isnil "eng1") then {
if (player == eng1) then {
player moveInCargo [boat1, 1];
};
};
if (!isnil "rif1") then {
if (player == rif1) then {
player moveInCargo [boat1, 0];
};
};
if (!isnil "sl2") then {
if (player == sl2) then {
player moveindriver boat2;
};
};
if (!isnil "m2") then {
if (player == m2) then {
player moveInCargo [boat2, 0];
};
};
if (!isnil "mg2") then {
if (player == mg2) then {
player moveInCargo [boat2, 2];
};
};
if (!isnil "eng2") then {
if (player == eng2) then {
player moveInCargo [boat2, 3];
};
};
if (!isnil "rif2") then {
if (player == rif2) then {
player moveInCargo [boat2, 1];
};
};
if (!isnil "sl3") then {
if (player == sl3) then {
player moveindriver boat2;
};
};
if (!isnil "m3") then {
if (player == m3) then {
player moveInCargo [boat2, 0];
};
};
if (!isnil "mg3") then {
if (player == mg3) then {
player moveInCargo [boat2, 2];
};
};
if (!isnil "eng3") then {
if (player == eng3) then {
player moveInCargo [boat2, 3];
};
};
if (!isnil "rif3") then {
if (player == rif3) then {
player moveInCargo [boat2, 1];
};
};

if (!isnil "s1") then {
if (player == s1) then {
player moveIndriver boat4;
};
};

if (!isnil "s2") then {
if (player == s2) then {
player moveIncargo boat4;
};
};


if (!isnil "s3") then {
if (player == s3) then {
player moveIncargo boat4;
};
};

if (!isnil "s4") then {
if (player == s4) then {
player moveIncargo boat4;
};
};

if (!isnil "s5") then {
if (player == s5) then {
player moveIncargo boat4;
};
};




};





gooncorp_spectate = {
//[] execVM "spectator.sqf";
};

gooncorp_debugging_toggle = {
if (true) exitwith {};
if (debug) then {debug = false;hint "GOONCORP_DEBUGGING DEACTIVATED";} else {debug = true; _handle = [] spawn gooncorp_debug;hint "GOONCORP_DEBUGGING ACTIVATED";};
};

gooncorp_debugging_helpmenu = {
hint "GOONCORP_DEBUGGING MENU COMMANDS: \n\ncontrol shift - d		(toggle debug menu) \n\ncontrol shift - f		(melee attack) \n\ncontrol shift - h		(fix headbug) \n\ncontrol shift r		(reset gear)\ncontrol shift s		(spectate)";
};

gooncorp_jetpack_init = {
usingJetpack = false;
};
gooncorp_jetpack_loop = {

	

if (!usingJetpack)  exitwith {};
_zzz = 0;
while {true} do {
hintsilent format ["Alt: %1 \n Fuel: %2", ((getpos player) select 2), jetpackfuel];
sleep .01;
if (((getpos player) select 2) > 60) then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = -.3; 
_zzz = _zzz + 1;
if (_zzz >= 55) then {
playsound "SN_Flare_Loop";
zzz = 0;};
_unit setVelocity [(_vel select 0),(_vel select 1),(_vel select 2) + _speed];

};

if (((getpos player) select 2) < 50) then {
jetpackfuel = jetpackfuel - .01;
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = 1; 
_zzz = _zzz + 1;
if (_zzz >= 55) then {
playsound "SN_Flare_Loop";
zzz = 0;};
_unit setVelocity [(_vel select 0),(_vel select 1),(_vel select 2) + _speed];

};


if (!usingJetpack || jetpackfuel < .1 ) exitwith {player allowdammage false; sleep .1;
while {((getpos player) select 2) > 1} do {
sleep .1;
};
player setVelocity [0,0,0.1];
sleep 1; player allowdammage true;};
};
//_handle = [""up""] spawn gooncorp_jetpack;

};

gooncorp_keypress2 = {
usingJetpack = (_this select 0);
//written by gooncorp
// do not copy unless you put my name in your briefing credits
private ["_phandler"];
private ["_phandler2"];
sleep 1;
_pHandler = (findDisplay 46) displayAddEventHandler ["keydown", "



    		if ((_this select 1) in [0x11]) then

	{
	_handle = [""forward""] spawn gooncorp_jetpack;

	};







    		if ((_this select 1) in [0x1E]) then

	{


	};


    		if ((_this select 1) in [0x20]) then

	{


	};




    		if ((_this select 1) in [0x1F]) then

	{
	_handle = [""backward""] spawn gooncorp_jetpack;

	};

"];


_pHandler2 = (findDisplay 46) displayAddEventHandler ["keyup", "






    		if ((_this select 1) in [0x39] ) then

	{

if (usingJetpack) then {usingJetpack = false;} else {usingJetpack = true;};
if (usingJetpack) then {_handle = [] spawn gooncorp_jetpack_loop;};


	

	};



"];










};

gooncorp_jetpack = {

if (   (abs ((velocity player) select 0) + abs ((velocity player) select 1) + abs ((velocity player) select 2) > ((random 5) + 20) && random 1 < .7) ) exitwith {};


if (_this select 0 == "addheight") exitwith {
flyHeight = flyHeight + 1;};
if (_this select 0 == "subtractheight") exitwith {
flyHeight = flyHeight - 1;};
if (_this select 0 == "up") then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = 2; 
_unit setVelocity [(_vel select 0),(_vel select 1),(_vel select 2) + _speed];
};





if (_this select 0 == "forward" && ((getpos player) select 2) > 5) then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = 15; 
_unit setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];
};

if (_this select 0 == "backward" && ((getpos player) select 2) > 5) then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = -15; 
_unit setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
];
};

if (_this select 0 == "right") then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = 1; 
_unit setVelocity [
	(_vel select 0)  + (cos _dir * _speed), 
	(_vel select 1)  + (sin _dir * _speed), 
	(_vel select 2)
];
};

if (_this select 0 == "left") then {
_unit = player;
_vel = velocity _unit;
_dir = direction _unit;
_speed = -1; 
_unit setVelocity [
	(_vel select 0)  + (cos _dir * _speed), 
	(_vel select 1)  + (sin _dir * _speed), 
	(_vel select 2)
];
};
if (((getpos player) select 2) < 5) exitwith {};
if (random 1 < .1) then {
playsound "SN_Flare_Fired_4";};
};

gooncorp_keypress = {
//written by gooncorp
// do not copy unless you put my name in your briefing credits
private ["_phandler"];
sleep 1;
_pHandler = (findDisplay 46) displayAddEventHandler ["keydown", "
	if ((_this select 1) in [0x20] && (_this select 2) && (_this select 3) ) then
	{
	call gooncorp_debugging_toggle;
	};
	if ((_this select 1) in [0x3B] && (_this select 2) && (_this select 3)) then
	{
	call gooncorp_debugging_helpmenu;
	};
		if ((_this select 1) in [0x1F] && (_this select 2) && (_this select 3)) then
	{
	call gooncorp_specate;
	};
		if ((_this select 1) in [0x12]  && (_this select 2)) then
	{
	_handle = [] spawn  gooncorp_stab;

	};
		if ((_this select 1) in [0x52]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""""] spawn gooncorp_playanimationglobally ;
	};

		if ((_this select 1) in [0x4F]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_A_M04_briefing""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x50]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_HeliCargoTalking_loop""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x51]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_SittingWounded_wave""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x4B]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_EpicSplit""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x4C]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_Abuse_abuser""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x4D]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_CrouchGetLowGesture""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x47]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_Kore_PointingForward""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x48]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""Acts_PknlMstpSlowWrflDnon""] spawn gooncorp_playanimationglobally ;
	};
		if ((_this select 1) in [0x49]  && (_this select 2) && (_this select 3)) then
	{
        _handle = [""passenger_injured_medevac_truck02""] spawn gooncorp_playanimationglobally ;
	};
"];
};


// function to determine distance of unit from given gameobject and waits until that unit is within distance of gameobject to return
// params [gameobject, gameobject, int, bool];
gooncorp_logic_unit_location_check = {


};


gooncorp_stab = {
hint "stabbing";
_objects = (position player) nearEntities [["Man"], 2];
hasStabbed = false;
{
if (side _x != (side player) && alive _x) exitwith {
hasStabbed = true;
rNum = floor random 4;
if (rNum == 0) then {
player globalchat "Eat it!";};
if (rNum == 1) then {
player globalchat "Die!";};
if (rNum == 2) then {
player globalchat "Take cold steel!";};
if (rNum == 3) then {
player globalchat "Your life has ended.";};
	strangler = player;
	victim = _x;
	myscore = score player;
	myscore = myscore + 1;
	publicvariable "strangler";
	publicvariable "victim";
	publicvariable "myscore";
	sleep .27;
	//[{
	//},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	[{
//victim say3d "Splat";
strangler switchmove "AwopPercMstpSgthWpstDnon_Part4";
strangler attachto [victim, [0, -.7, 0]];
sleep .1;
chuck = victim;
lal = random 330;
val = round lal;
if (player distance chuck <150) then {
	//chuck say3d format ["ACE_scream%1",val];
};
               obj = vehicle victim;
               pos = position obj;
               magracity = [0,0,.1];
               color = [.5, 0, 0];
               alpha = .7;
               ps11 = "#particlesource" createVehicleLocal pos;
               ps11 setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 4, 12], "", "Billboard", 1, 2, [0, 0, .6], wind, 1, 2, 1, 0, [.004 + (random .02)], [color + [0], color + [alpha], color + [0]], [1000], 1, 1, "", "", obj];
               ps11 setParticleRandom [.1, [0, 0, 1], [random 1, random 1, 1.5], 1, 0, [0, 0, .2, 1.1], 0, 1];
               ps11 setParticleCircle [0, [0, 0, 0]];
               ps11 setDropInterval .01;
	victim switchmove "c5efe_AlexDeath";
	sleep .9;
	strangler switchmove "";
	detach strangler;
	ps11 setpos getpos victim;
	strangler addscore 1;
	sleep .2;
victim setdammage 2;
deletevehicle ps11;
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
} foreach _objects;
if (!hasStabbed) then {
rNum = floor random 4;
if (rNum == 0) then {
player globalchat "Stab who, yourself?";};
if (rNum == 1) then {
player globalchat "No one is around...";};
if (rNum == 2) then {
player globalchat "You cannot see any enemies nearby.";};
if (rNum == 3) then {
player globalchat "You really like playing with knives dont you?";};
};
};






gooncorp_tvt_scoresimple =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x && _x distance specpen > 200) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = ["end4"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount == 0 && !ended) then {
		ended = true;
		[{_handle = ["end3"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
	sleep 10;
	};
};

gooncorp_tvt_scoresimple_hvt =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x && _x distance specpen > 200) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = ["end4"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount == 0 && !ended) then {
		ended = true;
		[{_handle = ["end3"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};


		if (hvt distance pad1 < 200 && !ended) then {
		ended = true;
		[{_handle = ["end5"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};

	sleep 10;
	};
};
gooncorp_coop_scoresimple =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200 && isPlayer _x) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = [] spawn gooncorp_warriorending_lose;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount < (_this select 0) && !ended) then {
		ended = true;
		[{_handle = ["end2"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
	sleep 10;
	if (random 1 < .2) then {
	[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	};
	};
};
gooncorp_coop_scoresimple2 =
	{
	if (!isserver) exitwith {};
	ended = false;
		while {true } do {
			enemyCount = 0;
			friendlyCount = 0;
				{
				if (side _x == east && alive _x) then {
					enemyCount = enemyCount + 1;
				};
				if (side _x == west && alive _x && _x distance specpen > 200 && isPlayer _x) then {
					friendlyCount = friendlyCount + 1;
				};
			} foreach allunits;
		if (friendlyCount == 0 && !ended) then {
		ended = true;
		[{_handle = [] spawn gooncorp_warriorending_lose;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
		if (enemyCount < (_this select 0) && !ended) then {
		ended = true;
		[{_handle = ["end2"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		};
	sleep 10;

	};
};



gooncorp_debug = {
while {true} do {
if (!debug) exitWith {};
totalOpfor = 0;
totalBlufor = 0;
{
if (side _x == east && alive _x) then {
totalOpfor = totalOpfor + 1;
};
if (side _x == west && alive _x) then {
totalBlufor = totalBlufor + 1;
};
} foreach allunits;
hintsilent format ["GOONCORP DEBUGGING: \n \n pos:%1 \n  magazine count : %2 \n all units: %3 \n total blufor count: %4 \n total opfor count: %5 \n time: %6 \n damage taken: %7 \n classname: %8 \n faction: %9 \n group count: %10", position player,
count magazines player, count allunits, totalBlufor, totalOpfor, time, damage player, typeof player, side player, count units (group player)];
sleep 4;
};
};


gooncorp_blackin = {
_zal = floor random 5;
if (_zal == 0) exitwith {
titlecut ["You are on an elite Special Forces Team!", "black in", 10];
};
if (_zal == 1) exitwith {
titlecut ["Saddle up! Lock and Load!", "black in", 10];
};
if (_zal == 2) exitwith {
titlecut ["Get ready to rip some heads off.", "black in", 10];
};
if (_zal == 3) exitwith {
titlecut ["Motivation, Dedication.", "black in", 10];
};
if (_zal == 4) exitwith {
titlecut ["Check your weapons.", "black in", 10];
};
titlecut ["Check your weapons.", "black in", 10];
};













gooncorp_enemyweapons = {
if (!isserver) exitwith {};
{
if (side _x == east) then {
sleep .1;
_handle = [_x,"insurgentrandomizer"] call gooncorp_fnc_globalgear;
};
} foreach allunits;
};





gooncorp_boatmanipulator = {
if (vehicle player != player) exitwith {hint "Your in the boat, you cant move it from there!";};
if (movingalready) exitwith {hint "I'm already moving!";};
hint "I'm trying to move the boat! If I cannot move it I must get into driver seat first, then get out and move it again!";
movingalready = true;
if ((_this select 0) == "forward") then {
_vehicle = (_this select 1);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = 4;
_vehicle setVelocity [	(_vel select 0) + (sin _dir * _speed), 	(_vel select 1) + (cos _dir * _speed), 	(_vel select 2)];};
if ((_this select 0) == "backward") then {
_vehicle = (_this select 1);
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = -3;
_vehicle setVelocity [	(_vel select 0) + (sin _dir * _speed), 	(_vel select 1) + (cos _dir * _speed), 	(_vel select 2)];};
sleep 5;
movingalready = false;
};







// end script for vietcong day 1 on porto
gooncorp_informationextracted = {
briefcase removeaction info;
player additem "cse_notebook";
sleep 1;
[{hint "Information extracted!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 5;
[{hint "You got the papers! Leave that briefcase behind and get to that exfil zone!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 5;
_handle = [center] spawn gooncorp_orderallenemiestoposition;
//_handle = [] spawn gooncorp_checkextract;
while {true} do {
sleep 10;
[{hint "Waiting on extract! Get off that island with the documents!";},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;


endingTriggered = false;
if (player distance center > 700 && !endTriggered) then {
endingTriggered = true;
[{_handle = ["end1"] spawn gooncorp_warriorending_win;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};


};
};




gooncorp_jipteleport = {
mantle = player addAction ["Teleport to squad leader", "_handle = [] spawn gooncorp_jipTeleportFunction"];
};

gooncorp_boataction = {
zing = (vehicle player) addAction ["Get out of boat", "_handle = [] spawn gooncorp_getoutofboat"];
};

gooncorp_getoutofboat = {
sleep .1;
player setpos getpos (vehicle player);
};

gooncorp_jipTeleportFunction = {
player removeaction mantle;
hint "Teleporting to squad leader!";
if (vehicle (leader group player) == (leader group player)) then {
player setpos getpos (leader group player);
} else {
player moveincargo (vehicle (leader group player));
};
};




gooncorp_vehiclecargo = {

if (!isserver) exitwith {};

clearItemCargoGlobal boat1;
clearItemCargoGlobal boat2;

clearmagazinecargoglobal boat1;
clearmagazinecargoglobal boat2;

boat1 addmagazinecargoglobal ["HandGrenade", 14];
boat2 addmagazinecargoglobal ["HandGrenade", 14];

boat2 addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 5];
boat1 addmagazinecargoglobal ["rhsusf_100Rnd_762x51", 5];

boat2 addmagazinecargoglobal ["30Rnd_556x45_Stanag", 42];
boat1 addmagazinecargoglobal ["30Rnd_556x45_Stanag", 42];

boat2 addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 32];
boat1 addmagazinecargoglobal ["rhsusf_20Rnd_762x51_m118_special_Mag", 32];


};

gooncorp_jip = {
if (!isServer && isNull player) then {
waitUntil {!isNull player};
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
hint "I just jipped in!";
call gooncorp_jipteleport;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 10;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
sleep 60;
[{call gooncorp_jipcatchup;},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
};
};

gooncorp_jipcatchup = {
//call gooncorp_playertextures;
};

// move all enemies to a position, called with gameobject that is the position of where you want them all to move to
gooncorp_orderallenemiestoposition = {
{
if (alive _x && side _x == east) then {
sleep random 10;
_x move position (_this select 0);
};
} foreach allunits;
};



gooncorp_spreadenemies = {// called on group with leader buildingai1
if (isnil "buildingai1") exitwith {};
_locations = position buildingai1;
_range = 51;
_zig = 4 + floor random 10;
_biz = 1;
_height = [0,100];
_location = position buildingai1;
_bpos = [];
_r = 99;
_spot = [];
private ["_r"];
private ["_spot"];
{
  for [{_i = 0;_p = _x buildingpos _i},{str _p != "[0,0,0]"},{_i = _i + 1;_p = _x buildingpos _i}] do {
    _bpos set [count _bpos,_p];
  };
} foreach (nearestObjects [_location, ["house"], _range]);
private ["_tmp","_min","_max","_h"];
_tmp = [];
_min = _height select 0;
_max = _height select 1;
{
  _h = _x select 2;
   _tmp set [count _tmp,_x] ;
} foreach _bpos;
if (count _tmp > 0) then {
{
_spot = (_tmp select _biz);
_r = _r + 1;
_x setpos _spot;
_r = 0;
_biz = ((floor random count _tmp) + (floor random 4));
_spot = (_tmp select _biz);
_x setpos _spot;
//_x disableAI "MOVE";
[_x]  join grpnull;
_x setdir (random 360);
};
} foreach units (group buildingai1);
};


gooncorp_fog1 = {//particles looks like great sandstorm start


[] spawn {


        while {true} do {


			   _obj = (vehicle player);
			   _pos = getposASL _obj;

               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.13, .2, .4];
               _alpha = 0.05 + random 0.52;
               _ps22 = "#particlesource" createVehicleLocal _pos;
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 24, [0, 0, 10], _velocity, 1, 1.275, 1, 0, [25 + (random 181)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
               _ps22 setParticleRandom [3, [500 + (random 10), 500 + (random 10), 45 + random 35], [random 2, random 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.008;

               sleep 1 + (random 2);

               _delay = 6 + random 16;
               sleep _delay;
                 deletevehicle _ps22;

        };
};

};



gooncorp_fog3 = {//particles fallout fog


[] spawn {


        while {true} do {


			   _obj = (vehicle player);
			   _pos = getposASL _obj;

               //--- Dust
                       setwind [0.401112*2,0.204166*2,false];
               _velocity = wind;
               _color = [.13, .3, .2];
               _alpha = 0.25 + random 0.12;
               _ps22 = "#particlesource" createVehicleLocal _pos;
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 24, [0, 0, 0], _velocity, 25, 1.275, 1, 0, [5 + (random 45)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
               _ps22 setParticleRandom [3, [200 + (random 10), 200 + (random 10), .1 + random 5], [random 2, random 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.008;

               sleep 1 + (random 2);

               _delay = 6 + random 16;
               sleep _delay;
                 deletevehicle _ps22;

        };
};

};






























































gooncorp_fog = {//particles


[] spawn {


        while {true} do {
		if (((getposATL player) select 2) < 200) then {
		_obj = (vehicle player);
	        _pos = getposASL _obj;
               setwind [0.401112*2,0.204166*2,false];
               _n =  abs(wind select 0) + abs(wind select 1) + abs(wind select 2);
               _velocity = wind;
               _color = [.38, .33, .2];
               _alpha = 0.55 + random 0.12;
               _ps22 = "#particlesource" createVehicleLocal _pos;
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 30, [0, 0, 0], _velocity, (_n * 2), 1.275, 1, 1, [75 + (random 46)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", _obj];
               _ps22 setParticleRandom [3, [400 + (random 8), 400 + (random 10), 75], [2, 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.019;

               _delay = 15 + (random 5);
               sleep _delay;

               deletevehicle _ps22;
};
sleep 12;


        };
     };
};





gooncorp_fog_parameterized = {//particles

theColor = (_this select 0);
[] spawn {


        while {true} do {
          if (((getposATL player) select 2) < 200) then {
          _obj = (vehicle player);
             _pos = getposASL _obj;
               setwind [0.401112*2,0.204166*2,false];
               _n =  abs(wind select 0) + abs(wind select 1) + abs(wind select 2);
               _velocity = wind;
               _color = theColor;
               _alpha = 0.55 + random 0.12;
               _ps22 = "#particlesource" createVehicleLocal _pos;
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 45, [0, 0, 0], _velocity, (_n * 2), 1.275, 1, 1, [75 + (random 46)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", _obj];
               _ps22 setParticleRandom [3, [400 + (random 8), 400 + (random 10), 75], [2, 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.019;

               _delay = 155 + (random 5);
               sleep _delay;

              deletevehicle _ps22;
};
sleep 1;


        };
     };
};



gooncorp_fog_parameterized2 = {//particles // has second parameter for thickness

theColor = (_this select 0);

alpha = (_this select 1);


[] spawn {


        while {true} do {
          if (((getposATL player) select 2) < 200) then {
          _obj = (vehicle player);
             _pos = getposASL _obj;
               setwind [0.401112*2,0.204166*2,false];
               _n =  abs(wind select 0) + abs(wind select 1) + abs(wind select 2);
               _velocity = wind;
               _color = theColor;
               _alpha = alpha + random 0.12;
               _ps22 = "#particlesource" createVehicleLocal _pos;
               _ps22 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 45, [0, 0, 0], _velocity, (_n * 2), 1.275, 1, 1, [75 + (random 46)], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", _obj];
               _ps22 setParticleRandom [3, [400 + (random 8), 400 + (random 10), 75], [2, 2, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
               _ps22 setParticleCircle [0.1, [0, 0, 0]];
               _ps22 setDropInterval 0.019;

               _delay = 155 + (random 5);
               sleep _delay;

               deletevehicle _ps22;
};
sleep 1;


        };
     };
};

















gooncorp_remotecontrolreset = {
hint "reset";
player remotecontrol boat1;
sleep 1;
man1 moveindriver boat3;
};





gooncorp_destroybuildingsinradius = {// called with (gameobjectlocatiion gameObject, radius float)
_buildings = position (_this select 0) nearObjects ["House",(_this select 1)];
{
if (_x distance proclusionarea > 50 && typeof _x != "Land_i_Stone_HouseBig_V1_F" && typeof _x != "Land_Slum_House03_F" && typeof _x != "Land_i_Addon_03_V1_F" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut01" && typeof _x != "Land_hut02" && typeof _x != "Land_hut03" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut04" && typeof _x != "Land_Mound01_8m_F" && typeof _x != "MAP_t_sorbus2s" && side _x != east && side _x != west) then {





hideobject _x;};

} foreach _buildings;
};





gooncorp_destroybuildingsinradius2 = {// called with (gameobjectlocatiion gameObject, radius float)
_buildings = position (_this select 0) nearObjects ["House",(_this select 1)];
{
if (!(_x in (_this select 2)) && side _x != east && side _x != west) then {

deletevehicle _x;
deletecollection _x;
//_x setdammage 1;
hideobject _x;};

} foreach _buildings;
};

gooncorp_destroyallbuildingsinradius = {// called with (gameobjectlocatiion gameObject, radius float)
_buildings = position (_this select 0) nearObjects ["All",(_this select 1)];
{
if (_x distance proclusionarea > 50 && typeof _x != "Land_i_Stone_HouseBig_V1_F" && typeof _x != "Land_Slum_House03_F" && typeof _x != "Land_i_Addon_03_V1_F" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut01" && typeof _x != "Land_hut02" && typeof _x != "Land_hut03" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut04" && typeof _x != "Land_Mound01_8m_F" && typeof _x != "MAP_t_sorbus2s" && side _x != east && side _x != west) then {
hideobject _x;};

} foreach _buildings;
};

gooncorp_destroybuildingsinradius_vietnamhuts = {// called with (gameobjectlocatiion gameObject, radius float, procdistance float)

 _procdistance = (_this select 3);
_buildings = position (_this select 0) nearObjects ["House",(_this select 1)];
//Land_Mound01_8m_F
{
if (_x distance proclusionarea >  _procdistance && side _x != east && side _x != west) then {
//
if (isserver) then {
_buildings = position (_this select 0) nearObjects ["House",(_this select 1)];
_rnum = floor random 9;
private ["_veh"];

if (_rnum == 0) then {
_veh = "Land_hut01" createVehicle position _x;
};
if (_rnum == 1) then {
_veh = "Land_hut02" createVehicle position _x;
};
if (_rnum == 2) then {
_veh = "Land_hut03" createVehicle position _x;
};
if (_rnum == 3) then {
_veh = "Land_hut04" createVehicle position _x;
};
if (_rnum == 4) then {
_veh = "Land_Slum_House03_F" createVehicle position _x;
};
if (_rnum == 5) then {
_veh = "Land_i_Addon_03_V1_F" createVehicle position _x;
};
if (_rnum == 6) then {
_veh = "Land_i_Stone_Shed_V1_F" createVehicle position _x;
};
if (_rnum == 7) then {
_veh = "Land_i_Stone_HouseBig_V1_F" createVehicle position _x;
};

if (!isnil "_veh") then {
_veh setdir (getdir _x);};
};

if (_x distance proclusionarea > _procdistance && typeof _x != "Land_i_Stone_HouseBig_V1_F" && typeof _x != "Land_Slum_House03_F" && typeof _x != "Land_i_Addon_03_V1_F" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut01" && typeof _x != "Land_hut02" && typeof _x != "Land_hut03" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut04" && typeof _x != "Land_Mound01_8m_F" && typeof _x != "MAP_t_sorbus2s" && side _x != east && side _x != west) then {
deletecollection _x;
hideobject _x;};
};

} foreach _buildings;

_buildings = position (_this select 0) nearObjects ["Walls",(_this select 1)];
{
//
if (isserver) then {
_rnum = floor random 4;
private ["_veh"];

_veh = "Land_Mound01_8m_F" createVehicle position _x;
_veh setdir (getdir _x);
};
if (_x distance proclusionarea > 50 && typeof _x != "Land_i_Stone_HouseBig_V1_F" && typeof _x != "Land_Slum_House03_F" && typeof _x != "Land_i_Addon_03_V1_F" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut01" && typeof _x != "Land_hut02" && typeof _x != "Land_hut03" && typeof _x != "Land_i_Stone_Shed_V1_F" && typeof _x != "Land_hut04" && typeof _x != "Land_Mound01_8m_F" && typeof _x != "MAP_t_sorbus2s" && side _x != east && side _x != west) then {
hideobject _x;};
} foreach _buildings;
};



gooncorp_respawnevent = {
//call BIS_fnc_respawnSpectator;
};



gooncorp_warriorending_win = {
hint "Someone has achieved a Victory...";
sleep 10;
disableuserinput true;
call gooncorp_putaiinair;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((_this select 0) == "end1") then {
"end1" call BIS_fnc_endMission;};
if ((_this select 0) == "end2") then {
"end2" call BIS_fnc_endMission;};
if ((_this select 0) == "end3") then {
"end3" call BIS_fnc_endMission;};
if ((_this select 0) == "end4") then {
"end4" call BIS_fnc_endMission;};
disableuserinput false;
};



gooncorp_warriorending_lose = {
sleep 10;
disableuserinput true;
call gooncorp_putaiinair;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
if ((paramsarray select 0) == 1) then {
_handle = [] spawn gooncorp_ordered_killcounter;};
sleep 10;
["epicFail",false,2] call BIS_fnc_endMission;
disableuserinput false;
};


































gooncorp_putaiinair = {
{
if (!isplayer _x && alive _x) then {
_x setpos [(getpos _x select 0), (getpos _x select 1), 5000];
};
} foreach allunits;
};



gooncorp_briefingcustominsertion = {
if (player == a1) then {
globalStartPos = position player;
player sidechat "You are the Mission Commander! Set insertion zone by left clicking once on map!";
onMapSingleClick "globalStartPos = _pos;";
sleep 1;
"start" setmarkerpos globalStartPos;
boat1 setpos [(globalStartPos select 0) + 10, (globalStartPos select 1), 0];
boat2 setpos [(globalStartPos select 0) + 20, (globalStartPos select 1), 0];
boat3 setpos [(globalStartPos select 0) - 10, (globalStartPos select 1), 0];
};
};


gooncorp_counttotalscore = {
	if (!isserver) exitwith {};

		while {true} do {
opforscore = 0;
bluforscore = 0;

{
if (side _x == east) then {
opforscore = opforscore + 1;
};

if (side _x == west) then {
bluforscore = bluforscore + 1;
};

} foreach playableunits;

sleep 15;
	[{
hint format ["blufor score is %1\nopfor score is %2", bluforscore, opforscore];
	},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

};
};


gooncorp_addaddarmor = {
{
if (!isserver) exitwith{};
if (side _x == east) then {
_x addEventHandler ["HandleDamage", {_this call gooncorp_addarmor}];
};
} foreach allunits;
};

gooncorp_addreducearmor = {
{
if (!isserver) exitwith{};
if (side _x == east) then {
_x addEventHandler ["HandleDamage", {_this call gooncorp_reducearmor}];
};
} foreach allunits;
};

gooncorp_removeallclothing = {// calls clearclothing you fucking moroon
{
if (side _x != west) then {
[_x] call gooncorp_clearclothing;}
} foreach allunits;
};


gooncorp_removeallclothing_new = {// calls clearclothing you fucking moroon
{
if (side _x != west) then {
if (random 1 < .5) then {
[_x,"insurgent5a"] call gooncorp_fnc_globalgear;} else {
[_x,"insurgent6a"] call gooncorp_fnc_globalgear;};
};
} foreach allunits;
};

gooncorp_removeallclothing_new2 = {// calls clearclothing you fucking moroon
{
if (side _x != west) then {
if (random 1 < .5) then {
[_x,"nva1"] call gooncorp_fnc_globalgear;} else {
[_x,"nva2"] call gooncorp_fnc_globalgear;};
};
} foreach allunits;
};

gooncorp_removeallclothing_new3 = {// newm88uniform
{
if (side _x != west) then {
if (random 1 < .5) then {
[_x,"nva1m88"] call gooncorp_fnc_globalgear;} else {
[_x,"nva2m88"] call gooncorp_fnc_globalgear;};
};
} foreach allunits;
};

gooncorp_removeallclothing_4 = {
{
if (side _x != west) then {
[_x] call gooncorp_clearclothing_4;}
} foreach allunits;
};

gooncorp_qrf = {
if (random 1 < .1) then {
if (!isnil "qrf1") then {
qrf1 move position (_this select 0);};
};
if (random 1 < .1) then {
if (!isnil "qrf2") then {
qrf2 move position (_this select 0);};
};
if (random 1 < .1) then {
if (!isnil "qrf3") then {
qrf3 move position (_this select 0);};
};
if (random 1 < .02) then {
if (!isnil "qrf1") then {
qrf1 move position center;};
};
if (random 1 < .02) then {
if (!isnil "qrf2") then {
qrf2 move position center;};
};
if (random 1 < .02) then {
if (!isnil "qrf3") then {
qrf3 move position center;};
};
};


gooncorp_reducearmor = {
if (random 1 < .2) then {
[(_this select 0)] call gooncorp_qrf;};
_damage = _this select 2;
_damage = _damage * 2;
_damage;
};


gooncorp_addarmor = {
//_damageVar = player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]]; [player, "selection", (_damageVar select (["selection"] call ace_medical_fnc_selectionNameToNumber)) - .2, (_this select 0), "TypeOfDammage", -.1] call ace_medical_fnc_handleDamage;
_damage = _this select 2;
_damage = .02;
_damage;
};

gooncorp_aitextures = {
{
if (side _x == east) then {
_x setObjectTexture [0,(_this select 0)];
_x setObjectTexture [1,(_this select 0)];
_x setObjectTexture [2,(_this select 0)];
};
} foreach allunits;
};

gooncorp_aitextures_mod1 = {
{
if (side _x == east) then {
if (typeof _x == "JO_Insurgent_R2") then {
_x setObjectTexture [0,(_this select 1)]; } else {
//_x setObjectTexture [0,(_this select 0)]; 
};
};
} foreach allunits;
};




gooncorp_randomaitextures = {
{
if (side _x == east) then {
_val = floor random 6;
if (_val == 0) then {
_x setface "WhiteHead_03";
_x setObjectTexture [0,(_this select 0)]; };
if (_val == 1) then {
_x setObjectTexture [0,(_this select 1)]; };
if (_val == 2) then {
_x setObjectTexture [0,(_this select 2)];
_x setface "WhiteHead_04";};
if (_val == 3) then {
_x setObjectTexture [0,(_this select 3)]; };
if (_val == 4) then {};
};
} foreach allunits;
};

gooncorp_playertextures = {
{
if (side _x == west) then {
_x setObjectTexture [0,"textures\vietnam_marines_goon.paa"];
_x setObjectTexture [1,"textures\vietnam_marines_goon.paa"];
_x setObjectTexture [2,"textures\vietnam_marines_goon.paa"];
_x setObjectTexture [3,"textures\vietnam_marines_goon.paa"];
_x setObjectTexture [4,"textures\vietnam_marines_goon.paa"];
_x setObjectTexture [5,"textures\vietnam_marines_goon.paa"];
};
} foreach allunits;
};

gooncorp_playertextures_specific = {
{
if (side _x == west) then {
_x setObjectTexture [0,(_this select 0)];
_x setObjectTexture [1,(_this select 0)];
_x setObjectTexture [2,(_this select 0)];
_x setObjectTexture [3,(_this select 0)];
_x setObjectTexture [4,(_this select 0)];
_x setObjectTexture [5,(_this select 0)];
};
} foreach allunits;
};

gooncorp_setaiidentity = {
if ((_this select 0) == "vietnam") then {
{
if (side _x != west) then {
_val = floor random 5;
if (_val == 0) then {
_x setidentity "viet1";
};
if (_val == 1) then {
_x setidentity "viet2";
};
if (_val == 2) then {
_x setidentity "viet3";
};
if (_val == 3) then {
_x setidentity "viet4";
};
if (_val == 4) then {
_x setidentity "viet5";
};
};
} foreach allunits;
};
if ((_this select 0) == "africa") then {
{
if (side _x != west) then {
_val = floor random 3;
if (_val == 0) then {
_x setidentity "afri1";
};
if (_val == 1) then {
_x setidentity "afri2";
};
if (_val == 2) then {
_x setidentity "afri3";
};
};
} foreach allunits;
};
};





gooncorp_clearclothing = {
if (!isserver) exitwith {};
removeHeadgear (_this select 0);
removeGoggles (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
[(_this select 0),"vcinsurgentrandomizer"] call gooncorp_fnc_globalgear;

};
gooncorp_clearclothing_4 = {
if (!isserver) exitwith {};
removeHeadgear (_this select 0);
removeGoggles (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);
[(_this select 0),"insurgentrandomizer"] call gooncorp_fnc_globalgear;

};


gooncorp_clearclothing_zombie = {
if (!isserver) exitwith {};
removeHeadgear (_this select 0);
removeGoggles (_this select 0);
removeVest (_this select 0);
removeBackpack (_this select 0);
//removeUniform (_this select 0);
removeAllWeapons (_this select 0);
removeAllAssignedItems (_this select 0);


};




gooncorp_ordered_killcounter = {
private ["_bigArray"];
private ["_finalArray"];
private ["_nameArray"];
private ["_scoreArray"];
private ["_myFirstArray"];
private ["_mySingleArray"];
private ["_lastScore"];
private ["_finalArray"];
private ["_finalFinalArray"];
_bigArray = [[]];
_nameArray = [];
_scoreArray = [];
_finalFinalArray = [];
{
//if (side _x == west) then {
_mySingleArray = [score _x, name _x];
_myFirstArray = [name _x];
_mySecondArray = [score _x];// change this back to score _x // DANGER!!!
_bigArray = _bigArray + _mySingleArray;
_nameArray = _nameArray + _myFirstArray;
_scoreArray = _scoreArray + _mySecondArray;
//};
} foreach playableunits;
_lastScore = 0;
_finalArray = [];
_p = 0;
_l = 0;
private ["_l"];
private ["_p"];
_topName = "";
{
if (_x > _lastScore) then {
_lastScore = _x;
_topName = _nameArray select _p;
_finalArray = _finalArray + [_x] + [_nameArray select _p];
};
_p = _p + 1;
} foreach _scoreArray;
_finalFinalArray = [_lastScore] + _finalFinalArray + _scoreArray;
_stringer = format [" %1  %2" , _topName, _lastScore];
_text9 = "BODY COUNT = \n\n";
_text = _text9 + "\nMVP: " + _stringer + "\n\n";
_txt4 = "";
_txt2 = "";
private ["_txt2"];
private ["_txt4"];
private ["_text"];
{
//if (side _x == west) then {
_txt2 = format ["%1", (name _x)] + " " + format ["%1", (score _x)] + "\n" ;
_txt4 = _txt4 + _txt2;//};
} foreach playableunits;
sleep .2;
_txt5 = _text + _txt4;
titleCut [_txt5,"Black Faded",25];
};
