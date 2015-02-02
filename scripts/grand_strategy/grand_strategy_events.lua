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
--      grand_strategy_events.lua - Defines the grand strategy events.
--
--      (c) Copyright 2015 by Andre Novellino Gouv�a
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

function LoadEvents(world)
	GrandStrategyEvents = nil
	GrandStrategyEvents = {}

	local NidavellirEvents = {
		ChargeRugnurWithTheOutpost = {
			Name = "Charge Rugnur with the Outpost?",
			Description = "A young dwarf by the name of Rugnur could be an adequate choice for being encharged with one of our border outposts. Do you wish to appoint him for the job?",
			Conditions = function(s) -- can happen for clans other than the Norlund clan, if they conquer the Caverns of Chaincolt in time!
				if (GrandStrategyYear >= 25 and GrandStrategyYear <= 40 and WorldMapProvinces.CavernsOfChaincolt.Owner == EventFaction.Name and WorldMapProvinces.CavernsOfChaincolt.Civilization == "dwarf" and WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur == 0 and WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_steelclad == 0 and WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_thane == 0) then
					return true
				else
					return false
				end
			end,
			Options = {"~!Yes", "~!No"},
			OptionEffects = {
				function(s)
					if (GetArrayIncludes(wyr.preferences.Heroes.Rugnur.upgrades, "unit-dwarven-thane")) then
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_thane = 2
					elseif (GetArrayIncludes(wyr.preferences.Heroes.Rugnur.upgrades, "unit-dwarven-steelclad")) then
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_steelclad = 2
					else
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur = 2
					end
				end,
				function(s)
				end
			},
			OptionTooltips = {"Rugnur appears in Caverns of Chaincolt"}
		},
		TheSagesDeparture = {
			Name = "The Sage's Departure",
			Description = "Discontent with Durstorn's leadership, Thursagan has decided to leave us and move to the far north.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Conditions = function(s)
				if (GrandStrategyYear <= 40 and SyncRand(100) < 10 and FactionHasHero(EventFaction, "unit-hero-thursagan") and FactionHasHero(EventFaction, "unit-hero-durstorn")) then
					return true
				else
					return false
				end
			end,
			Options = {"~!OK"},
			OptionEffects = {
				function(s)
					for province_i, key in ipairs(EventFaction.OwnedProvinces) do
						WorldMapProvinces[key].Heroes.unit_hero_thursagan = 0
					end
					if (WorldMapProvinces.NorthernWastelands.Owner ~= "Norlund Clan") then
						WorldMapProvinces.NorthernWastelands.Heroes.unit_hero_thursagan = 2
					end
				end
			},
			OptionTooltips = {"Thursagan leaves our clan's territory"}
		},
		StrikeABargain = {
			Name = "Strike a Bargain?",
			Description = "The gnomish king Pypo I has arrived with an army behind him near a small border outpost of ours in the Chaincolt Foothills, which is under the charge of a young dwarf named Rugnur.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Conditions = function(s)
				if (
					WorldMapProvinces.CavernsOfChaincolt.Owner == EventFaction.Name
					and ProvinceHasHero(WorldMapProvinces.CavernsOfChaincolt, "unit-hero-rugnur") and ProvinceHasHero(WorldMapProvinces.CavernsOfChaincolt, "unit-hero-baglur") and FactionHasHero(EventFaction, "unit-hero-durstorn")
					and GetFactionProvinceCount(Factions.Untersberg) > 0
					and GetFactionProvinceCount(Factions.ShinsplitterClan) > 0
					and GetFactionProvinceCount(Factions.ShorbearClan) > 0
					and FactionHasBorderWith(Factions.NorlundClan, Factions.ShinsplitterClan)
					and FactionHasBorderWith(Factions.NorlundClan, Factions.ShorbearClan)
				) then
					return true
				else
					return false
				end
			end,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[1].Type = PlayerComputer
					GameSettings.Presets[2].Type = PlayerComputer

					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/chaincolt-foothills.smp")
					RunMap("maps/nidavellir/chaincolt-foothills.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.BrownHills.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.BrownHills.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
				end
				if ("Norlund Clan" ~= GrandStrategyFaction.Name and "Shinsplitter Clan" ~= GrandStrategyFaction.Name) then -- if neither Norlund Clan nor Shinsplitter Clan are played by the human player, then enact the effects of the bargain between the gnomes and Rugnur successfully being struck
					Factions.NorlundClan.Diplomacy.ShinsplitterClan = "War" -- if is grand strategy, begin war between Norlund Clan and Shinsplitter Clan
					Factions.ShinsplitterClan.Diplomacy.NorlundClan = "War"
					Factions.Untersberg.Gold = Factions.Untersberg.Gold - 2500 -- decrease gnomish treasury by 5000 silver (considering for our purposes silver to be worth half as much as gold)
					Factions.NorlundClan.Gold = Factions.NorlundClan.Gold + 2500 -- 5000 silver, and for our purposes silver is considered to be worth half of what gold is
					WorldMapProvinces.CavernsOfChaincolt.Units.unit_gnomish_recruit = WorldMapProvinces.CavernsOfChaincolt.Units.unit_gnomish_recruit + 1
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad = WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad - 1
				end
				GrandStrategyEvent(Factions.ShinsplitterClan, GrandStrategyEvents.ABargainIsStruckShinsplitterClan)
				DrawMinimap()
			end}
		},
		ABargainIsStruckShinsplitterClan = {
			Name = "A Bargain is Struck?",
			Description = "The gnomish king Pypo I has arrived with an army behind him near a small border outpost owned by the Norlund Clan in the Chaincolt Foothills. He is sending them silver caravans as payment for the crafting of an artifact... We should send a few clansfolk there to exact a toll on the passing caravans, since the road the gnomes are travelling through ancestrally belongs to us.",
			Civilization = "dwarf",
			Faction = "Shinsplitter Clan",
			Provinces = {
				SouthernTunnels = true
			},
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[0].Type = PlayerComputer
					GameSettings.Presets[1].Type = PlayerComputer

					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/chaincolt-foothills.smp")
					RunMap("maps/nidavellir/chaincolt-foothills.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.BrownHills.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.BrownHills.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
				end
				if (WorldMapProvinces.CavernsOfChaincolt.Units.unit_gnomish_recruit >= 1) then -- way to check if Norlund Clan successfully transported the caravans
					GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.ClosingTheGates)
				end
			end}
		},
		ClosingTheGates = {
			Name = "Closing the Gates",
			Description = "Although the caravans arrived safely, the arrival of Shinsplitter reinforcements made our position in the Chaincolt Foothills untenable. Rugnur has retreated into the Caverns of Chaincolt, with the Shinsplitters pressing on, and reaching the caves shortly after him.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_durstorn = true
			},
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[1].Type = PlayerComputer

					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/caverns-of-chaincolt.smp")
					RunMap("maps/nidavellir/caverns-of-chaincolt.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (WorldMapProvinces.CavernsOfChaincolt.Owner == "Shinsplitter Clan") then
						for i, unitName in ipairs(Units) do
							if (IsMilitaryUnit(unitName)) then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_durstorn = 0
					else
						for i, unitName in ipairs(Units) do
							if (IsMilitaryUnit(unitName)) then
								if (GetUnitTypeData(unitName, "Class") ~= "worker") then
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
								end
							end
						end
					end
				end
				if ("Norlund Clan" ~= GrandStrategyFaction.Name and "Shinsplitter Clan" ~= GrandStrategyFaction.Name) then
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad = WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad - 1
				end
				GrandStrategyEvent(Factions.ShinsplitterClan, GrandStrategyEvents.ClosingTheGatesShinsplitterClan)
				DrawMinimap()
			end}
		},
		ClosingTheGatesShinsplitterClan = {
			Name = "Closing the Gates",
			Description = "We failed to exact our due from the gnomish caravans, but our reinforcements managed to pursue the enemy to the entrance of their caves...",
			Civilization = "dwarf",
			Faction = "Shinsplitter Clan",
			Provinces = {
				SouthernTunnels = true
			},
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[0].Type = PlayerComputer

					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/caverns-of-chaincolt.smp")
					RunMap("maps/nidavellir/caverns-of-chaincolt.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (WorldMapProvinces.CavernsOfChaincolt.Owner == "Shinsplitter Clan") then
						for i, unitName in ipairs(Units) do
							if (IsMilitaryUnit(unitName)) then
								if (GetUnitTypeData(unitName, "Class") ~= "worker") then
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
								end
							end
						end
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_durstorn = 0
					else
						for i, unitName in ipairs(Units) do
							if (IsMilitaryUnit(unitName)) then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
				end
			end}
		},
		SearchingForTheRunecrafter = {
			Name = "Searching for the Runecrafter",
			Description = "The journey of Rugnur's group to the far northern wastelands was long and perilous. For the tunnels were winding and treacherous, and the paths were not safe from goblins, or worse. Nevertheless, they did reach the northlands, and began to search for the runesmith named Thursagan - the sage of fire.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Units = {
				unit_gnomish_recruit = 1 -- must have a gnomish recruit in the Caverns of Chaincolt
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_durstorn = true
			},
			RandomChance = 50, -- took two years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/northern-wastelands.smp")
					RunMap("maps/nidavellir/northern-wastelands.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.NorthernWastelands.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (GetPlayerData(0, "UnitTypesCount", "unit-hero-thursagan") > 0) then
						WorldMapProvinces.NorthernWastelands.Heroes.unit_hero_thursagan = 0
					end
				end
				if ("Norlund Clan" ~= GrandStrategyFaction.Name) then
					WorldMapProvinces.NorthernWastelands.Heroes.unit_hero_thursagan = 0
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_thursagan = 2
					WorldMapProvinces.NorthernWastelands.SettlementBuildings.unit_dwarven_smithy = 0
					WorldMapProvinces.NorthernWastelands.Units.unit_goblin_spearman = WorldMapProvinces.NorthernWastelands.Units.unit_goblin_spearman / 2 -- halve enemies in the northern wastelands
					WorldMapProvinces.NorthernWastelands.Units.unit_goblin_archer = WorldMapProvinces.NorthernWastelands.Units.unit_goblin_archer / 2
					WorldMapProvinces.CavernsOfChaincolt.Units["unit_dwarven_gryphon_rider"] = 2 -- two gryphon riders joined from the travel to the Northern Wastelands
				end
			end}
		},
		GatheringMaterials = {
			Name = "Gathering Materials",
			Description = "Those who went to the eastern mines were brave indeed. They were infested with goblins and other vile creatures, who thrived in the dark and gloom of the caves. And braver still were Rugnur and his companions, who had to spend two years in those tunnels. For mining is a lengthy business. But they could for the most part avoid the enemy. They only once had to venture into the very heart of the goblins' territory.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Units = {
				unit_gnomish_recruit = 1 -- must have a gnomish recruit in the Caverns of Chaincolt
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_thursagan = true,
				unit_hero_durstorn = true
			},
			RandomChance = 50, -- took two years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/eastern-mines.smp")
					RunMap("maps/nidavellir/eastern-mines.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.EasternMines.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName) + GetPlayerData(2, "UnitTypesCount", unitName) + GetPlayerData(3, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
				end
				if ("Norlund Clan" ~= GrandStrategyFaction.Name) then
					Factions.NorlundClan.Commodities["Coal"] = 20000
	--				WorldMapProvinces.EasternMines.Units.unit_goblin_spearman = WorldMapProvinces.EasternMines.Units.unit_goblin_spearman / 2
	--				WorldMapProvinces.EasternMines.Units.unit_goblin_archer = WorldMapProvinces.EasternMines.Units.unit_goblin_archer / 2
				end
			end}
		},
		HillsOfTheShorbearClan = {
			Name = "Hills of the Shorbear Clan",
			Description = "Durstorn and his entourage went to meet the Shorbear clan's chieftain. Well, all dwarves are known for a love of gold and a heart of stone. The Shorbears were no exception. They were crafters of crafters - they made tools. The best in the land. And they bartered well.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Units = {
				unit_gnomish_recruit = 1 -- must have a gnomish recruit in the Caverns of Chaincolt
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_thursagan = true,
				unit_hero_durstorn = true
			},
			Commodities = {
				Coal = 20000
			},
			RandomChance = 16, -- six years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/shorbear-hills.smp")
					RunMap("maps/nidavellir/shorbear-hills.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								if (unitName ~= "unit-gnomish-recruit") then
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								else
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + math.max(GetPlayerData(0, "UnitTypesCount", unitName) - 1, 0)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								end
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (GameResult == GameVictory) then
						GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.TheWyrm)
					end
				elseif ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEvent(Factions.ShinsplitterClan, GrandStrategyEvents.HillsOfTheShorbearClanShinsplitterClan)
				elseif ("Shorbear Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEvent(Factions.ShorbearClan, GrandStrategyEvents.HillsOfTheShorbearClanShorbearClan)
				else
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad = WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_steelclad - 1 -- Kalnar
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_thane = WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_thane - 3 -- Lyndar, Gaenlar and Glinan
					WorldMapProvinces.ShorbearHills.Units.unit_dwarven_axefighter = 0
					WorldMapProvinces.ShorbearHills.Units.unit_dwarven_thane = 0
					
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_durstorn = 0 -- Durstorn is killed in a conflict between him and other members of the clan
					GrandStrategyEvents.DurstornDies = nil
					WorldMapProvinces.CavernsOfChaincolt.Units.unit_gnomish_recruit = WorldMapProvinces.CavernsOfChaincolt.Units.unit_gnomish_recruit - 1 -- the gnomish envoy returns south
					WorldMapProvinces.BrownHills.Units.unit_gnomish_recruit = WorldMapProvinces.BrownHills.Units.unit_gnomish_recruit + 1
		
					AcquireProvince(WorldMapProvinces.ShorbearHills, "Shinsplitter Clan")
					GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.TheWyrm)
				end
				DrawMinimap()
			end}
		},
		HillsOfTheShorbearClanShinsplitterClan = {
			Name = "Hills of the Shorbear Clan",
			Description = "Our scouts have found out that the Norlunds have gone out of their caves through an exit near the Shorbear Hills... we must be quick, if we are to catch them!",
			Civilization = "dwarf",
			Faction = "ShinsplitterClan",
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[0].Type = PlayerComputer
					GameSettings.Presets[1].Type = PlayerComputer
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/shorbear-hills.smp")
					RunMap("maps/nidavellir/shorbear-hills.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								if (unitName ~= "unit-gnomish-recruit") then
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								else
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + math.max(GetPlayerData(0, "UnitTypesCount", unitName) - 1, 0)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								end
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (GameResult ~= GameVictory and (WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_steelclad == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_thane == 2) and (WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur_thane == 2) and WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_thursagan == 2) then
						GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.TheWyrm)
					end
				end
			end}
		},
		HillsOfTheShorbearClanShorbearClan = {
			Name = "Hills of the Shorbear Clan",
			Description = "The Norlunds are approaching our hills... let us see what they want.",
			Civilization = "dwarf",
			Faction = "ShorbearClan",
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shorbear Clan" == GrandStrategyFaction.Name) then
					GameSettings.Presets[0].Type = PlayerComputer
					GameSettings.Presets[2].Type = PlayerComputer
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/shorbear-hills.smp")
					RunMap("maps/nidavellir/shorbear-hills.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								if (unitName ~= "unit-gnomish-recruit") then
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								else
									WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + math.max(GetPlayerData(0, "UnitTypesCount", unitName) - 1, 0)
									WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(2, "UnitTypesCount", unitName)
									WorldMapProvinces.ShorbearHills.Units[string.gsub(unitName, "-", "_")] = GetPlayerData(1, "UnitTypesCount", unitName)
								end
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
				end
			end}
		},
		TheWyrm = {
			Name = "The Wyrm",
			Description = "Thus the gnomish envoy escaped from his Shinsplitter pursuers. But the dwarves were not so lucky. I would say that, perhaps, their betrayal of Durstorn was coming back to haunt them. For the section of the old eastern mines that they reached in their flight had long since become the lair of Svafnir... the wyrm.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_thursagan = true
			},
			Commodities = {
				Coal = 20000
			},
			RequiredEvents = {
				HillsOfTheShorbearClan = true
			},
			RandomChance = 40, -- two and a half years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					WorldMapProvinces.SouthernTunnels.Units.unit_surghan_mercenary_steelclad = 8 -- Surghan mercenaries hired by the Shinsplitters
					Factions.ShinsplitterClan.Gold = Factions.ShinsplitterClan.Gold - (GetUnitTypeData("unit-surghan-mercenary-steelclad", "Costs", "gold") * 2)
					MercenaryGroups.unit_surghan_mercenary_steelclad = nil
				
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/svafnirs-lair.smp")
					RunMap("maps/nidavellir/svafnirs-lair.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker" and GetUnitTypeData(unitName, "Class") ~= "infantry" and GetUnitTypeData(unitName, "Class") ~= "archer") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (GameResult == GameVictory) then
						Factions.NorlundClan.Commodities["Coal"] = 0 -- Scepter of Fire crafted
						GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.CavernsOfFlame)
					end
				elseif ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEvent(Factions.ShinsplitterClan, GrandStrategyEvents.TheWyrmShinsplitterClan)
				else
					WorldMapProvinces.SouthernTunnels.Units.unit_surghan_mercenary_steelclad = 8 -- Surghan mercenaries hired by the Shinsplitters
					Factions.ShinsplitterClan.Gold = Factions.ShinsplitterClan.Gold - (GetUnitTypeData("unit-surghan-mercenary-steelclad", "Costs", "gold") * 2)
					MercenaryGroups.unit_surghan_mercenary_steelclad = nil
				
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_thane = WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_thane - 1 -- Crintil
					WorldMapProvinces.SouthernTunnels.Units.unit_surghan_mercenary_steelclad = WorldMapProvinces.SouthernTunnels.Units.unit_surghan_mercenary_steelclad - 4
					
					Factions.NorlundClan.Commodities["Coal"] = 0 -- Scepter of Fire crafted
					
					GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.CavernsOfFlame)
				end
				DrawMinimap()
			end}
		},
		TheWyrmShinsplitterClan = {
			Name = "The Wyrm",
			Description = "We have sent a detachment of our warriors to go after the Norlunds in those caves.",
			Civilization = "dwarf",
			Faction = "ShinsplitterClan",
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GameSettings.Presets[0].Type = PlayerComputer
					GetMapInfo("maps/nidavellir/svafnirs-lair.smp")
					RunMap("maps/nidavellir/svafnirs-lair.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker" and GetUnitTypeData(unitName, "Class") ~= "infantry" and GetUnitTypeData(unitName, "Class") ~= "archer") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
					for i, unitName in ipairs(Units) do
						if (IsHero(unitName)) then
							if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
								WorldMapProvinces.CavernsOfChaincolt.Heroes[string.gsub(unitName, "-", "_")] = 2
							end
						end
					end
					if (GameResult ~= GameVictory and (WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_steelclad == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_thane == 2) and (WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur == 2 or WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur_thane == 2) and WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_thursagan) then
						Factions.NorlundClan.Commodities["Coal"] = 0 -- Scepter of Fire crafted
						WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_durstorn = 0
						GrandStrategyEvent(Factions.NorlundClan, GrandStrategyEvents.CavernsOfFlame)
					end
				end
			end}
		},
		CavernsOfFlame = {
			Name = "Caverns of Flame",
			Description = "Rugnur and his companions had reached the realms of the goblins, with the Shinsplitters hot on their trail. And there was no exit from those caves, leaving the Norlunds no way out.",
			Civilization = "dwarf",
			Faction = "NorlundClan",
			Provinces = {
				CavernsOfChaincolt = true
			},
			Heroes = {
				unit_hero_rugnur = true,
				unit_hero_baglur = true,
				unit_hero_thursagan = true
			},
			RequiredEvents = {
				TheWyrm = true
			},
			RandomChance = 40, -- two and a half years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Norlund Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GetMapInfo("maps/nidavellir/caverns-of-flame.smp")
					RunMap("maps/nidavellir/caverns-of-flame.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
				elseif ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEvent(Factions.ShinsplitterClan, GrandStrategyEvents.CavernsOfFlameShinsplitterClan)
				else
					WorldMapProvinces.SouthernTunnels.Units.unit_dwarven_thane = 0
					WorldMapProvinces.SouthernTunnels.Units.unit_surghan_mercenary_steelclad = 0
					
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur = 0 -- Rugnur, Baglur and Thursagan die at the Caverns of Flame
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_steelclad = 0
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_rugnur_thane = 0
					GrandStrategyEvents.RugnurDies = nil
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur = 0
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_baglur_thane = 0
					GrandStrategyEvents.BaglurDies = nil
					WorldMapProvinces.CavernsOfChaincolt.Heroes.unit_hero_thursagan = 0
					GrandStrategyEvents.ThursaganDies = nil

					WorldMapProvinces.CavernsOfChaincolt.Units.unit_dwarven_gryphon_rider = WorldMapProvinces.CavernsOfChaincolt.Units.unit_dwarven_gryphon_rider - 2 -- the dwarven gryphon riders return to the Northern Wastelands

					Factions.NorlundClan.Gold = Factions.NorlundClan.Gold + 2500 -- payment for the crafting of the Scepter
					Factions.Untersberg.Gold = Factions.Untersberg.Gold - 2500 -- payment for the crafting of the Scepter
					WorldMapProvinces.ShorbearHills.Owner = "Norlund Clan" -- Shorbear Hold ceded by the Shinsplitters to the Norlunds and peace established
					Factions.NorlundClan.Diplomacy["ShinsplitterClan"] = "Peace"
					Factions.ShinsplitterClan.Diplomacy["NorlundClan"] = "Peace"
				end
				DrawMinimap()
			end}
		},
		CavernsOfFlameShinsplitterClan = {
			Name = "Caverns of Flame",
			Description = "We have followed the Norlunds deep into goblin territory...",
			Civilization = "dwarf",
			Faction = "ShinsplitterClan",
			TriggeredOnly = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				if ("Shinsplitter Clan" == GrandStrategyFaction.Name) then
					GrandStrategyEventMap = true
					GameSettings.Presets[0].Type = PlayerComputer
					GetMapInfo("maps/nidavellir/caverns-of-flame.smp")
					RunMap("maps/nidavellir/caverns-of-flame.smp")
					GrandStrategyEventMap = false

					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (GetUnitTypeData(unitName, "Class") ~= "worker") then
								WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.CavernsOfChaincolt.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
								WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] = WorldMapProvinces.SouthernTunnels.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(1, "UnitTypesCount", unitName)
							end
						end
					end
				end
			end}
		},
		RugnurDies = {
			Name = "Rugnur Dies",
			Description = "The brave Rugnur has died of natural causes.",
			Civilization = "dwarf",
			Heroes = {
				unit_hero_rugnur = true
			},
			MinYear = 40 + 30, -- died in 40 AD of a violent death, and wasn't old; +30 years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				for province_i, key in ipairs(EventFaction.OwnedProvinces) do
					WorldMapProvinces[key].Heroes.unit_hero_rugnur = 0
					WorldMapProvinces[key].Heroes.unit_hero_rugnur_steelclad = 0
					WorldMapProvinces[key].Heroes.unit_hero_rugnur_thane = 0
				end
			end}
		},
		BaglurDies = {
			Name = "Baglur Dies",
			Description = "The steadfast Baglur has died of natural causes.",
			Civilization = "dwarf",
			Heroes = {
				unit_hero_baglur = true
			},
			MinYear = 40 + 10, -- died in 40 AD of a violent death, but was already rather old; +10 years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				for province_i, key in ipairs(EventFaction.OwnedProvinces) do
					WorldMapProvinces[key].Heroes.unit_hero_baglur = 0
					WorldMapProvinces[key].Heroes.unit_hero_baglur_thane = 0
				end
			end}
		},
		ThursaganDies = {
			Name = "Thursagan Dies",
			Description = "The wise Thursagan has died of natural causes.",
			Civilization = "dwarf",
			Heroes = {
				unit_hero_thursagan = true
			},
			MinYear = 40 + 10, -- died in 40 AD of a violent death, but was already rather old; +10 years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				for province_i, key in ipairs(EventFaction.OwnedProvinces) do
					WorldMapProvinces[key].Heroes.unit_hero_thursagan = 0
				end
			end}
		},
		DurstornDies = {
			Name = "Durstorn Dies",
			Description = "The puissant Durstorn has died of natural causes.",
			Civilization = "dwarf",
			Heroes = {
				unit_hero_durstorn = true
			},
			MinYear = 35 + 15, -- died in 35 AD of a violent death, but was already old; +15 years
			Options = {"~!OK"},
			OptionEffects = {function(s)
				for province_i, key in ipairs(EventFaction.OwnedProvinces) do
					WorldMapProvinces[key].Heroes.unit_hero_durstorn = 0
				end
			end}
		},
		TheFoundingOfKnalga = {
			Name = "The Founding of Knalga",
			Description = "Our clan has expanded through a large territory, and our people have become more and more settled down. Now it is high time for us to to found a new realm, the lordship of Knalga!",
			Civilization = "dwarf",
			FactionType = "tribe",
			Provinces = {
				CavernsOfChaincolt = true,
				SouthernTunnels = true
			},
			Persistent = true, -- can happen multiple times, so that tribes that conquer a lordship can become a polity
			Options = {"~!OK"},
			OptionEffects = {function(s)
				FormFaction(EventFaction, Factions.Knalga)
			end},
			OptionTooltips = {"Our faction becomes Knalga"}
		},
		TheFoundingOfKalKartha = {
			Name = "The Founding of Kal Kartha",
			Description = "Our clan has expanded through a large territory, and our people have become more and more settled down. Now it is high time for us to to found a new realm, the lordship of Kal Kartha!",
			Civilization = "dwarf",
			FactionType = "tribe",
			Provinces = {
				KalKartha = true
			},
			Persistent = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				FormFaction(EventFaction, Factions.KalKartha)
			end},
			OptionTooltips = {"Our faction becomes Kal Kartha"}
		},
		TheFoundingOfLyr = {
			Name = "The Founding of Lyr",
			Description = "Our clan has expanded through a large territory, and our people have become more and more settled down. Now it is high time for us to to found a new realm, the lordship of Lyr!",
			Civilization = "dwarf",
			FactionType = "tribe",
			Provinces = {
				Lyr = true
			},
			Persistent = true,
			Options = {"~!OK"},
			OptionEffects = {function(s)
				FormFaction(EventFaction, Factions.Lyr)
				WorldMapProvinces.Lyr.Map = nil
				WorldMapProvinces.Lyr.Map = "maps/nidavellir/hall-of-lyr.smp"
			end},
			OptionTooltips = {"Our faction becomes Lyr"}
		},
		GoblinLooters = {
			Name = "Goblin Looters",
			Description = "A band of goblin thieves has been looting the farms in PROVINCE_NAME. We have obtained information on where their hideout is... what shall we do?",
			Conditions = function(s)
				for province_i, province_key in ipairs(EventFaction.OwnedProvinces) do
					if (ProvinceHasBuildingType(WorldMapProvinces[province_key], "town-hall") and ProvinceHasBuildingType(WorldMapProvinces[province_key], "barracks") == false and SyncRand(100) < 1) then -- event only fires if there is a province which is settled but does not have proper defenses
						EventProvince = WorldMapProvinces[province_key]
						return true
					end
				end
				return false
			end,
			Persistent = true,
			Options = {"~!Root them out", "~!Better let them be"},
			OptionConditions = {
				function(s)
					for i, unitName in ipairs(Units) do
						if (IsMilitaryUnit(unitName)) then
							if (EventProvince.Units[string.gsub(unitName, "-", "_")] > 0) then
								return true
							end
						elseif (IsHero(unitName)) then
							if (EventProvince.Heroes[string.gsub(unitName, "-", "_")] == 2) then
								return true
							end
						end
					end
				end,
				function(s)
					return true
				end
			},
			OptionEffects = {
				function(s)
					if (EventFaction.Name == GrandStrategyFaction.Name) then
						GrandStrategyEventMap = true
						GetMapInfo("maps/nidavellir/goblin-thief-hideout.smp")
						RunMap("maps/nidavellir/goblin-thief-hideout.smp")
						GrandStrategyEventMap = false

						for i, unitName in ipairs(Units) do
							if (IsMilitaryUnit(unitName)) then
								EventProvince.Units[string.gsub(unitName, "-", "_")] = EventProvince.Units[string.gsub(unitName, "-", "_")] + GetPlayerData(0, "UnitTypesCount", unitName)
							end
						end
						for i, unitName in ipairs(Units) do
							if (IsHero(unitName)) then
								if (GetPlayerData(0, "UnitTypesCount", unitName) > 0) then
									EventProvince.Heroes[string.gsub(unitName, "-", "_")] = 2
								end
							end
						end
						
						if (GameResult == GameDefeat) then -- if lost the battle, lose the gold
							EventFaction.Gold = EventFaction.Gold - 500
						end
					end
				end,
				function(s)
					EventFaction.Gold = EventFaction.Gold - 500
				end
			},
			OptionTooltips = {"Fight the goblin thieves", "-500 Gold"}
		}
	}
	
	local GenericEvents = {
		BountifulHarvest = {
			Name = "Bountiful Harvest",
			Description = "The harvest this year has been exceptionally plentiful, rejoice!",
			Conditions = function(s)
				if (
					SyncRand(100) < 1
				) then
					return true
				else
					return false
				end
			end,
			Persistent = true,
			Options = {"E~!xcellent!"},
			OptionEffects = {
				function(s)
					EventFaction.Gold = EventFaction.Gold + (100 * GetFactionProvinceCount(EventFaction))
				end
			},
			OptionTooltips = {"+100 Gold per province owned"}
		},
		SkilledCarpenters = {
			Name = "Skilled Carpenters",
			Description = "A group of skilled carpenters has come to our country, opening up a workshop in PROVINCE_NAME.",
			Conditions = function(s)
				if (
					SyncRand(100) < 25 -- 25% chance the event happens at all, and then 1% chance that it happens to a particular province, for a total chance of 0.25% of happening if the player has one province (this event shouldn't be common)
				) then
					for province_i, province_key in ipairs(EventFaction.OwnedProvinces) do
						if (SyncRand(100) < 1 and ProvinceHasBuildingType(WorldMapProvinces[province_key], "lumber-mill")) then
							EventProvince = WorldMapProvinces[province_key]
							return true
						end
					end
				else
					return false
				end
			end,
			Persistent = true,
			Options = {"~!OK"},
			OptionEffects = {
				function(s)
					EventFaction.Gold = EventFaction.Gold + 100
					EventFaction.Research = EventFaction.Research + 1
				end
			},
			OptionTooltips = {"+100 Gold, +1 Research"}
		},
		SkilledMasons = {
			Name = "Skilled Masons",
			Description = "A group of skilled masons has come to our country, opening up a workshop in PROVINCE_NAME.",
			Conditions = function(s)
				if (
					SyncRand(100) < 25 -- 25% chance the event happens at all, and then 1% chance that it happens to a particular province, for a total chance of 0.25% of happening if the player has one province (this event shouldn't be common)
					and FactionHasTechnologyType(EventFaction, "masonry")
				) then
					for province_i, province_key in ipairs(EventFaction.OwnedProvinces) do
						if (SyncRand(100) < 1 and ProvinceHasBuildingType(WorldMapProvinces[province_key], "lumber-mill")) then
							EventProvince = WorldMapProvinces[province_key]
							return true
						end
					end
				else
					return false
				end
			end,
			Persistent = true,
			Options = {"~!OK"},
			OptionEffects = {
				function(s)
					EventFaction.Gold = EventFaction.Gold + 100
					EventFaction.Research = EventFaction.Research + 1
				end
			},
			OptionTooltips = {"+100 Gold, +1 Research"}
		}
	}
	
	function AddEventTable(event_table)
		for key, value in pairs(event_table) do
			if (world ~= "Save" or GetArrayIncludes(SavedGrandStrategyEvents, key)) then
				GrandStrategyEvents[key] = {}
				GrandStrategyEvents[key]["Name"] = event_table[key].Name
				GrandStrategyEvents[key]["Description"] = event_table[key].Description
				if (event_table[key].Civilization ~= nil) then
					GrandStrategyEvents[key]["Civilization"] = event_table[key].Civilization
				end
				if (event_table[key].Faction ~= nil) then
					GrandStrategyEvents[key]["Faction"] = event_table[key].Faction
				end
				if (event_table[key].FactionType ~= nil) then
					GrandStrategyEvents[key]["FactionType"] = event_table[key].FactionType
				end
				if (event_table[key].TriggeredOnly ~= nil) then
					GrandStrategyEvents[key]["TriggeredOnly"] = event_table[key].TriggeredOnly
				end
				if (event_table[key].Conditions ~= nil) then
					GrandStrategyEvents[key]["Conditions"] = event_table[key].Conditions
				end
				if (event_table[key].MinYear ~= nil) then
					GrandStrategyEvents[key]["MinYear"] = event_table[key].MinYear
				end
				if (event_table[key].MaxYear ~= nil) then
					GrandStrategyEvents[key]["MaxYear"] = event_table[key].MaxYear
				end
				if (event_table[key].RandomChance ~= nil) then
					GrandStrategyEvents[key]["RandomChance"] = event_table[key].RandomChance
				end
				if (event_table[key].RequiredEvents ~= nil) then
					GrandStrategyEvents[key]["RequiredEvents"] = {}
					for second_key, second_value in pairs(event_table[key].RequiredEvents) do
						GrandStrategyEvents[key].RequiredEvents[second_key] = event_table[key].RequiredEvents[second_key]
					end
				end
				if (event_table[key].Commodities ~= nil) then
					GrandStrategyEvents[key]["Commodities"] = {}
					for second_key, second_value in pairs(event_table[key].Commodities) do
						GrandStrategyEvents[key].Commodities[second_key] = event_table[key].Commodities[second_key]
					end
				end
				if (event_table[key].Provinces ~= nil) then
					GrandStrategyEvents[key]["Provinces"] = {}
					for second_key, second_value in pairs(event_table[key].Provinces) do
						GrandStrategyEvents[key].Provinces[second_key] = event_table[key].Provinces[second_key]
					end
				end
				if (event_table[key].SettlementBuildings ~= nil) then
					GrandStrategyEvents[key]["SettlementBuildings"] = {}
					for second_key, second_value in pairs(event_table[key].SettlementBuildings) do
						GrandStrategyEvents[key].SettlementBuildings[second_key] = event_table[key].SettlementBuildings[second_key]
					end
				end
				if (event_table[key].Units ~= nil) then
					GrandStrategyEvents[key]["Units"] = {}
					for second_key, second_value in pairs(event_table[key].Units) do
						GrandStrategyEvents[key].Units[second_key] = event_table[key].Units[second_key]
					end
				end
				if (event_table[key].Heroes ~= nil) then
					GrandStrategyEvents[key]["Heroes"] = {}
					for second_key, second_value in pairs(event_table[key].Heroes) do
						GrandStrategyEvents[key].Heroes[second_key] = event_table[key].Heroes[second_key]
					end
				end
				if (event_table[key].SecondFaction ~= nil) then
					GrandStrategyEvents[key]["SecondFaction"] = event_table[key].SecondFaction
				end
				if (event_table[key].SecondProvinces ~= nil) then
					GrandStrategyEvents[key]["SecondProvinces"] = {}
					for second_key, second_value in pairs(event_table[key].SecondProvinces) do
						GrandStrategyEvents[key].SecondProvinces[second_key] = event_table[key].SecondProvinces[second_key]
					end
				end
				if (event_table[key].Persistent ~= nil) then
					GrandStrategyEvents[key]["Persistent"] = event_table[key].Persistent
				end
				if (event_table[key].Options ~= nil) then
					GrandStrategyEvents[key]["Options"] = {}
					for i=1,table.getn(event_table[key].Options) do
						table.insert(GrandStrategyEvents[key].Options, event_table[key].Options[i])
					end
				end
				if (event_table[key].OptionConditions ~= nil) then
					GrandStrategyEvents[key]["OptionConditions"] = {}
					for i=1,table.getn(event_table[key].OptionConditions) do
						table.insert(GrandStrategyEvents[key].OptionConditions, event_table[key].OptionConditions[i])
					end
				end
				if (event_table[key].OptionEffects ~= nil) then
					GrandStrategyEvents[key]["OptionEffects"] = {}
					for i=1,table.getn(event_table[key].OptionEffects) do
						table.insert(GrandStrategyEvents[key].OptionEffects, event_table[key].OptionEffects[i])
					end
				end
				if (event_table[key].OptionTooltips ~= nil) then
					GrandStrategyEvents[key]["OptionTooltips"] = {}
					for i=1,table.getn(event_table[key].OptionTooltips) do
						table.insert(GrandStrategyEvents[key].OptionTooltips, event_table[key].OptionTooltips[i])
					end
				end
			end
		end
	end
	
	if (world == "Earth") then
		Load("scripts/grand_strategy/earth_events.lua")
		Load("scripts/grand_strategy/germanic_events.lua")
		Load("scripts/grand_strategy/christianity_events.lua")
		AddEventTable(GenericEvents)
	elseif (world == "Nidavellir") then
		AddEventTable(NidavellirEvents)
		AddEventTable(GenericEvents)
	elseif (world == "Random" or world == "Save") then -- load all events in this case
		Load("scripts/grand_strategy/earth_events.lua")
		Load("scripts/grand_strategy/germanic_events.lua")
		Load("scripts/grand_strategy/christianity_events.lua")
		AddEventTable(NidavellirEvents)
		AddEventTable(GenericEvents)
	end
end
