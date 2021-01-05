function GetGameInfoIndex(table_name, type_name)
    local index;
    local table = GameInfo[table_name];
    if (table) then
        local t = table[type_name];
        if (t) then
            index = t.Index;
        end
    end

    return index;
end

function AlterMap(PlayerID, bIsFirstTime)
    print('Testing AttachModifier');
    local terrain_grass = GetGameInfoIndex("Terrains", "TERRAIN_GRASS");
    local terrain_grass_river = GetGameInfoIndex("Terrains", "TERRAIN_GRASS_RIVER");
    local tContinents = Map.GetContinentsInUse()
    for i, iContinent in ipairs(tContinents) do
        print("Continent found");
        local pPlots = Map.GetContinentPlots(iContinent)
        for i, iPlotIndex in ipairs(pPlots) do
            local pPlot = Map.GetPlotByIndex(iPlotIndex)
            print("Continent Plot found at X" .. pPlot:GetX() .. ", Y" .. pPlot:GetY())
            if (pPlot:IsRiverSide()) then
                if (pPlot ~= nil) then
                    print("Plot Type :" .. pPlot:GetTerrainType());
                    print("Plot TERRAIN_GRASS_RIVER :" ..terrain_grass);
                    if (pPlot:GetTerrainType() == terrain_grass) then
                        TerrainBuilder.SetTerrainType(pPlot, terrain_grass_river)
                    end
                end
            end
        end
    end
    print('End Testing AttachModifier');
end

function OnPlayerTurnActivated(PlayerID, bIsFirstTime)
    print("Turn Activated for Player # " .. PlayerID)
    if (bIsFirstTime == false) then
        print("This is not the first time the event has fired for the player for this turn")
        print("We should end the function!")
        return
    end
    local pPlayer = Players[PlayerID]
    local sCivTypeName = PlayerConfigurations[PlayerID]:GetCivilizationTypeName()
    local sLeaderTypeName = PlayerConfigurations[PlayerID]:GetLeaderTypeName()
    local sCivTextName = Locale.Lookup(GameInfo.Civilizations[sCivTypeName].Name)
    local sLeaderTextName = Locale.Lookup(GameInfo.Leaders[sLeaderTypeName].Name)
    if pPlayer:IsHuman() then
        print("Player # " .. PlayerID .. " is a human player")
    else
        if pPlayer:IsMajor() then
            print("Player # " .. PlayerID .. " is a major civilization AI player")
        elseif pPlayer:IsBarbarian() then
            print("Player # " .. PlayerID .. " is the Barbarian player")
        else
            print("Player # " .. PlayerID .. " is either a City-State or a Free City player")
        end
    end
    print("The player's Civilization is " .. sCivTextName)
    print("The player's Leader is " .. sLeaderTextName)
end

LuaEvents.NewGameInitialized.Add(OnPlayerTurnActivated)
Events.PlayerTurnActivated.Add(AlterMap)
