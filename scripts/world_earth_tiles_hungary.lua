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

DefineWorldMapTile({528, 118}, {
	World = "Earth",
	CulturalSettlementNames = {
		"slav", "Bratislava",
		"teuton", "Presburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({534, 120}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Aquincum",
		"magyar", "Buda"
	}
})

DefineWorldMapTile({535, 120}, {
	World = "Earth",
	CulturalSettlementNames = {
		"magyar", "Pest"
	}
})

DefineWorldMapTile({536, 127}, {
	World = "Earth",
	CulturalSettlementNames = {
		"slav", "Novi Sad",
		"teuton", "Neusatz", "name-elements", { -- Source: William R. Shepherd, "Historical Atlas", 1911, p. 168.
			"compound", "prefix", "high-german", "adjective", "Neu",
			"compound", "suffix", "high-german", "noun", "singular", "Satz"
		}
	}
})

DefineWorldMapTile({545, 122}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Klausenburg", "name-elements", {
			"compound", "prefix", "high-german", "noun", "plural", "Klause",
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	},
	FactionCulturalSettlementNames = {
		"latin", "Romania", "Cluj"
	}
})

DefineWorldMapTile({545, 126}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Sarmizegetusa" -- Source: "Ancient Warfare VII.6", 2013, p. 7.
	}
})

DefineWorldMapTile({547, 125}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Apulum" -- Source: "Ancient Warfare VII.6", 2013, p. 7.
	}
})
