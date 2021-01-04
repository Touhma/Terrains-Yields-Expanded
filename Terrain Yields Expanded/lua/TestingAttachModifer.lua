include "SupportFunctions"

function AlterMap(PlayerID, bIsFirstTime)
    print('Testing AttachModifier');
    local tContinents = Map.GetContinentsInUse()
    for i, iContinent in ipairs(tContinents) do
        print("Continent found");
        local pPlots = Map.GetContinentPlots(iContinent)

        for i, iPlotIndex in ipairs(pPlots) do
            local pPlot = Map.GetPlotByIndex(iPlotIndex)
            print("Continent Plot found at X" .. pPlot:GetX() .. ", Y" .. pPlot:GetY())
            pPlot:SetProperty("WATER_BOOST_LUA_PROPERTY", 1)
            if (pPlot:IsFreshWater()) then
                print("Plot found with FreshWater at X" .. pPlot:GetX() .. ", Y" .. pPlot:GetY());
                print("trying to attach modifer: ");
                if (pPlot ~= nil) then
                    
                    print("modifer attached at X" .. pPlot:GetX() .. ", Y" .. pPlot:GetY());
                end
                print("end of trying to attach modifer: ");
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
Events.PlayerTurnActivated.Add(OnPlayerTurnActivated)
Events.PlayerTurnActivated.Add(AlterMap)
