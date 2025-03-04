-- Client-side script inside StarterPlayerScripts
local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer

-- The Discord webhook URL
local webhookUrl = "https://discord.com/api/webhooks/1336821097412165632/b2CpLDrUyQCIioFeqE1t3fTLsQTuZ8rJ1hm9hSS0Ilk5E2Ma59x9lskkguhMtAw704uw"

-- Player's username
local username = player.Name

-- The message content to be sent to Discord
local message = "**User Info:**\n**Username:** " .. username

-- Construct the JSON payload
local data = {
    username = "Logger Bot",  -- Bot name
    content = message,  -- Content to send
    embeds = {
        {
            title = "User Logger",
            description = "Details of the user who triggered the logger.",
            color = 16711680,  -- Red color
            footer = {
                text = "Roblox Logger Script"
            }
        }
    }
}

-- Encode the data into JSON format
local jsonData = HttpService:JSONEncode(data)

-- Define the headers for the POST request
local headers = {
    ["Content-Type"] = "application/json"
}

-- Send the HTTP request to the Discord webhook
local function sendToWebhook()
    local requestData = {
        Url = webhookUrl,
        Body = jsonData,
        Method = "POST",
        Headers = headers
    }
    
    local success, response = pcall(function()
        HttpService:RequestAsync(requestData)
    end)
    
    if success then
        print("Successfully sent data to Discord!")
    else
        print("Failed to send data to Discord: " .. response)
    end
end

-- Call the function to send the data
sendToWebhook()
