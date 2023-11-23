# minecraft_lua_scripts
Scripts for minecraft lua mods

**Installing any script**  
Download the file from any folder and put it in a folder with your in-game computer filesystem.  
If you are not sure how to do this , here are instructions:  
1. Create a folder with your computer. The easiest way to do this is to create any file. Open the command line by clicking on your computer or pocket computer and enter `edit filename` and press Enter. You can try just pasting the code, but this doesn't always work. Press ctrl + v. If you can see the whole code and not just the first line, you don't have to do steps 2 and 3.  Then press Ctrl, select 'Save' and press Enter. Press Ctrl again, select Exit and press Enter.
2. Find out your computer's ID. To do this, write `lua` in the computer console and press Enter. Next, type `os.getComputerID()` and press Enter. Your computer ID will be displayed. If this is the first computer in your world, its ID will probably be zero. Please note that if you break your computer and put it back on again, it will be assigned a new ID and a new file system
3. Place the downloaded file in <your_world>/computercraft/id folder on your real computer (Replace 'id' with the number obtained in step 2). Restart your in-game computer
4. Run the script by entering the file name. 
5. To stop the script, hold Ctrl+T.

### BlockScanner
A simple script to search for specific blocks.  
Scans the area around a player or block and filters the resulting list of blocks.
Displays the found blocks and their location.  
Uses a 'Geo Scanner' block from the 'Advanced Peripherals' mod (version 1.20.1-0.7.32b)  
All you need is the `Advanced Geo Pocket Computer` from the advanced peripherals mod. Perhaps the non-advanced one will do, but it does not support colors, and the cost does not vary much :D  
After launch, enter the name of the mod or block (unfinished name is supported) For example, by entering `cul` the script will find blocks mysticalagri**cul**ture:prosperity_ore and minecraft:s**cul**k_sensor.
Then enter the search radius and the delay between searches. If you do not enter anything, the default values will be entered.  
The script will tell you which blocks are found nearby and their coordinates relative to you (if you are using a pocket computer) or the computer block  
If you see the line 'Blocks found' and then immediately 'End of list', this means no such blocks were found in the specified radius
![img](https://raw.githubusercontent.com/TesenDesk/minecraft_lua_scripts/main/img/1.png)
![img](https://raw.githubusercontent.com/TesenDesk/minecraft_lua_scripts/main/img/2.png)
![img](https://raw.githubusercontent.com/TesenDesk/minecraft_lua_scripts/main/img/found%20clay.png)

### MekanismReactorController
Script to control the reactor, prevent it from melting and control players approaching the reactor.  
NEEDS EDITING  
TODO: add description


### Undresser
A script that "undresses" the player. Transfers all items from player inventory to the chest. This is needed to remove items with the 'curse of binding'.  
NEEDS EDITING  
TODO: add description
