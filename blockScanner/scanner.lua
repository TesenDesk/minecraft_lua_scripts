p = peripheral.find('geoScanner')

--default configs
defrad = 16
defblock = "emerald"
defcd = 5

print("Welcome to blockScanner by Tesen_Desk v0.1!")
print("Please enter mod name or block name, uncomplete names supported. [Default = " .. defblock .. "]")
answer = read()
if answer == "" then blockname = defblock
else blockname = answer
end

print("Enter radius of scanning (max = ".. p.getConfiguration()['scanBlocks']['maxCostRadius'] ..") [Default = " .. defrad .. "]")
answer = tonumber(read())
if answer == nil then rad = defrad
else rad = answer
end

print("Enter cooldown in seconds (min = "..p.getConfiguration()['scanBlocks']['cooldown']/1000-1 ..") [Default = "..defcd.."]")
answer = tonumber(read())
if answer == nil then cooldown = defcd
else cooldown = answer
end

print("Searching blocks: " .. blockname .." in "..rad.." blocks around you.")

while true do
--    print("scanning...") 
    list = p.scan(rad)
    if (list == nul) then
        term.setBackgroundColor(colors.red)
        print("Scanning failed! Please check imput data.")
        term.setBackgroundColor(colors.black)
        break
    end
    term.setTextColor(colors.yellow)
    print("Found blocks around:")
    term.setTextColor(colors.cyan)
    table.foreach(list,
        function (k,v)
            if v ~= nil and v['name'] ~= nil then
                if string.find(v['name'], blockname) then
                    print(v['name'] .. " at [" .. v['x'] .. ":" .. v['y'] .. ":" .. v['z'] .. "]")
                end
            end
        end
    )
term.setTextColor(colors.yellow)
print("=-= End of list =-=")
print("Resting... ")
for i = cooldown, 0, -1 do
    write(i .. ".. ")
    sleep(1)
end
write("\n")
term.setTextColor(colors.red)
print("======new scan=======")
term.setTextColor(colors.white)
end
