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

DefineSpeciesFamily("suidae", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180720
	Name = "Suidae",
	Order = "artiodactyla"
})

DefineSpeciesGenus("bunolistriodon", { -- Source: http://fossilworks.org/bridge.pl?action=taxonInfo&taxon_no=42384
	Name = "Bunolistriodon",
	Family = "suidae",
	Subfamily = "listriodontinae"
})

DefineSpeciesGenus("seta", { -- fictional genus
	Name = "Seta",
	Family = "suidae"
})

DefineSpeciesGenus("sus", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180721
	Name = "Sus",
	CommonName = "Pig",
	Family = "suidae",
	Subfamily = "suinae",
	Tribe = "suini"
})

DefineSpecies("bunolistriodon-lockarti", { -- Source: Mauricio Antón and Jorge Morales, "Madrid antes del hombre", 2009, p. 19.
	Name = "Bunolistriodon",
	Genus = "bunolistriodon",
	Species = "lockarti",
	Homeworld = "Earth",
	Environments = {"plains"}, -- this species lived in Miocene Madrid, which was mostly arid with a swampy lake in the middle
	EvolvesFrom = {"helohyus"},
	Era = "miocene",
	Prehistoric = true,
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("boar", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180722
	Name = "Boar",
	Genus = "sus",
	Species = "scrofa",
	Homeworld = "Earth",
	EvolvesFrom = {"bunolistriodon-lockarti"}, -- Bunolistriodon was an earlier suid
	Era = "holocene",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("gullinbursti", { -- named after the mythical boar (in Norse mythology) Gullinbursti
	Name = "Gullinbursti",
	Genus = "seta", -- "bristle" in Latin
	Species = "aurea", -- "golden" in Latin
	Homeworld = "Nidavellir",
	Environments = {"swamp"}, -- should be dark plains
	EvolvesFrom = {"bunolistriodon-lockarti"}, -- Bunolistriodon was an earlier suid
	Era = "holocene",
	ChildUpgrade = "upgrade-child"
})