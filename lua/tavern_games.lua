-- 
-- Please see the license.html file included with this distribution for 
-- attribution and copyright information.
--

function onInit()
	Comm.registerSlashHandler("taverngame", openWindow);

end

function openWindow()
	Interface.openWindow("GameSelectionWindow",0)
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

function send_message(sText)

          local aMessage = {};
          if(User.isHost()) then
			 aMessage.sender = "DM"
          else
          local rActor = ActorManager.getActorFromCT(CombatManager.getCurrentUserCT());
			 aMessage.sender = rActor.sName;
          end
          aMessage.text = sText 
          aMessage.font = "chatfont";
          aMessage.secret = false;
          Comm.deliverChatMessage(aMessage);

end