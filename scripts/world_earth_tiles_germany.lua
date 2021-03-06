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

DefineWorldMapTile({498, 111}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Colonia Agrippina", -- Source: William R. Shepherd, "Historical Atlas", 1911, pp. 38-39; Source: "Ancient Warfare VII.6", 2013, p. 7.
		"teuton", "Köln"
	},
	FactionCulturalSettlementNames = {
		"latin", "France", "Cologne"
	}
})

DefineWorldMapTile({500, 109}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Düsseldorf"
	}
})

DefineWorldMapTile({502, 115}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Borbetomagus", -- not actually the same city as Kaiserslautern (Borbetomagus is Worms), but nevertheless in the Palatinate; Source: William R. Shepherd, "Historical Atlas", 1911, pp. 38-39.
		"teuton", "Kaiserslautern", "name-elements", {
			"compound", "prefix", "high-german", "noun", "singular", "genitive", "Kaiser",
--			"suffix" -- ?
		}
	}
})

DefineWorldMapTile({503, 104}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Oldenburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({503, 114}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Mogontiacum", -- Source: "Ancient Warfare VII.6", 2013, p. 7.
		"teuton", "Mainz"
	}
})

DefineWorldMapTile({503, 117}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Rastatt"
	}
})

DefineWorldMapTile({504, 104}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Bremen"
	}
})

DefineWorldMapTile({506, 100}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Flensburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({506, 109}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Kassel"
	},
	FactionCulturalSettlementNames = {
		"teuton", "England", "Cassel"
	}
})

DefineWorldMapTile({506, 117}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Stuttgart", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Gart" -- possibly? alternatively, it could be a remnant of Old (or Middle) High German "Gart" (two words were spelled like that for OHG)
		}
	}
})

DefineWorldMapTile({507, 107}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Hannover"
	},
	FactionCulturalSettlementNames = {
		"teuton", "England", "Hanover"
	}
})

DefineWorldMapTile({508, 101}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Kiel"
	}
})

DefineWorldMapTile({508, 114}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Würzburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({509, 107}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Braunschweig"
	},
	FactionCulturalSettlementNames = {
		"teuton", "England", "Brunswick"
	}
})

DefineWorldMapTile({510, 102}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Lübeck"
	}
})

DefineWorldMapTile({510, 118}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Augusta Vindelicorum", -- Source: William R. Shepherd, "Historical Atlas", 1911, pp. 38-39.
		"teuton", "Augsburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({511, 110}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Erfurt", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Furt"
		}
	}
})

DefineWorldMapTile({512, 103}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Schwerin"
	}
})

DefineWorldMapTile({513, 107}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Magdeburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
	}
})

DefineWorldMapTile({514, 116}, {
	World = "Earth",
	CulturalSettlementNames = {
		"latin", "Regina Castra",
		"teuton", "Regensburg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Burg"
		}
		-- also "Ratisbon"
	}
})

DefineWorldMapTile({515, 109}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Leipzig"
	}
})

DefineWorldMapTile({518, 106}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Berlin"
	}
})

DefineWorldMapTile({520, 109}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Bautzen"
	}
})

DefineWorldMapTile({521, 103}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Stettin"
	}
})

DefineWorldMapTile({521, 108}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Guben"
	}
})

DefineWorldMapTile({522, 106}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Küstrin"
	}
})

DefineWorldMapTile({523, 102}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Kolberg", "name-elements", {
--			"compound", "prefix", -- ?
			"compound", "suffix", "high-german", "noun", "singular", "Berg"
		}
	}
})

DefineWorldMapTile({526, 110}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Breslau"
	}
})

DefineWorldMapTile({528, 107}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Posen"
	}
})

DefineWorldMapTile({532, 101}, {
	World = "Earth",
	CulturalSettlementNames = {
		"slav", "Gdańsk", -- Polish
		"teuton", "Danzig"
	}
})

DefineWorldMapTile({537, 100}, {
	World = "Earth",
	CulturalSettlementNames = {
		"teuton", "Königsberg", "name-elements", {
			"compound", "prefix", "high-german", "noun", "singular", "genitive", "König",
			"compound", "suffix", "high-german", "noun", "singular", "Berg"
		}
	}
})

