function getTavernGamesWindow()
    return "GameSelectionWindow"
end

aRecords = {
    ["tavernGamesData"] = {
        aDataMap = { "tavernGames"},
        aDisplayIcon = {"icon_tavern_games","icon_tavern_games_down"},
        fGetLink = getTavernGamesWindow
    }
}

function onInit()
    Debug.chat("Records", aRecords)
    for kRecordType,vRecordType in pairs(aRecords) do
		LibraryData.overrideRecordTypeInfo(kRecordType, vRecordType);
	end
end
