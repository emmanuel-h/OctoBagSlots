local function UpdateBagSlots(self, elapsed)
    print("changement")
    OctoBagSlotsFontString:SetText("55")
end

function OnLoad(self, event, ...)
    self:RegisterEvent("ADDON_LOADED")
end

function BagChange(self, event, ...)
    if (event == "ADDON_LOADED" and ... == "OctoBagSlots") then
        print("OctoBagSlots loaded")
        self:UnregisterEvent("ADDON_LOADED")
        self:RegisterEvent("BAG_UPDATE")
        OctoBagSlots:SetSize(20, 20)
        OctoBagSlots:SetPoint("BOTTOMRIGHT", -267, 2)
        OctoBagSlots:SetScript("OnEvent", UpdateBagSlots)
        local coordsFont2 = OctoBagSlots:CreateFontString("OctoBagSlotsFontString", "ARTWORK", "GameTooltipText")
        OctoBagSlots:SetBackdrop({
            bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
            tile = true, tileSize = 8, edgeSize = 8,
            insets = { left = 1, right = 1, top = 1, bottom = 3 }
        })
        local slotsEmpty = 55
        OctoBagSlotsFontString:SetText(slotsEmpty)
        OctoBagSlotsFontString:SetTextColor(87, 213, 59, 1)
        OctoBagSlots:SetFrameLevel(10)
        coordsFont2:SetPoint("CENTER", "OctoBagSlots", "CENTER", 0, 0)
        coordsFont2:Show()
        OctoBagSlots:Show()
    end
end