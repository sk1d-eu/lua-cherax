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
                                                                                                    
-- custom-speed
                                                           
g_lua.register()
g_gui.add_toast("Welcome ".. PLAYER.GET_PLAYER_NAME(PLAYER.PLAYER_ID()) .." to Custom License! v1\nHave Fun!", 5000)
g_gui.add_toast("Suggestions to my Discord: ODIN.eu#4435", 5000)

speedolicense = false
isCustomlicOn = false
currentCustomLic = 0;
licSpeed = 333

customlicTexts = {
    {    'learn', 'to', 'use', 'the', 'metric', 'system', 'l ratio'
    },
    {
        ' ', '       C', '      CH', '     CHE', '    CHER', '   CHERA', '  CHERAX', ' CHERAX ', 'CHERAX O', 'HERAX ON', 'ERAX ON ', 'RAX ON T', 'AX ON TO', 'X ON TOP', ' ON TOP ', 'ON TOP  ', 'N TOP   ', ' TOP    ', 'TOP     ', 'OP      ', 'P       ', ' ', 'CHERAX', ' ', ' VIP', ' ', 'CHERAX', ' ', ' VIP', ' ', 'CHERAX', ' ', ' VIP'
    },
    {
        ' ', '       4', '      42', '     420', '    420 ', '   420 S', '  420 SA', ' 420 SAD', '420 SAD  ', '20 SAD   ', '0 SAD    ', ' SAD     ', 'SAD      ', 'AD       ', 'D        ', ' ', '999', 'SAD', '999', 'SAD', '999', 'SAD'
    },
    {
        ' ', '       l', '      lo', '     loo', '    look', '   look ', '  look a', ' look at', 'look at ', 'ook at t', 'ok at th', 'k at the', ' at the ', 'at the s', 't the sk', ' the sky', 'the sky ', 'he sky t', 'e sky to', ' sky ton', 'sky toni', 'ky tonig', 'y tonigh', ' tonight', 'tonight ', 'onight a', 'night al', 'ight all', 'ght all ', 'ht all o', 't all of', ' all of ', 'all of t', 'll of th', 'l of the', ' of the ', 'of the s', 'f the st', ' the sta', 'the star', 'he stars', 'e stars ', ' stars h', 'stars ha', 'tars hav', 'ars have', 'rs have ', 's have a', ' have a ', 'have a r', 'ave a re', 've a rea', 'e a reas', ' a reaso', 'a reason', ' reason ', 'reason  ', 'eason   ', 'ason    ', 'son     ', 'on      ', 'n       ', ' ', 'LIL', 'PEEP', '1 11', 'RIP', 'LIL PEEP', 'LIL PEEP', 'LIL PEEP'
    },
    {
        '     333', '    333 ', '   333  ', '  333   ', ' 333    ', '333     ', '33     3', '3     33'
    },
    {
        '       I', '      I ', '     I N', '    I NE', '   I NEE', '  I NEED', ' I NEED ', 'I NEED H', ' NEED HE', 'NEED HEL', 'EED HELP', 'ED HELP ', 'D HELP  ', ' HELP   ', 'HELP    ', 'ELP     ', 'LP      ', 'P       '
    },
    {
        ' ', '       N', '      NI', '     NIC', '    NICE', '   NICE ', '  NICE N', ' NICE NI', 'NICE NIC', 'ICE NICE', 'IC NICE ', 'C NICE N', ' NICE NI', 'NICE NIC', 'ICE NICE', 'IC NICE ', 'C NICE  ', ' NICE   ', 'NICE    ', 'ICE     ', 'CE      ', 'E       '
    },
    {
        ' ', '       R', '      RO', '     ROY', '    ROYA', '   ROYAL', '  ROYAL ', '  ROYAL ', ' ROYAL W', 'ROYAL WA', 'OYAL WAR', 'YAL WARR', 'AL WARRA', 'L WARRAN', ' WARRANT', 'WARRANTS', 'ARRANTS ', 'RRANTS  ', 'RANTS   ', 'ANTS    ', 'NTS     ', 'TS      ', 'S       '
    },
    {
        ' ', '       B', '      BL', '     BLA', '    BLAC', '   BLACK', '  BLACKE', ' BLACKED', 'BLACKED ', 'LACKED O', 'ACKED OU', 'CKED OUT', 'KED OUT ', 'ED OUT  ', 'D OUT   ', ' OUT    ', 'OUT     ', 'UT      ', 'T       ', ' ', ' NIGCAR ', ' NIGCAR ', ' NIGCAR ', ' NIGCAR ', ' NIGCAR ', ' NIGCAR '
    },
    {
        'niger', 'Caver', 'Mouther', 'hdf', 'Castrated', 'Nuts', 'Cbt', 'COCK', 'Dingus', 'kak', 'bogus', 'stand', 'Coomer', 'camer', 'bozo', 'Greaser', 'hrs', 'stinki', 'milf', 'racist', 'retard', 'lan', 'Mocro', 'Indon', 'Labas', 'Gyopo', 'Chink', 'Kimchi', 'Gyppo', 'Bohunk', 'Laowai', 'Greaser', 'Lugan', 'Pak', 'Raghead', 'Faggot', 'Nignog', 'Nigger', 'Retard', 'Pikey', 'Crow'
    },
    {
        '       d', '      da', '     dad', '    dadd', '   daddy', '  daddy ', ' daddy p', 'daddy pl', 'addy pls', 'ddy pls ', 'dy pls g', 'y pls gi', ' pls giv', 'pls give', 'ls give ', 's give m', ' give me', 'give me ', 'ive me 1', 've me 1c', 'e me 1cu', ' me 1cum', 'me 1cumm', 'e 1cummy', ' 1cummy ', '1cummy o', 'cummy or', 'ummy or 2', 'mmy or 2cu', 'my or 2cum', 'JO WTF', 'JO WTF', 'JO WTF', 'HOW MANY', 'HOW MANY', 'HOW MANY', 'NIGGAS', 'NIGGAS', 'NIGGAS', 'READING', 'READING', 'READING', 'THIS', 'THIS', 'THIS'
    },
    {
        '       a', '      ar', '     are', '    are ', '   are w', '  are we', ' are we ', 'are we t', 're we th', 'e we the', ' we ther', 'we there', 'r there ', ' there y', 'there ye', 'here yet', 'ere yet ', 're yet  ', 'e yet   ', ' yet    ', 'yet     ', 'et      ', 't       '
    },
    {
        '       S', '      SU', '     SUC', '    SUCK', '   SUCK ', '  SUCK M', ' SUCK MY', 'SUCK MY ', 'UCK MY D', 'CK MY DI', 'K MY DIC', ' MY DICK', 'MY DICK ', 'Y DICK  ', ' DICK   ', 'DICK    ', 'ICK     ', 'CK      ', 'K       ', ''
    },
    {
        '       i', '      in', '     ins', '    inse', '   inser', '  insert', ' insert ', 'insert f', 'nsert fu', 'sert fun', 'ert funn', 'rt funny', 't funny ', ' funny j', 'funny jo', 'unny jok', 'nny joke', 'ny joke ', 'y joke  ', ' joke   ', 'joke    ', 'oke     ', 'ke      ', 'e       ', ''
    }
}

function SpeedoLicense()
    while true do
        if customlic == true then goto wait end
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            local veh = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
            speed = ENTITY.GET_ENTITY_SPEED(veh)
            VEHICLE.SET_VEHICLE_MOD_KIT(veh, 0)
            VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, math.floor(speed * 3.6).." kmph")
        end
        if speedolicense == false then break end
        ::wait::
        SYSTEM.WAIT(10)
    end
end

function SetLicSpeed(value)
    if tonumber(value) and tonumber(value) > 0 then
        modifier = tonumber(value)
    end
end

function customlic()
    while isCustomlicOn do
        if PLAYER.IS_PLAYER_IN_ANY_VEHICLE(PLAYER.PLAYER_ID()) then
            local veh = PLAYER.GET_PLAYER_VEHICLE(PLAYER.PLAYER_ID())
            VEHICLE.SET_VEHICLE_MOD_KIT(veh, 0)
            for i = 1, #customlicTexts[currentCustomLic] do
                VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, customlicTexts[currentCustomLic][i])
                if not isCustomlicOn then VEHICLE.SET_VEHICLE_NUMBER_PLATE_TEXT(veh, " ") break end
                g_util.yield(licSpeed)
            end
        end
        if not isCustomlicOn then break end
    end
end

g_gui.add_toggle("vehicle_options", "Licenseplate Features", function(on) lic_window=on
    if lic_window then
        licwindow = g_hooking.register_D3D_hook(License_Plate_Options)
    else
        g_hooking.unregister_hook(licwindow)
    end
end)

function License_Plate_Options()
    if g_gui.is_open() then
		g_imgui.set_next_window_size(vec2(250, 500))
		if g_imgui.begin_window("License Plate Menu", ImGuiWindowFlags_NoResize) then
        g_imgui.begin_child("mod_menu2", vec2(), true)
        g_imgui.add_checkbox("License Plate Speedo KMPH", function(on) speedolicense=on SpeedoLicense() end)
        g_imgui.add_checkbox("License Plate Speedo MPH", function(bool) isCustomlicOn = bool currentCustomLic = 1 customlic() end)
        g_imgui.add_input_string('Set Speed', function(value) SetLicSpeed(value) end)
        g_imgui.add_checkbox("Cherax License Plate", function(bool) isCustomlicOn = bool currentCustomLic = 2 customlic() end)
		g_imgui.add_checkbox("420 SAD", function(bool) isCustomlicOn = bool currentCustomLic = 3 customlic() end)
        g_imgui.add_checkbox("Star Shopping", function (bool) isCustomlicOn = bool currentCustomLic = 4 customlic() end)
        g_imgui.add_checkbox("Half Evil", function(bool) isCustomlicOn = bool currentCustomLic = 5 customlic() end)
        g_imgui.add_checkbox("HELP ME", function(bool) isCustomlicOn = bool currentCustomLic = 6 customlic() end)
        g_imgui.add_checkbox("NICE", function(bool) isCustomlicOn = bool currentCustomLic = 7 customlic() end)
        g_imgui.add_checkbox("Royal Warrants", function(bool) isCustomlicOn = bool currentCustomLic = 8 customlic() end)
        g_imgui.add_checkbox("NIGCAR", function(bool) isCustomlicOn = bool currentCustomLic = 9 customlic() end)
        g_imgui.add_checkbox("slurs", function(bool) isCustomlicOn = bool currentCustomLic = 10 customlic() end)
        g_imgui.add_checkbox("Daddy", function(bool) isCustomlicOn = bool currentCustomLic = 11 customlic() end)
        g_imgui.add_checkbox("Are we there yet?", function(bool) isCustomlicOn = bool currentCustomLic = 12 customlic() end)
        g_imgui.add_checkbox("SMD", function(bool) isCustomlicOn = bool currentCustomLic = 13 customlic() end)
        g_imgui.add_checkbox("Funny Joke", function(bool) isCustomlicOn = bool currentCustomLic = 14 customlic() end)
        g_imgui.end_child()
        g_imgui.end_window()
	    end
    end
end

while g_isRunning do
	g_util.yield(9999999)
end


g_lua.unregister()