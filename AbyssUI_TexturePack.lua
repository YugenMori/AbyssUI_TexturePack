local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)

AddonPrefix = "AbyssUI_Version";
local AddonVersion = GetAddOnMetadata("AbyssUI_TexturePack", "Version")
local function Addon_OnEvent(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		--print("AbyssUI_TexturePack Loaded")
		return nil
	elseif event == "PLAYER_LOGIN" then
		local successfulRequest = C_ChatInfo.RegisterAddonMessagePrefix(AddonPrefix)
		--print(successfulRequest);
	elseif event == "PLAYER_ENTERING_WORLD" then
		C_ChatInfo.SendAddonMessage(AddonPrefix, AddonVersion, "WHISPER", UnitName("player"))
	end
end
local f = CreateFrame("Frame")
f:SetScript("OnEvent", Addon_OnEvent)
f:RegisterEvent("CHAT_MSG_ADDON");
f:RegisterEvent("PLAYER_LOGIN");
f:RegisterEvent("PLAYER_ENTERING_WORLD");