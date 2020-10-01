local prefix = "AbyssUI_Version"
local playerName = UnitName("player")
local AddonVersion = GetAddOnMetadata("AbyssUI_TexturePack", "Version")

local function OnEvent(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		--print(event, ...)
	elseif event == "PLAYER_ENTERING_WORLD" then
		local isInitialLogin, isReloadingUi = ...
		if isInitialLogin or isReloadingUi then
			C_ChatInfo.SendAddonMessage(prefix, AddonVersion, "WHISPER", playerName)
			C_ChatInfo.RegisterAddonMessagePrefix(prefix)
			C_ChatInfo.SendAddonMessage(prefix, AddonVersion, "WHISPER", playerName)
		end
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)