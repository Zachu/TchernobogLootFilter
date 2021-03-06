function set(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		set[value] = true
	end
	return set
end

function setUniques(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		if itemUnique[value] ~= nil then
			set[itemUnique[value]] = true
		end
	end
	return set
end

function setSets(list)
	local set = {}
	if list[1] == nil then return set end
	for _, value in pairs(list) do
		if itemSet[value] ~= nil then
			set[itemSet[value]] = true
		end
	end
	return set
end

function exists(name)
    if type(name)~="string" then return false end
    return os.rename(name,name) and true or false
end

function isFile(name)
    if type(name)~="string" then return false end
    if not exists(name) then return false end
    local f = io.open(name)
    if f:read(1) then
        f:close()
        return true
    end
    return false
end

function isDir(name)
    return (exists(name) and not isFile(name))
end