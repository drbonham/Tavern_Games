-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	Comm.registerSlashHandler("taverngame", openWindow);
	--[[
	GameSystem.actions["rolld"] = { bUseModStack = false };
	ActionsManager.registerResultHandler("rolld", onRoll);

	-- send launch message
	local msg = {sender = "", font = "emotefont"};
	msg.text = "DMFirmy's Drop Lowest loaded. Type \"/rolld ?\" for usage.";
	ChatManager.registerLaunchMessage(msg);
	]]
end

function openWindow()
	Interface.openWindow("GambitofOrd",0)
end


function game_init(wc)
        Debug.console("self", wc)
        Debug.console("getclass", wc.getClass())
        Debug.console("getFrame", wc.getFrame())
end

function roll_1d20()
        return math.random(20)
end

function roll_1d10()
        return math.random(10)
end

function roll_1d8()
        return math.random(8)
end

function roll_1d6()
        return math.random(6)
end

function roll_1d4()
        return math.random(4)
end