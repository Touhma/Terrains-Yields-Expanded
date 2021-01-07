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

function PlotIsAdjacentToLake(pPlot)
    local iX, iY = pPlot:GetX(), pPlot:GetY()
    for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
        local adjacentPlot = Map.GetAdjacentPlot(iX, iY, direction);
        if (adjacentPlot and adjacentPlot:IsLake()) then
            return true
        end
    end
    return false
end

function PlotIsAdjacentToCoast(pPlot)
    local iX, iY = pPlot:GetX(), pPlot:GetY()
    for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
        local adjacentPlot = Map.GetAdjacentPlot(iX, iY, direction);
        if (adjacentPlot and adjacentPlot:GetTerrainType() == TERRAIN_TYPE_COAST and not adjacentPlot:IsLake()) then
            return true
        end
    end
    return false
end

function PlotIsAdjacentToMountain(pPlot)
    local iX, iY = pPlot:GetX(), pPlot:GetY()
    for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
        local adjacentPlot = Map.GetAdjacentPlot(iX, iY, direction);
        if (adjacentPlot and adjacentPlot:IsMountain()) then
            return true
        end
    end
    return false
end

TERRAIN_TYPE_COAST = GetGameInfoIndex("Terrains", "TERRAIN_COAST");

TERRAIN_TYPE_GRASS = GetGameInfoIndex("Terrains", "TERRAIN_GRASS");
TERRAIN_TYPE_GRASS_HILLS = GetGameInfoIndex("Terrains", "TERRAIN_GRASS_HILLS");
TERRAIN_TYPE_GRASS_MOUNTAIN = GetGameInfoIndex("Terrains", "TERRAIN_GRASS_MOUNTAIN");
TERRAIN_TYPE_PLAINS = GetGameInfoIndex("Terrains", "TERRAIN_PLAINS");
TERRAIN_TYPE_PLAINS_HILLS = GetGameInfoIndex("Terrains", "TERRAIN_PLAINS_HILLS");
TERRAIN_TYPE_PLAINS_MOUNTAIN = GetGameInfoIndex("Terrains", "TERRAIN_PLAINS_MOUNTAIN");
TERRAIN_TYPE_DESERT = GetGameInfoIndex("Terrains", "TERRAIN_DESERT");
TERRAIN_TYPE_DESERT_HILLS = GetGameInfoIndex("Terrains", "TERRAIN_DESERT_HILLS");
TERRAIN_TYPE_DESERT_MOUNTAIN = GetGameInfoIndex("Terrains", "TERRAIN_DESERT_MOUNTAIN");
TERRAIN_TYPE_TUNDRA = GetGameInfoIndex("Terrains", "TERRAIN_TUNDRA");
TERRAIN_TYPE_TUNDRA_HILLS = GetGameInfoIndex("Terrains", "TERRAIN_TUNDRA_HILLS");
TERRAIN_TYPE_TUNDRA_MOUNTAIN = GetGameInfoIndex("Terrains", "TERRAIN_TUNDRA_MOUNTAIN");
TERRAIN_TYPE_SNOW = GetGameInfoIndex("Terrains", "TERRAIN_SNOW");
TERRAIN_TYPE_SNOW_HILLS = GetGameInfoIndex("Terrains", "TERRAIN_SNOW_HILLS");
TERRAIN_TYPE_SNOW_MOUNTAIN = GetGameInfoIndex("Terrains", "TERRAIN_SNOW_MOUNTAIN");

-- > Terrain + Type --> River --> Lake  --> Coast --> Mountain
function AlterMap(PlayerID, bIsFirstTime)
    print('Testing AttachModifier');

    local tContinents = Map.GetContinentsInUse()
    for i, iContinent in ipairs(tContinents) do
        print("Continent found");
        local pPlots = Map.GetContinentPlots(iContinent)
        for i, iPlotIndex in ipairs(pPlots) do
            print("Plot found");
            local pPlot = Map.GetPlotByIndex(iPlotIndex)

            pFreshWater = false;
            pRiverSide = false;
            pMountainSide = false;
            pCoastLandSide = false;
            pIsOasis = false;
            pLakeSide = false;

            pTileString = "";
            pModificationNeeded = false;
            if (pPlot ~= nil) then
                print("Test Starting : ");
                print("Test IsCoastalLand : ");

                if (pPlot:IsFreshWater()) then
                    pFreshWater = true;
                    print("Test IsRiverSide : ");
                    if (pPlot:IsRiverSide()) then
                        pRiverSide = true;
                    end

                    if (PlotIsAdjacentToLake(pPlot)) then
                        pLakeSide = true;
                    end

                    -- if (not pRiverSide and not pLakeSide) then
                    --    pIsOasis = true;
                    -- end
                end

                if (PlotIsAdjacentToCoast(pPlot)) then
                    -- is coast
                    pCoastLandSide = true;
                end

                if (PlotIsAdjacentToMountain(pPlot)) then
                    -- is next to
                    pMountainSide = true;
                end

                print("Test Done : ");

                if (pRiverSide or pMountainSide or pCoastLandSide or pLakeSide) then
                    pModificationNeeded = true;
                end
                -- if modif needed
                if (pModificationNeeded) then
                    if (pPlot:GetTerrainType() == TERRAIN_TYPE_GRASS) then
                        pTileString = "TERRAIN_GRASS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_GRASS_HILLS) then
                        pTileString = "TERRAIN_GRASS_HILLS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_PLAINS) then
                        pTileString = "TERRAIN_PLAINS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_PLAINS_HILLS) then
                        pTileString = "TERRAIN_PLAINS_HILLS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_DESERT) then
                        pTileString = "TERRAIN_DESERT";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_DESERT_HILLS) then
                        pTileString = "TERRAIN_DESERT_HILLS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_TUNDRA) then
                        pTileString = "TERRAIN_TUNDRA";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_TUNDRA_HILLS) then
                        pTileString = "TERRAIN_TUNDRA_HILLS";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_SNOW) then
                        pTileString = "TERRAIN_SNOW";
                    elseif (pPlot:GetTerrainType() == TERRAIN_TYPE_SNOW_HILLS) then
                        pTileString = "TERRAIN_SNOW_HILLS";
                    elseif (true) then
                        -- Terrain not valid
                        pModificationNeeded = false;
                    end

                    if (pModificationNeeded) then
                        pTileString = pTileString .. "_ADJACENT";
                        if (pRiverSide) then
                            pTileString = pTileString .. "_RIVER";
                        end
                        if (pLakeSide) then
                            pTileString = pTileString .. "_LAKE";
                        end
                        if (pCoastLandSide) then
                            pTileString = pTileString .. "_COAST";
                        end
                        if (pMountainSide) then
                            pTileString = pTileString .. "_MOUNTAIN";
                        end
                        print("string done : " .. pTileString);
                        TerrainBuilder.SetTerrainType(pPlot, GetGameInfoIndex("Terrains", pTileString));
                        print("plot setup done  ");
                    end
                end
            end
        end
    end
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
