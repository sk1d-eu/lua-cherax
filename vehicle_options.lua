--[  @@@@@@   @@@  @@@  @@@  @@@@@@@        @@@   @@@@@@   @@@@@@@@  ]--
--[ @@@@@@@   @@@  @@@  @@@  @@@@@@@@      @@@@  @@@@@@@@  @@@@@@@@  ]--
--[ !@@       @@!  !@@  @@!  @@!  @@@     @@@!!  @@!  @@@       @@!  ]--
--[ !@!       !@!  @!!  !@!  !@!  @!@       !@!  !@!  @!@      !@!   ]--
--[ !!@@!!    @!@@!@!   !!@  @!@  !@!       @!@   !@!!@!      @!!    ]--
--[  !!@!!!   !!@!!!    !!!  !@!  !!!       !@!   !!@!!!     !!!     ]--
--[      !:!  !!: :!!   !!:  !!:  !!!       !!:  !!:  !!!   !!:      ]--
--[     !:!   :!:  !:!  :!:  :!:  !:!       :!:  :!:  !:!  :!:       ]--
--[ :::: ::    ::  :::   ::   :::: ::       :::  ::::: ::   ::       ]--
--[ :: : :     :   :::  :    :: :  :         ::   : :  :   : :       ]--
--[          THANKS  TO  SATTY  FOR  THE  TELEPORT  OPTIONS          ]--

g_lua.register()

g_gui.add_toast("Welcome ".. PLAYER.GET_PLAYER_NAME(PLAYER.PLAYER_ID()) .." to Vehicle Options v6  \nHave Fun!", 5000)
g_gui.add_toast("Suggestions to my Discord: sk1d#0187", 5000)


-- global

VehicleBrake = false
reative_neon = false
brake_neon = false
neons_circle_l = false
neons_circle_r = false
neons_follow = false
neons_chase = false
neons_police = false
neons_random = false
neons_random2 = false
neons_halloween = false
neons_blood = false
set_neon_delay = 100
complete_l = true
complete_r = true
complete_f = true
complete_c = true
complete_p = true
complete_ra = true
complete_ra2 = true
complete_h = true
complete_b = true
local set_degree = 180
modify = false
modifier = 0
VehicleBrakeTog = false
local spamdoors = false
local flashy_brake = false
complete_ph = true
headlights_police = false
complete_col = true
colors_police = false
local headlight_flasher = false
slam = false
Slam = false
SLAM = false
SLAAAM = false
local slam_int_ = 25
local slam_int_2 = 25
shift_drift = false
downforce = false
acc = false
beyblades = false
Fidget = false


-- gui

g_gui.add_button("vehicle_quick_actions", "Fix low Grip", "Fix Vehicle low grip if it get stuck", function() grip(VEHICLE.SET_VEHICLE_REDUCE_GRIP(PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID()), false)) end)
g_gui.add_input_int("vehicle_quick_actions", "Degree", set_degree, 1, 2147483647, 1, 1, function(int) set_degree = int end)
g_gui.add_button("vehicle_quick_actions", "Turn Vehicle", function() rotate(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Better Vehicle Fly", "WASD: Moving | CapsLock: Up | Shift: Speed | Ctrl: Down | Mouse: Rotate", function(on) noclip=on Noclip(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Glide Fly", function(bool) hover = bool end)
g_gui.add_toggle("vehicle_options", "Anti Lock On", "Prevent Rockets to lock on you.", function(on) lockon=on AntiLockOn(g_util.get_selected_player()) end)
g_gui.add_toggle("vehicle_options", "Neon Features", function(on) neon_window=on
    if neon_window then
        neonwindow = g_hooking.register_D3D_hook(Neon_Options)
    else
        g_hooking.unregister_hook(neonwindow)
    end
end)
g_gui.add_toggle("vehicle_options", "Fun Options", function(on) fun_window=on
    if fun_window then
        funwindow = g_hooking.register_D3D_hook(Vehicl_fun_Options)
    else
        g_hooking.unregister_hook(funwindow)
    end
end)
g_gui.add_toggle("vehicle_options", "Usefull-isch Options", function(on) usefull_window=on
    if usefull_window then
        usefullwindow = g_hooking.register_D3D_hook(Usefull_Options)
    else
        g_hooking.unregister_hook(usefullwindow)
    end
end)
g_gui.add_toggle("vehicle_options", "Wheels menu", function(on) wheel_window=on
    if wheel_window then
        wheelwindow = g_hooking.register_D3D_hook(Wheel_Window)
    else
        g_hooking.unregister_hook(wheelwindow)
    end
end)
g_gui.add_toggle("vehicle_options", "Race menu", function(on) race_window=on
    if race_window then
        racewindow = g_hooking.register_D3D_hook(Race_Window)
    else
        g_hooking.unregister_hook(racewindow)
    end
end)

-- imgui

function Neon_Options()
    if g_gui.is_open() then
		g_imgui.set_next_window_size(vec2(275, 430))
		if g_imgui.begin_window("Neons Menu", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu", vec2(), true)
        g_imgui.add_checkbox("Brake Neons", function(bool) brake_neon = bool end)
        g_imgui.add_checkbox("Police Neons", function(bool) neons_police = bool end)
        g_imgui.add_checkbox("Police Headlight ", function(bool) headlights_police = bool end)
        g_imgui.add_checkbox("Police Mode", function (bool) headlights_police = bool neons_police = bool end)
        g_imgui.add_checkbox("Reactive Neons", function(bool) reative_neon = bool end)
        g_imgui.add_input_string("Set Speed", function(value) setneondelay(value) end)
        g_imgui.add_checkbox("Chasing Neons", function(bool) neons_chase = bool end)
        g_imgui.add_checkbox("Circle Neons (Left)", function(bool) neons_circle_l = bool end)
        g_imgui.add_checkbox("Circle Neons (Right)", function(bool) neons_circle_r = bool end)
        g_imgui.add_checkbox("Blood Rain", function(bool) neons_blood = bool end)
        g_imgui.add_checkbox("Following Neons", function(bool) neons_follow = bool end)
        g_imgui.add_checkbox("Halloween Neons", function(bool) neons_halloween = bool end)
        g_imgui.add_checkbox("Random Neon", function(bool) neons_random = bool  end)
        g_imgui.add_checkbox("Random Neons 2", function(bool) neons_random2 = bool end)
        g_imgui.end_child()
        g_imgui.end_window()
        end
    end
end

function Vehicl_fun_Options()
    if g_gui.is_open() then
        local length = 320
        local btn_height = 25
		g_imgui.set_next_window_size(vec2(350, 370))
		if g_imgui.begin_window("Vehicle Fun Options", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu", vec2(), true)
        g_imgui.add_button("BOOST", vec2(length, btn_height), function() boost(g_util.get_selected_player()) end)
        g_imgui.add_button("BOOST reverse", vec2(length, btn_height), function() boostrv(g_util.get_selected_player()) end)
        g_imgui.add_button("Flip", vec2(length, btn_height), function() flip(g_util.get_selected_player()) end)
        g_imgui.add_button("Pop all tires", vec2(length, btn_height), function() poptires(g_util.get_selected_player()) end)
        g_imgui.add_button("Pop front left tire", vec2(length, btn_height), function() poptires_fl(g_util.get_selected_player()) end)
        g_imgui.add_button("Pop front right tire", vec2(length, btn_height), function() poptires_fr(g_util.get_selected_player()) end)
        g_imgui.add_button("Pop rear right tire", vec2(length, btn_height), function() poptires_rr(g_util.get_selected_player()) end)
        g_imgui.add_button("Pop rear left tire", vec2(length, btn_height), function() poptires_rl(g_util.get_selected_player()) end)
        g_imgui.add_checkbox("Spammy Doors", function(on) spamdoors=on SpamDoors(g_util.get_selected_player()) end)
        g_imgui.add_checkbox("Beyblade", function(bool) Beyblades = bool end)
        g_imgui.add_checkbox("Fidget Spinner", function(bool) Fidget = bool end)
        g_imgui.end_child()
        g_imgui.end_window()
        end
    end
end

function Usefull_Options()
    if g_gui.is_open() then
        local length = 320
        local btn_height = 25
		g_imgui.set_next_window_size(vec2(350, 580))
		if g_imgui.begin_window("Usefull-isch Options", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu", vec2(), true)
        g_imgui.add_input_string("Set Veh Speed", function(value) SetSpeed(value) end)
        g_imgui.add_checkbox("Modify Speed", function(value) modify = value end)
        g_imgui.add_checkbox("Instant Handbrake", function(value) VehicleBrakeTog = value end)
        g_imgui.add_checkbox("Tesla Autopilot", function(on) autodrive=on driveWaypoint(g_util.get_selected_player()) end)
        g_imgui.add_button("Open Window Front Left", vec2(length, btn_height), function() remove_window_fl(g_util.get_selected_player()) end)
        g_imgui.add_button("Open Window Front Right", vec2(length, btn_height), function() remove_window_fr(g_util.get_selected_player()) end)
        g_imgui.add_button("Open Window Rear Left", vec2(length, btn_height), function() remove_window_rl(g_util.get_selected_player()) end)
        g_imgui.add_button("Open Window Rear Right", vec2(length, btn_height), function() remove_window_rr(g_util.get_selected_player()) end)
        g_imgui.add_checkbox("ABS Like Brake lights", function(bool) flashy_brake = bool end)
        g_imgui.add_checkbox("Headlight Flasher [key: 1 and E]", function(bool) headlight_flasher = bool end)
        g_imgui.add_button("TP into Personal Vehicle", vec2(length, btn_height), function() drivepersonalveh() end)
        g_imgui.add_button("TP Personal Vehicle to you", vec2(length, btn_height), function() tp_veh_to_self() end)
        g_imgui.add_button("TP into last used Vehicle", vec2(length, btn_height), function() drivelastveh() end)
        g_imgui.add_button("TP to last used Vehicle", vec2(length, btn_height), function() tp_to_last_veh() end)
        g_imgui.add_input_string("Slam Value", function(value) slam_int(value) end)
        g_imgui.add_text("Recommended to keep the Slam under 100.")
        g_imgui.add_checkbox("Slam", function(bool) Slam = bool end)
        g_imgui.add_checkbox("Slam preset", function(bool) SLAM = bool end)
        g_imgui.add_checkbox("Drift Mode [SHIFT]", function(bool) shift_drift = bool end)
        g_imgui.end_child()
        g_imgui.end_window()
        end
    end
end

function Wheel_Window()
    if g_gui.is_open() then
        local length = 245
        local btn_height = 25
        g_imgui.set_next_window_size(vec2(275, 200))
        if g_imgui.begin_window("Wheels Menu", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu", vec2(), true)
        g_imgui.add_button("Benny Wheels Original", vec2(length, btn_height), function() BennyWheelsOriginal() end)
        g_imgui.add_button("Benny Wheels Bespok", vec2(length, btn_height), function() BennyWheelsBespoke() end)
        g_imgui.add_button("Open Wheels", vec2(length, btn_height), function() OpenWheels() end)
        g_imgui.add_button("Street Wheels", vec2(length, btn_height), function() StreetWheels() end)
        g_imgui.add_button("Track Wheels", vec2(length, btn_height), function() TrackWheels() end)
        g_imgui.end_child()
        g_imgui.end_window()
        end
    end
end

function Race_Window()
    if g_gui.is_open() then
        local length = 245
        local btn_height = 25
        g_imgui.set_next_window_size(vec2(275, 150))
        if g_imgui.begin_window("Race Menu", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu", vec2(), true)
        g_imgui.add_checkbox("Slightly higher speed and acceleration", function(boool) acc = bool end)
        g_imgui.add_checkbox("Downforce", function(bool) downforce = bool end)
        g_imgui.add_text("don't use on tracks with big jumps")
        g_imgui.end_child()
        g_imgui.end_window()
        end
    end
end


-- needed

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

function addBlip(entity, blipSprite, colour)
    local blip_ptr = g_memory.allocate(4)
    local blip = UI.ADD_BLIP_FOR_ENTITY(entity)
    g_memory.write_int(blip_ptr, blip)
    UI.SET_BLIP_SPRITE(blip, blipSprite)
    UI.SET_BLIP_COLOUR(blip, colour)
    local netId = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(entity)
    g_memory.free(blip_ptr)
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

function TeleportSelf(pos)

    local entity = PLAYER.PLAYER_PED_ID()

    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        entity = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    end

    if rqCtrl(entity, 0.5) then
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(entity, pos.x, pos.y, pos.z)
        if pos.h then
            ENTITY.SET_ENTITY_HEADING(entity, pos.h)
        end
    end

end

function getAllVehs(radius)
    local me, vehs, allvehs = PLAYER.PLAYER_PED_ID(), {}, POOL.GET_MAX_VEHICLES()

    for i = 0, allvehs do
        local veh = POOL.GET_VEHICLE_AT_INDEX(i)

        if ENTITY.DOES_ENTITY_EXIST(veh) then
            if radius == nil then
                table.insert(vehs, veh)
            elseif radius > getDistanceToEntity(me, veh) then
                table.insert(vehs, veh)
            end
        end

    end

    return vehs
end



-- vehicle functions               

function SetSpeed(value)
    if tonumber(value) and tonumber(value) > 0 then
        modifier = tonumber(value)
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

function rotate() 

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x, rot.y, rot.z-(set_degree), 5, true)
    end
end

function boostrv(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, -100000)
    end
end

function boost(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 100000)
    end
end

function flip(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    local rot = ENTITY.GET_ENTITY_ROTATION(vehicle, 5)
    if rqCtrl(vehicle, 0.5) then
        ENTITY.SET_ENTITY_ROTATION(vehicle, rot.x-180, rot.y, rot.z, 5, true)
    end
end

function poptires(vehicle)
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

function poptires_fl(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
    end
end

function poptires_fr(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 1, true, 1000.0)
    end
end

function poptires_rr(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 5, true, 1000.0)
    end
end

function poptires_rl(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.SET_VEHICLE_TYRES_CAN_BURST(vehicle, true)
        VEHICLE.SET_VEHICLE_TYRE_BURST(vehicle, 4, true, 1000.0)
    end
end

function VehicleBrake(value)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.GET_PLAYER_PED(PLAYER.PLAYER_ID()), true)
        if CONTROL.IS_CONTROL_PRESSED(22, 22) then
            VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, 0)
        end
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

function remove_window_fl(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.REMOVE_VEHICLE_WINDOW(vehicle, 0)
    end
end

function remove_window_fr(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.REMOVE_VEHICLE_WINDOW(vehicle, 1)
    end
end

function remove_window_rl(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.REMOVE_VEHICLE_WINDOW(vehicle, 2)
    end
end

function remove_window_rr(vehicle)
    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
    if rqCtrl(vehicle, 0.5) then
        VEHICLE.REMOVE_VEHICLE_WINDOW(vehicle, 3)
    end
end

function drivepersonalveh()
    local vehs, ped = getAllVehs(), PLAYER.PLAYER_PED_ID()

    for i = 1, #vehs do

        if is_veh_personal(vehs[i]) then

            local inveh = VEHICLE.GET_PED_IN_VEHICLE_SEAT(vehs[i], -1, true)

            if ENTITY.DOES_ENTITY_EXIST(inveh) then 
                if inveh ~= PLAYER.PLAYER_PED_ID() then PED.CLEAR_PED_TASKS_IMMEDIATELY(inveh) end
            end

            rqCtrl(vehs[i])
            PED.SET_PED_INTO_VEHICLE(ped, vehs[i], -1)
        end

    end

end

function tp_veh_to_self()
    local vehs, ped = getAllVehs(), PLAYER.PLAYER_PED_ID()

    for i = 1, #vehs do

        if is_veh_personal(vehs[i]) then
            rqCtrl(vehs[i])
            local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(ped, 0, 5, 0)
            local heading = ENTITY.GET_ENTITY_HEADING(ped)
            ENTITY.SET_ENTITY_COORDS_NO_OFFSET(vehs[i], pos.x, pos.y, pos.z)
            ENTITY.SET_ENTITY_HEADING(vehs[i], heading+90)
            VEHICLE.SET_VEHICLE_ON_GROUND_PROPERLY(vehs[i], 5)
        end

    end
end

function drivelastveh()
    local ped = PLAYER.PLAYER_PED_ID()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)

    if not ENTITY.DOES_ENTITY_EXIST(veh) then return end

    local inveh = VEHICLE.GET_PED_IN_VEHICLE_SEAT(veh, -1, true)

    if ENTITY.DOES_ENTITY_EXIST(inveh) then 
        if inveh ~= PLAYER.PLAYER_PED_ID() then PED.CLEAR_PED_TASKS_IMMEDIATELY(inveh) end
    end

    rqCtrl(veh)
    PED.SET_PED_INTO_VEHICLE(ped, veh, -1)

end

function tp_to_last_veh()
    local ped = PLAYER.PLAYER_PED_ID()
    local veh = PED.GET_VEHICLE_PED_IS_IN(ped, true)

    if not ENTITY.DOES_ENTITY_EXIST(veh) then return end
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(veh, -3, 0, 0)
    TeleportSelf(pos)
end

function slam_int(value)
    if tonumber(value) and tonumber(value) > 0 then
        slam_int_ = math.floor(-1*tonumber(value)/2)
    end
end

function slam_int2(value)
    if tonumber(value) and tonumber(value) > 0 then
        slam_int_2 = math.floor(-1*tonumber(value)/2)
    end
end

function BennyWheelsOriginal()
    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
          local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
          VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 8)
          VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 1, true)
    end
end

function BennyWheelsBespoke()
    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 9)
        VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 1, true)
    end
end

function OpenWheels()
    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 10)
        VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 1, true)
    end
end

function StreetWheels()
    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 11)
        VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 1, true)
    end
end

function TrackWheels()
    if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), false)
        VEHICLE.SET_VEHICLE_WHEEL_TYPE(vehicle, 12)
        VEHICLE.SET_VEHICLE_MOD(vehicle, 23, 1, true)
    end
end


-- neons

function setneondelay(value)
    if tonumber(value) and tonumber(value) > 0 then
        set_neon_delay = tonumber(value)
    end
end

function random_bool()
    local random_num = math.random(0, 1)
    if random_num == 0 then return false elseif random_num == 1 then return true end
end

function random_bool1()
    local random_num0 = math.random(0, 1)
    if random_num0 == 0 then return false elseif random_num0 == 1 then return true end
    local random_num1 = math.random(0, 1)
    if random_num1 == 0 then return false elseif random_num1 == 1 then return true end
    local random_num2 = math.random(0, 1)
    if random_num2 == 0 then return false elseif random_num2 == 1 then return true end
    local random_num3 = math.random(0, 1)
    if random_num3 == 0 then return false elseif random_num3 == 1 then return true end
end

function random_int()
    local int = math.random(0, 3)
    return int
end

function random_int2()
    local int = math.random(0, 255)
    return int
end

function neon_cir_l(vehicle)
    if complete_l then
        local complete_l = false
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        g_util.yield(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_l = true
    end
end

function neon_cir_r(vehicle)
    if complete_r then
        local complete_r = false
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_r = true
    end
end

function neon_halloween(vehicle)
    if complete_h then
        local complete_h = false
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 42, 0)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 148, 0, 211)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 148, 0, 211)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        g_util.yield(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 42, 0)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        g_util.yield(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_h = true
    end
end

function neon_follow(vehicle)
    if complete_f then
        local complete_f = false
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        SYSTEM.WAIT(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_f = true
    end
end

function neon_chase(vehicle)
    if complete_c then
        local complete_c = false
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        SYSTEM.WAIT(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(set_neon_delay)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_c = true
    end
end

function neon_police(vehicle)
    if complete_p then
        local complete_p = false
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 0, 0)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        SYSTEM.WAIT(150)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(50)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 0, 0, 255)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        SYSTEM.WAIT(125)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(50)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 0, 0, 255)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
        SYSTEM.WAIT(125)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, false)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(50)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_p = true
    end
end

function headlight_police(vehicle)
    if complete_ph then
        local complete_ph = false
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 8)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, true)
        SYSTEM.WAIT(150)
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 0)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, false)
        SYSTEM.WAIT(50)
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 1)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, true)
        SYSTEM.WAIT(125)
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 0)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, false)
        SYSTEM.WAIT(50)
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 1)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, true)
        SYSTEM.WAIT(125)
        VEHICLE.SET_VEHICLE_XENON_LIGHTS_COLOR(vehicle, 0)
        VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, false)
        SYSTEM.WAIT(50)
        local complete_ph = true
    end
end

function neon_random(vehicle)
    if complete_ra then
        local complete_ra = false
        local random_l = random_int(0, 3)
        local random_r = random_int2(0, 255)
        local random_g = random_int2(0, 255)
        local random_b = random_int2(0, 255)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, random_r, random_g, random_b)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, random_l, true)
        SYSTEM.WAIT(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_ra = true
    end
end

function neon_random2(vehicle)
    if complete_ra2 then
        local complete_ra2 = false
        local random_num0 = random_bool1()
        local random_num1 = random_bool1()
        local random_num2 = random_bool1()
        local random_num3 = random_bool1()   
        local random_r = random_int2(0, 255)
        local random_g = random_int2(0, 255)
        local random_b = random_int2(0, 255)
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, random_r, random_g, random_b)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, random_num0)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, random_num1)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, random_num2)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, random_num3)
        SYSTEM.WAIT(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_ra2 = true
    end
end

function neon_blood(vehicle)
    if complete_b then
        local complete_b = false
        local random_num0 = random_bool1()
        local random_num1 = random_bool1()
        VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 101, 28, 50)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, random_num0)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, random_num1)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
        VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, false)
        SYSTEM.WAIT(set_neon_delay)
        for i = 0, 3 do
            VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
        end
        local complete_b = true
    end
end

while g_isRunning do

    local vehicle = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())

    if reative_neon then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            if CONTROL.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
                VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 0, 0)
            elseif CONTROL.IS_CONTROL_PRESSED(2, 71) then
                VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 2, true)
                VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 255, 255)
            elseif CONTROL.IS_CONTROL_PRESSED(2, 63) then
                VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 0, true)
                VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 0,0,255)
            elseif CONTROL.IS_CONTROL_PRESSED(2, 64) then
                VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 1, true)
                VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 0,0,255)
            else
                for i = 0, 3 do
                    VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
                end
            end
        end
    end

    if brake_neon then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            if CONTROL.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, 3, true)
                VEHICLE.SET_VEHICLE_NEON_LIGHTS_COLOR(vehicle, 255, 0, 0)
            else
                for i = 0, 3 do
                    VEHICLE.SET_VEHICLE_NEON_LIGHT_ENABLED(vehicle, i, false)
                end
            end
        end
    end

    if neons_circle_l then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_cir_l(vehicle)
        end
    end

    if neons_circle_r then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_cir_r(vehicle)
        end
    end

    if neons_halloween then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_halloween(vehicle)
        end
    end

    if neons_follow then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_follow(vehicle)
        end
    end

    if neons_chase then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_chase(vehicle)
        end
    end
    
    if neons_police then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_police(vehicle)
        end
    end

    if colors_police then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        color_police(vehicle)
        end
    end

    if headlights_police then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            headlight_police(vehicle)
        end
    end

    if neons_random then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_random(vehicle)
        end
    end

    if neons_random2 then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_random2(vehicle)
        end
    end

    if neons_blood then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            neon_blood(vehicle)
        end
    end

    if shift_drift and PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
        if CONTROL.IS_CONTROL_PRESSED(2, 21) then
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, true)
        else
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, false)
        end
    end

    if loops1 then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            loop1(vehicle)
        end
    end

    if vehicle and modify then
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, modifier)
    else
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 0)
    end
    
    if VehicleBrakeTog then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            VehicleBrake(vehicle)
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

    if SpamDoors then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            SpamDoors(vehicle)
        end
    end

    if Slam then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, slam_int_, true, true, true, false)
        else
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 0, true, true, true, false)
        end
    end

    if hover then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, slam_int_2, true, true, true, false)
        else
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 0, true, true, true, false)
        end
    end

    if SLAM then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, -15, true, true, true, false)
        else
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 0, true, true, true, false)
        end
    end

    if downforce then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, -8, true, true, true, false)
        else
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 0, true, true, true, false)
        end
    end

    if vehicle and acc then
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 15)
    else
        VEHICLE.MODIFY_VEHICLE_TOP_SPEED(vehicle, 0)
    end

    if flashy_brake then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            if CONTROL.IS_CONTROL_PRESSED(2, 72) then
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
                SYSTEM.WAIT(125)
            else
                VEHICLE.SET_VEHICLE_BRAKE_LIGHTS(vehicle, false)
            end
        end
    end

    if headlight_flasher then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            if CONTROL.IS_CONTROL_PRESSED(2, 157) or CONTROL.IS_CONTROL_PRESSED(2, 38) then
                VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, true)
            else
                VEHICLE.SET_VEHICLE_FULLBEAM(vehicle, false)
            end
        end
    end

    if Beyblades then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 1, 0, 0, 100, 100, 0, 0, true, true, true, false, true)
        else
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, false)
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 1, 0, 0, 0, 0, 0, 0, true, true, true, false, true)
        end
    end
     
    if Fidget then
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, true)
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 1, 0, 0, 1000, 1200, 0, 0, true, true, true, false, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 25, true, true, true, false)
        else
            VEHICLE.SET_VEHICLE_REDUCE_GRIP(vehicle, false)
            ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 1, 0, 0, 0, 0, 0, 0, true, true, true, false, true)
            ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(vehicle, 0, 0, 0, 0, true, true, true, false)
        end
    end


    g_util.yield(10)
end

g_lua.unregister()
