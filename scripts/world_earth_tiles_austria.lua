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
--      (c) Copyright 2016 by Andrettin
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

DefineWorldMapTile({512, 121}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Innsbruck", "name-elements", {
--			"compound", "prefix", -- the name of the river Inn
			"compound", "suffix", "high-german", "noun", "singular", "Bruck"
		}
	}
})

DefineWorldMapTile({516, 119}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Salzburg", "name-elements", {
			"compound", "prefix", "high-german", "noun", "singular", "Salz",
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({520, 118}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Linz"
	}
})

DefineWorldMapTile({520, 123}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Klagenfurt", "name-elements", {
			"compound", "prefix", "high-german", "noun", "plural", "Klage",
			"compound", "suffix", "high-german", "noun", "singular", "Furt"
		}
	}
})

DefineWorldMapTile({521, 125}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Emona", -- Source: William R. Shepherd, "Historical Atlas", 1911, pp. 38-39.
		"slav", "Ljubljana",
		"teuton", "Laibach", "name-elements", { -- Source: William R. Shepherd, "Historical Atlas", 1911, pp. 158-159.
			"compound", "prefix", "high-german", "noun", "singular", "Lai",
			"compound", "suffix", "high-german", "noun", "singular", "Bach"
		}
	}
})

DefineWorldMapTile({523, 121}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Graz"
	}
})

DefineWorldMapTile({526, 118}, {
	World = "Earth",
	CulturalSettlementNames = {
		"celt", "Vindobona",
		"latin", "Vindobona", -- Source: "Ancient Warfare VII.6", 2013, p. 7.
		"teuton", "Wien"
	}
})

DefineWorldMapTile({527, 119}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Carnuntum" -- Source: "Ancient Warfare VII.6", 2013, p. 7.
	}
})

