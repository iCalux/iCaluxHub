if game.Players.LocalPlayer.UserId == 158212026 or 193951021 then
local Lib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/iCalux/Notifications/main/BoredStuffSource.lua"),true))()
Lib.prompt('iCalux Hub', 'Hello ' ..game.Players.LocalPlayer.Name.. ', Access Enabled')
wait(2.5) 
--script here
loadstring(game:HttpGet("https://raw.githubusercontent.com/iCalux/iCaluxHub/main/Testing.lua"))();

else
local Lib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/iCalux/Notifications/main/BoredStuffSource.lua"),true))()
Lib.prompt('iCalux Hub', 'Hello ' ..game.Players.LocalPlayer.Name.. ', Access Denied')
wait(2.5)
game.Players.LocalPlayer:Kick(''..game.Players.LocalPlayer.Name.. ', Access Denied')

end
