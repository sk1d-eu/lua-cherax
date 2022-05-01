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
--[        thanks bonglover420 for helping me with some shit         ]--


g_lua.register()

g_gui.add_toast("Welcome ".. PLAYER.GET_PLAYER_NAME(PLAYER.PLAYER_ID()) .." to Better Neons! v1.1\nHave Fun!", 5000)
g_gui.add_toast("Suggestions to my Discord: ODIN.eu#4435", 5000)


local reative_neon = false
local brake_neon = false
local neons_circle_l = false
local neons_circle_r = false
local neons_follow = false
local neons_chase = false
local neons_police = false
local neons_random = false
local neons_random2 = false
local set_neon_delay = 100
local complete_l = true
local complete_r = true
local complete_f = true
local complete_c = true
local complete_p = true
local complete_ra = true
local complete_ra2 = true

g_gui.add_toggle("vehicle_options", "Brake Neons", "Will make vehicles neon lights go red if you break.", function(bool) brake_neon = bool end)
g_gui.add_toggle("vehicle_options", "Police Neons", "Will make vehicles neon lights flashing in Police colors.", function(bool) neons_police = bool end)
g_gui.add_toggle("vehicle_options", "Reactive Neons", "Will make vehicles neon lights react to your driving.", function(bool) reative_neon = bool end)
g_gui.add_input_int("vehicle_options", "Speed", set_neon_delay, 1, 2147483647, 1, 1, function(int) set_neon_delay = int end)
g_gui.add_toggle("vehicle_options", "Chasing Neons", "Will make vehicles neon lights chase your car.", function(bool) neons_chase = bool end)
g_gui.add_toggle("vehicle_options", "Circle Neons (Left)", "Will make vehicles neon lights go left around the car (against the clock).", function(bool) neons_circle_l = bool end)
g_gui.add_toggle("vehicle_options", "Circle Neons (Right)", "Will make vehicles neon lights go right around the car (clock whise).", function(bool) neons_circle_r = bool end)
g_gui.add_toggle("vehicle_options", "Following Neons", "Will make vehicles neon lights follow your car.", function(bool) neons_follow = bool end)
g_gui.add_toggle("vehicle_options", "Random Neon", "Will make one vehicle neon light flashing in random order and color.", function(bool) neons_random = bool end)
g_gui.add_toggle("vehicle_options", "Random Neons 2", "Will make vehicles neon lights flashing in random order and color.", function(bool) neons_random2 = bool end)

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

function neon_random(vehicle)
    if complete_ra then
        local complete_ra = false
        --( local random_num = random_bool() )-- / removed feature leftover, activate when you want (instead of true put "random_num" in line 238)
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

    g_util.yield(300)
end

g_lua.unregister()