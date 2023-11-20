terminal = peripheral.find('inventoryManager')
chat = peripheral.find('chatBox')
chest = "top"
local label = '{"text":"Player undresser","color":"gold"}'
chatFound = true
erro = false

function initialize()
    if (chat == nil) then
        print('Error connecting to chat module. Output switched to terminal')
        chatFound = false
    else
        chat.sendFormattedMessage('["",{"text":"Player undresser by Tesen_Desk","color":"light_purple"},{"text":" v0.1","color":"green"},{"text":" is loading...."}]', label)
    end
    os.sleep(1)
    if (terminal == nil) then
        if (chatFound) then
            chat.sendFormattedMessage('["",{"text":"ERROR!","color":"dark_red"},{"text":" Player inventory terminal not found. Can not continue."}]', label)
        else
            print('Player inventory terminal not found.')
        end
		erro = true
		return
    end
	
	if (terminal.getOwner() == nil) then
        if (chatFound) then
            chat.sendFormattedMessage('["",{"text":"ERROR!","color":"dark_red"},{"text":" Player inventory terminal is not connected to any player. Can not continue."}]', label)
        else
            print('Player inventory terminal not found.')
        end
		erro = true
		return
    end
	
	if (chest == nil) then
		if (chatFound) then
            chat.sendFormattedMessage('["",{"text":"ERROR!","color":"dark_red"},{"text":" Storage chest not found. Can not continue."}]', label)
        else
            print('Chest is nil!')
        end
		erro = true
		return
	end
	
	if (chatFound) then
        chat.sendFormattedMessage('["",{"text":"Loading complete. ","color":"green"},{"text":"Now try to undress player "},{"text":"' .. terminal.getOwner() ..'","color":"light_purple"},{"text":" in 3 seconds. Selected chest position is "},{"text":"'.. chest ..'","color":"gray"},{"text":"."}]', label)
    else
        print('Loaded.')
    end
	
end

function undress()
	items = 64

	while items == 64 do
		items = terminal.removeItemFromPlayer(chest, 64)
		if (chatFound) then
			chat.sendFormattedMessage('["",{"text":"Removed "},{"text":"'.. tostring(items) ..'","color":"green"},{"text":" items."}]', label)
		else
			print('Removed '.. tostring(items) ..' items.')
		end
		os.sleep(1)
	end
	
	if (chatFound) then
		chat.sendFormattedMessage('{"text":"No more items detected. Exiting.... Have a nice day! "}', label)
	else
		print('End of programm.')
	end
    
end

function main()
	initialize()
	if erro then return end
	os.sleep(3)
	undress()
end

main()