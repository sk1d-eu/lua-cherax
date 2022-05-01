--[  @@@@@@   @@@  @@@  @@@  @@@@@@@        @@@   @@@@@@   @@@@@@@@   ]--
--[ @@@@@@@   @@@  @@@  @@@  @@@@@@@@      @@@@  @@@@@@@@  @@@@@@@@  ]--
--[ !@@       @@!  !@@  @@!  @@!  @@@     @@@!!  @@!  @@@       @@!  ]--
--[ !@!       !@!  @!!  !@!  !@!  @!@       !@!  !@!  @!@      !@!   ]--
--[ !!@@!!    @!@@!@!   !!@  @!@  !@!       @!@   !@!!@!      @!!    ]--
--[  !!@!!!   !!@!!!    !!!  !@!  !!!       !@!   !!@!!!     !!!     ]--
--[      !:!  !!: :!!   !!:  !!:  !!!       !!:  !!:  !!!   !!:      ]--
--[     !:!   :!:  !:!  :!:  :!:  !:!       :!:  :!:  !:!  :!:       ]--
--[ :::: ::    ::  :::   ::   :::: ::       :::  ::::: ::   ::       ]--
--[ :: : :     :   :::  :    :: :  :         ::   : :  :   : :       ]--
--[      some things are based on the Cherax Upgrade from SATTY      ]--


g_lua.register()

g_gui.add_toast("Welcome ".. PLAYER.GET_PLAYER_NAME(PLAYER.PLAYER_ID()) .." to Custom License! v2\nHave Fun!", 5000)
g_gui.add_toast("Suggestions to my Discord: ODIN.eu#4435", 5000)

local spamdoors = false
local flashy_brake = false
local SetSpeed = false 
local complete_s = false
modify = false
modifier = 0

function SetSpeed(value)
    if complete_s then
        local complete_s = false
        if tonumber(value) and tonumber(value) > 0 then
            modifier = tonumber(value)
        end
        SYSTEM.WAIT(10)
        local complete_s = true
    end
end

function addBlip(entity, blipSprite, colour)
    local blip_ptr = g_memory.allocate(4)
    local blip = UI.ADD_BLIP_FOR_ENTITY(entity)
    g_memory.write_int(blip_ptr, blip)
    UI.SET_BLIP_SPRITE(blip, blipSprite)
    UI.SET_BLIP_COLOUR(blip, colour)
    local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
    g_memory.free(blip_ptr)
end

function rqCtrl(entity, t)
    if ENTITY.DOES_ENTITY_EXIST(entity) then
        netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
        NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netId, true)
        t = t or 0.03
        time = os.time() + t
        while not NETWORK.HAS_CONTROL_OF_ENTITY(entity) do
            NETWORK.REQUEST_CONTROL_OF_ENTITY(entity)
            SYSTEM.WAIT()
            if os.time() > time then
                return NETWORK.HAS_CONTROL_OF_ENTITY(entity)
            end
        end
        return NETWORK.HAS_CONTROL_OF_ENTITY(entity)
    end
    return false
end

function is_veh_personal(veh)
    local blip = UI.GET_BLIP_FROM_ENTITY(veh)
    bliptype = UI.GET_BLIP_INFO_ID_TYPE(blip)
    if tonumber(bliptype) == 1 then
        return true
    else
        return false
    end
end

function rotate45() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-45, 5, true)
    end
end

function rotate90() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-90, 5, true)
    end
end

function rotate135() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-135, 5, true)
    end
end

function rotate() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-180, 5, true)
    end
end

function rotate225() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-225, 5, true)
    end
end

function rotate270() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-270, 5, true)
    end
end

function rotate315() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-315, 5, true)
    end
end

function boostrv()
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, -100000)
    end
end

function boost()
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 100000)
    end
end

function flip()
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x-180, rot.y, rot.z, 5, true)
    end
end

function AntiLockOn()
    while true do
        if lockon == false then
            v = PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID())
            if v == true then
                local veh = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
                VEHICLE.SET_VEHICLE_CAN_BE_LOCKED_ON(veh, true, true)
            end
        elseif lockon == true then
            v = PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID())
            if v == true then
                local veh = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
                VEHICLE.SET_VEHICLE_CAN_BE_LOCKED_ON(veh, false, true)
            end
        end
        SYSTEM.WAIT(100)
        if lockon == false then break end
    end
end

function poptires()
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 1, true, 1000.0)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 2, true, 1000.0)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 3, true, 1000.0)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 4, true, 1000.0)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 5, true, 1000.0)
    end
end
 
function VehicleBrake(value)
    VehicleBrakeTog = value
end

function driveWaypoint()

    if autodrive == true then

        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED(PLAYER.PLAYER_ID()), false)
         blip = UI.GET_FIRST_BLIP_INFO_ID(8)
	    if UI.DOES_BLIP_EXIST(blip) then
	    	local Cor = UI.GET_BLIP_INFO_ID_COORD(blip)
            TASK.TASK_VEHICLE_DRIVE_TO_COORD_LONGRANGE(PLAYER.GET_PLAYER_PED(PLAYER.PLAYER_ID()), vehicle, Cor.x, Cor.y, Cor.z, 100, 1074528293, 5)
            waypointcheck = true

        end
    end
end

function SpamDoors()

    if spamdoors then
        local spamdoors = false
        local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
        PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID())
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 0, true, true)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 1, true, true)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 2, true, true)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 3, true, true)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 4, true, true)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 5, true, true)
        SYSTEM.WAIT(100)
        VEHICLE.SET_VEHICLE_DOORS_SHUT(vehicle, true)
        SYSTEM.WAIT(100)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 0, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 1, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 2, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 3, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 4, false, false)
        VEHICLE.SET_VEHICLE_DOOR_OPEN(vehicle, 5, false, false)
        SYSTEM.WAIT(100)
        local spamdoors = true
    end
end

function Noclip()

    if noclip == true then

        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            Vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
            rqCtrl(Vehicle)
            ENTITY.FREEZE_ENTITY(Vehicle, true)
            ENTITY.SET_ENTITY_COLLISION(Vehicle, false, false)
        end
    end
    SYSTEM.WAIT(10)
    if noclip == false then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            Vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
            rqCtrl(Vehicle)
            ENTITY.FREEZE_ENTITY(Vehicle, false)
            ENTITY.SET_ENTITY_COLLISION(Vehicle, true, true)
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(Vehicle, 0.000001)
        end
    end
    SYSTEM.WAIT(10)
    while true do
        if noclip == false then break end
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            Vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
            NETWORK.REQUEST_CONTROL_OF_ENTITY(Vehicle)
            ENTITY.FREEZE_ENTITY(Vehicle, true)
            local rot = CAM.GET_GAMEPLAY_CAM_ROT(5)
            ENTITY.SET_ENTITY_ROTATION(Vehicle, rot.x, rot.y, rot.z, 5, true)
            if CONTROL.IS_CONTROL_PRESSED(2, 131) then
                multiplier = 10
            else
                multiplier = 1
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 87) then
                posW = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, 0, 1 * multiplier, 0)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posW.x, posW.y, posW.z)
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 88) then
                posS = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, 0, -1 * multiplier, 0)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posS.x, posS.y, posS.z)
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 89) then
                posA = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, -1 * multiplier, 0, 0)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posA.x, posA.y, posA.z)
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 90) then
                posD = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, 1 * multiplier, 0, 0)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posD.x, posD.y, posD.z)
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 137) then
                posUp = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, 0, 0, 1 * multiplier)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posUp.x, posUp.y, posUp.z)
            end
            if CONTROL.IS_CONTROL_PRESSED(2, 132) then
                posDow = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(Vehicle, 0, 0, -1 * multiplier)
                ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Vehicle, posDow.x, posDow.y, posDow.z)
            end
        end
        SYSTEM.WAIT()
    end
end

g_gui.add_input_int("vehicle_options", "Set Speed", modifier, -2147483647, 2147483647, 1, 1, function(int) modifier = int end)
g_gui.add_toggle("vehicle_options", "Speed", function(bool) SetSpeed = bool end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 45° R", function() rotate45(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 90° R", function() rotate90(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 135° R", function() rotate135(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 45° L", function() rotate315(g_util.get_selected_player()) end) 
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 90° L", function() rotate270(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle 225° L", function() rotate225(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle", function() rotate(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "BOOST", function() boost(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "BOOST, but reverse", function() boostrv(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Flip", function() flip(g_util.get_selected_player()) end)
g_gui.add_button("vehicle_quick_actions", "Pop Your Tires", function() poptires(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Better Vehicle Fly", "WASD: Moving | CapsLock: Up | Shift: Speed | Ctrl: Down | Mouse: Rotate", function(on) noclip=on Noclip(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Instant Handbrake", "Key: SPACE , you can also brake mid air.", function(on) VehicleBrake(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Anti Lock On", "Prevent Rockets to lock on you.", function(on) lockon=on AntiLockOn(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Tesla Autopilot", "Drives you to your Waypoint.", function(on) autodrive=on driveWaypoint(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Flashing Brakelight", "Flash the Brake light while braking, ABS like.", function(bool) flashy_brake = bool end)
g_gui.add_toggle("vehicle_options", "Spam Doors", "Spam Open/Close your doors. (you will lose your bonet)", function(on) spamdoors=on SpamDoors(g_util.get_selected_player()) end)

while g_isRunning do

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    if VehicleBrakeTog then
        vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED(PLAYER.PLAYER_ID()), true)
        if CONTROL.IS_CONTROL_PRESSED(22, 22) then
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 0)
        end
    end

    if waypointcheck then
        if not UI.DOES_BLIP_EXIST(blip) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID()), false)
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 0)
        PED.CLEAR_PED_TASKS_IMMEDIATELY(PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID()))
        waypointcheck = false
        end
    end

    if flashy_brake then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            if CONTROL.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
                SYSTEM.WAIT(125)
            else
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
            end
        end
    end

    if SpamDoors then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            SpamDoors(vehicle)
        end
    end

    if SetSpeed then
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, modifier)
    else
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 0)
    end

    SYSTEM.WAIT(10)
end

g_lua.unregister()