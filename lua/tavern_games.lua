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
       -- Debug.console("self", wc) 
       -- Debug.console("getclass", wc.getClass())
       -- Debug.console("getFrame", wc.getFrame()) 
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

--Do a roll and update the passed control with the value
--nc - number control to update, ie window.first_roll
--d - random value to roll, ie 6
--msg - message to send on rolling
function do_roll(nc,d,msg)
        local roll=math.random(d)
        nc.setValue(roll)
        send_message(msg)
end

--gc - generic control to update, ie window.first_roll
function do_roll_card(nc,gc,d,msg)
        local roll=math.random(d)
		local card="card_"..roll
		nc.setValue(roll)
		gc.setIcon(card,1)
        send_message(msg)
end

--Get the total value for a list of number controls
-- ncList - the ncs to add up, ie {window.first_roll,window.second_roll,window.third_roll}
function get_total(ncList)
        local total=0
        for i=1,#ncList do
                total = total + ncList[i].getValue()
        end
        return total
end

function update_total(nc,ncList)
        local total=get_total(ncList)
        nc.setValue(total)
end

--Returns a string with all ncList values and their total
-- ncList - the ncs to add up and put in the string, ie {window.first_roll,window.second_roll,window.third_roll}
function get_total_string(ncList)
        local total=get_total(ncList)
        local sText = "Final Hand: "
        for i=1,#ncList do
                if(i==#ncList) then
                        sText = sText .. ncList[i].getValue() .. " = " .. total
                else
                        sText = sText .. ncList[i].getValue() .. " + "
                end
        end
        return sText        
end

-------------------------
-- Avandra's Specific
---------------------------

--Add up all values and update the total display for avandras
--nc - the target number control to display the total in, ie window.current_total
--ncList - the list of number class controls to total up, ie {window.first_roll,..}
function avandra_update_total(nc,ncList)
        local total=get_total(ncList)
        nc.setValue(total)
        if(total==7 or total==12) then
                nc.setColor("#008000")
        else
                nc.setColor("#FF0000")
        end
end

--Show the hand for avandras
--ncList - the list of number class controls represnting the die rolls
function avandra_show_hand(ncList)
        local total=get_total(ncList)
        local sText = get_total_string(ncList)
        send_message(sText)
        if(total == 7 or total == 12) then
                send_message("Winner!")
        else
                send_message("Loser, better luck next time!")
        end
end
