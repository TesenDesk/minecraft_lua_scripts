p = peripheral.find("playerDetector")
c = peripheral.find("chatBox")

local label = '{"text":"Tesen\'s Fission Reactor","color":"gold"}'
local whitelist = 'Tesen_Desk'

local players
local range = 20
local cooldown = 60
local delay = 1
local cd = 0
local rd = 0

function redControl()
while true do
	r = redstone.getAnalogInput('left')
	if (r == 0 and rd == 0) then
		c.sendFormattedMessage('["",{"text":"WARNING!","color":"dark_red"},{"text":" REACTOR MELTDOWN DETECTED AT "},{"text":"Tesen\'s Base","color":"blue"},{"text":"!"}]', label)
		os.sleep(1)
		c.sendFormattedMessage('["",{"text":"EMERGENCY PROTOCOL ACTIVATED."}]', label)
		rd = cooldown * 5
	end
	if rd > 0 then
		rd = rd - 1
	end
	r = redstone.getAnalogInput('top')
	if (r ~= 0) then
		c.sendFormattedMessage('["",{"text":"WARNING!","color":"dark_red"},{"text":" Reactor reboot sequence initiated."}]', label)
	end
	os.sleep(delay)
end
end

function playerDetect()
while true do
	players = p.getPlayersInRange(range)
	os.sleep(delay)
end
end

function chat()
while true do
	if cd > 0 then
		cd = cd - 1
	else
		if players ~= nil and #players ~= 0 then
			playerstring = ""
			if #players > 1 then
				for i = 1, #players do
					playerstring = playerstring .. players[i] .. "\n"
					c.sendFormattedMessage('["",{"text":"Players "},{"text":"<hover>","color":"dark_purple","hoverEvent":{"action":"show_text","contents":"'.. playerstring ..'"}},{"text":" detected near fussion reactor"}]', label)
				cd = cooldown
				end
			elseif players[1] ~= whitelist then
				c.sendFormattedMessage('["",{"text":"Player "},{"text":"' .. players[1] .. '","color":"dark_purple"},{"text":" detected near fission reactor"}]', label)
				cd = cooldown
			end
		end
	end
	os.sleep(delay)
end
end

c.sendFormattedMessage('["",{"text":"Emergency shutdown system is starting. Checking modules..."}]', label)
os.sleep(1)
errors = 0
if c ~= nil then
	c.sendFormattedMessage('["",{"text":"Chat module test: "},{"text":"OK","color":"dark_green","hoverEvent":{"action":"show_text","contents":"System can access the chat"}}]', label)
else
	errors = errors + 1
	c.sendFormattedMessage('["",{"text":"Chat module test: "},{"text":"ERROR","color":"dark_red","hoverEvent":{"action":"show_text","contents":"System can\'t access the chat"}}]', label)
end
os.sleep(1)

if p ~= nil then
	c.sendFormattedMessage('["",{"text":"Personnel module: "},{"text":"OK","color":"dark_green","hoverEvent":{"action":"show_text","contents":"System can see near personnel"}}]', label)
else
	errors = errors + 1
	c.sendFormattedMessage('["",{"text":"Personnel module: "},{"text":"ERROR","color":"dark_red","hoverEvent":{"action":"show_text","contents":"System can\'t see near personnel"}}]', label)
end
os.sleep(1)

if redstone.getAnalogInput('left') ~= 0 then
	c.sendFormattedMessage('["",{"text":"Normal mode signal: "},{"text":"OK","color":"dark_green","hoverEvent":{"action":"show_text","contents":"Normal mode signal detected correctly"}}]', label)
else
	errors = errors + 1
	c.sendFormattedMessage('["",{"text":"Normal mode signal: "},{"text":"ERROR","color":"dark_red","hoverEvent":{"action":"show_text","contents":"No signal detected or emergency situation occurred"}}]', label)
end
os.sleep(1)

c.sendFormattedMessage('["",{"text":"Detection range: "},{"text":"20","color":"aqua"},{"text":".\nRegistered personnel: "},{"text":"Tesen_Desk","color":"aqua"},{"text":".\nAlarm system: "},{"text":"enabled","color":"green"},{"text":".\nTimeout: "},{"text":"60","color":"aqua"},{"text":"."}]', label)
os.sleep(1)
if errors == 0 then
	c.sendFormattedMessage('["",{"text":"Self-testing complete. "},{"text":"No errors found","color":"green"},{"text":". Enabling monitoring mode... "},{"text":"OK","color":"green"},{"text":". Have a very safe day."}]', label)
else
	c.sendFormattedMessage('["",{"text":"Self-testing complete. "},{"text":"'..errors..' errors found","color":"red"},{"text":". I will try to keep you safe anyway. Enabling monitoring mode... "},{"text":"OK","color":"green"},{"text":". Have a very safe day."}]', label)
end


parallel.waitForAny(playerDetect, chat, redControl)