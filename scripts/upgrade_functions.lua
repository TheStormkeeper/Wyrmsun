--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      (c) Copyright 2001-2016 by Lutz Sammer, Jimmy Salmon and Andrettin
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

if (OldDefineUpgrade == nil) then
	OldDefineUpgrade = DefineUpgrade
end

function DefineUpgrade(upgrade_ident, data)
	if (data.Parent ~= nil) then
		OldDefineUpgrade(upgrade_ident, {Parent = data.Parent})
		data.Parent = nil
	end
	
	if (data.Work ~= nil) then
		local preliminary_data = {}
		if (data.Work ~= nil) then
			preliminary_data.Work = data.Work
		end
		OldDefineUpgrade(upgrade_ident, preliminary_data)
		data.Work = nil
	end
	
	OldDefineUpgrade(upgrade_ident, data)
	
	if (CUpgrade:Get(upgrade_ident).Ability) then
		DefineAllow(upgrade_ident, "AAAAAAAAAAAAAAAA")
	end
end

function DefineAllowNormalUnits(flags)
	-- Allow units for human players only if they have been acquired
	if ((flags == "AAAAAAAAAAAAAAAA" or flags == "RRRRRRRRRRRRRRRR") and (not IsNetworkGame()) and GetCurrentQuest() ~= "") then
		for i, unitName in ipairs(Units) do
			local PlayerUnitFlag = {}
			local PlayerHeroUnitMax = {}
			for j=0,15 do
				if (string.find(unitName, "upgrade-") == nil) then
					if (
						GetPlayerData(j, "AiEnabled") == false
						and GetUnitTypeData(unitName, "Class") ~= ""
						and GetUnitTypeData(unitName, "Civilization") ~= ""
						and GetArrayIncludes(wyr.preferences.TechnologyAcquired, GetCivilizationClassUnitType(GetUnitTypeData(unitName, "Class"), GetUnitTypeData(unitName, "Civilization"))) == false
						and GetUnitTypeData(unitName, "TechnologyPointCost") > 0
					) then
						PlayerUnitFlag[j] = "F"
					else
						PlayerUnitFlag[j] = "A"
					end
				else
					if (
						GetPlayerData(j, "AiEnabled") == false
						and CUpgrade:Get(unitName).Class ~= ""
						and CUpgrade:Get(unitName).Civilization ~= ""
						and GetArrayIncludes(wyr.preferences.TechnologyAcquired, GetCivilizationClassUnitType(CUpgrade:Get(unitName).Class, CUpgrade:Get(unitName).Civilization)) == false
						and CUpgrade:Get(unitName).TechnologyPointCost > 0
					) then
						PlayerUnitFlag[j] = "F"
					elseif (flags == "RRRRRRRRRRRRRRRR" or unitName == GetCivilizationData(GetPlayerData(j, "RaceName"), "CivilizationUpgrade")) then
						PlayerUnitFlag[j] = "R"
					else
						PlayerUnitFlag[j] = "A"
					end
				end
			end
			DefineAllow(unitName, PlayerUnitFlag[0] .. PlayerUnitFlag[1] .. PlayerUnitFlag[2] .. PlayerUnitFlag[3] .. PlayerUnitFlag[4] .. PlayerUnitFlag[5] .. PlayerUnitFlag[6] .. PlayerUnitFlag[7] .. PlayerUnitFlag[8] .. PlayerUnitFlag[9] .. PlayerUnitFlag[10] .. PlayerUnitFlag[11] .. PlayerUnitFlag[12] .. PlayerUnitFlag[13] .. PlayerUnitFlag[14] .. PlayerUnitFlag[15])
		end
	else
		for i, unitName in ipairs(Units) do
			local PlayerUnitFlag = {}
			for j=0,15 do
				if (string.find(unitName, "upgrade-") == nil) then
					if (flags == "RRRRRRRRRRRRRRRR") then
						PlayerUnitFlag[j] = "A"
					else
						PlayerUnitFlag[j] = string.sub(flags, j + 1, j + 1)
					end
				else
					if (flags == "AAAAAAAAAAAAAAAA" and unitName == GetCivilizationData(GetPlayerData(j, "RaceName"), "CivilizationUpgrade")) then
						PlayerUnitFlag[j] = "R"
					else
						PlayerUnitFlag[j] = string.sub(flags, j + 1, j + 1)
					end
				end
			end
			DefineAllow(unitName, PlayerUnitFlag[0] .. PlayerUnitFlag[1] .. PlayerUnitFlag[2] .. PlayerUnitFlag[3] .. PlayerUnitFlag[4] .. PlayerUnitFlag[5] .. PlayerUnitFlag[6] .. PlayerUnitFlag[7] .. PlayerUnitFlag[8] .. PlayerUnitFlag[9] .. PlayerUnitFlag[10] .. PlayerUnitFlag[11] .. PlayerUnitFlag[12] .. PlayerUnitFlag[13] .. PlayerUnitFlag[14] .. PlayerUnitFlag[15])
		end
	end
end

InitFuncs:add(function()
	DefineAllowNormalUnits("FFFFFFFFFFFFFFFF")
end)

function ApplyTechLevels()
	for j=0,15 do
		if (TechLevel[j + 1] == "" and j ~= GetThisPlayer()) then
			TechLevel[j + 1] = TechLevel[GetThisPlayer() + 1]
		end
		if (MaxTechLevel[j + 1] == "" and j ~= GetThisPlayer()) then
			MaxTechLevel[j + 1] = MaxTechLevel[GetThisPlayer() + 1]
		end
	end

	local agrarian_upgrades = {
		"upgrade-dwarven-masonry", "upgrade-dwarven-runewriting",
		"upgrade-teuton-masonry", "upgrade-teuton-writing",
		"upgrade-goblin-masonry", "upgrade-goblin-writing"
	}
	local civilized_upgrades = {
		"upgrade-dwarven-coinage", "upgrade-dwarven-alchemy",
		"upgrade-teuton-coinage", "upgrade-teuton-alchemy",
		"upgrade-goblin-coinage", "upgrade-goblin-alchemy"
	}
	local bronze_upgrades = {
		"upgrade-dwarven-broad-axe", "upgrade-dwarven-long-spear", "upgrade-dwarven-shield-1", "upgrade-dwarven-sharp-throwing-axe",
		"upgrade-germanic-broad-sword", "upgrade-germanic-long-spear", "upgrade-germanic-bronze-shield", "upgrade-germanic-barbed-arrow",
		"upgrade-goblin-broad-sword", "upgrade-goblin-long-spear", "upgrade-goblin-rimmed-shield", "upgrade-goblin-barbed-arrow",
		"upgrade-dwarven-wood-plow",
		"upgrade-goblin-wood-plow",
		"upgrade-germanic-wood-plow"
	}
	local iron_upgrades = {
		"upgrade-teuton-spatha", "upgrade-teuton-pike", "upgrade-teuton-iron-shield", "upgrade-teuton-bodkin-arrow",
		"upgrade-teuton-catapult-projectile-1", "upgrade-teuton-catapult-projectile-2",
		"upgrade-teuton-iron-tipped-wood-plow",
		"upgrade-frank-spatha",
		"upgrade-dwarven-great-axe", "upgrade-dwarven-pike", "upgrade-dwarven-shield-2", "upgrade-dwarven-bearded-throwing-axe",
		"upgrade-dwarven-ballista-bolt-1", "upgrade-dwarven-ballista-bolt-2",
		"upgrade-dwarven-iron-tipped-wood-plow",
		"upgrade-goblin-long-sword", "upgrade-goblin-pike", "upgrade-goblin-embossed-shield", "upgrade-goblin-bodkin-arrow",
		"upgrade-goblin-catapult-projectile-1", "upgrade-goblin-catapult-projectile-2",
		"upgrade-goblin-iron-tipped-wood-plow"
	}
	
	local function IsTechnologyUnderMinimumTechLevel(technology, player)
		if (GetArrayIncludes(bronze_upgrades, technology) and (TechLevel[player + 1] == "Agrarian (Iron)" or TechLevel[player + 1] == "Civilized (Iron)")) then -- if tech level is at least Agrarian (Iron), bronze technologies should begin researched
			return true
		elseif (GetArrayIncludes(agrarian_upgrades, technology) and (TechLevel[player + 1] == "Civilized (Bronze)" or TechLevel[player + 1] == "Civilized (Iron)")) then
			return true
		else
			return false
		end
	end
	
	local function IsTechnologyOverMaxTechLevel(technology, player)
		if (GetArrayIncludes(iron_upgrades, technology) and (MaxTechLevel[player + 1] == "Agrarian (Bronze)" or MaxTechLevel[player + 1] == "Civilized (Bronze)")) then -- if max tech level is bronze or lower, iron technologies should not be researchable
			return true
		elseif (GetArrayIncludes(civilized_upgrades, technology) and (MaxTechLevel[player + 1] == "Agrarian (Bronze)" or MaxTechLevel[player + 1] == "Agrarian (Iron)")) then
			return true
		else
			return false
		end
	end
	
	for i, unitName in ipairs(Units) do
		if (string.find(unitName, "upgrade-") ~= nil) then
			for j=0,15 do
				if (IsTechnologyUnderMinimumTechLevel(unitName, j) and GetPlayerData(j, "Allow", unitName) == "A") then -- if tech level is at least Agrarian (Iron)
					SetPlayerData(j, "Allow", unitName, "R")
				end
			end
			
			local PlayerUnitFlag = {}
			for j=0,15 do
				if (MaxTechLevel[j + 1] ~= "" and IsTechnologyOverMaxTechLevel(unitName, j) and GetPlayerData(j, "Allow", unitName) == "A") then
					PlayerUnitFlag[j + 1] = "F"
				else
					PlayerUnitFlag[j + 1] = GetPlayerData(j, "Allow", unitName)
				end
			end
			DefineAllow(unitName, PlayerUnitFlag[1] .. PlayerUnitFlag[2] .. PlayerUnitFlag[3] .. PlayerUnitFlag[4] .. PlayerUnitFlag[5] .. PlayerUnitFlag[6] .. PlayerUnitFlag[7] .. PlayerUnitFlag[8] .. PlayerUnitFlag[9] .. PlayerUnitFlag[10] .. PlayerUnitFlag[11] .. PlayerUnitFlag[12] .. PlayerUnitFlag[13] .. PlayerUnitFlag[14] .. PlayerUnitFlag[15] .. PlayerUnitFlag[16])
		end
	end
end
