local function printRemoteEventArguments(eventName, ...)
	print(eventName .. " Invoked!")
	local args = {...}
	for i, arg in ipairs(args) do
		print("Argument " .. i .. ":", arg)
	end
end

local function findRemoteEvents(object)
	if object:IsA("RemoteEvent") then
		object.OnClientEvent:Connect(function(...)
			printRemoteEventArguments(object.Name, ...)
		end)
	end
	for _, child in ipairs(object:GetChildren()) do
		findRemoteEvents(child)
	end
end

findRemoteEvents(game)
