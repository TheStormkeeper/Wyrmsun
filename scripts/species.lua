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

DefineSpecies("goat", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180715
	Name = "Goat",
	Kingdom = "animalia",
	Subkingdom = "bilateria",
	Infrakingdom = "deuterostomia",
	Phylum = "chordata",
	Subphylum = "vertebrata",
	Infraphylum = "gnathostomata",
	Superclass = "tetrapoda",
	Class = "mammalia",
	Subclass = "theria",
	Infraclass = "eutheria",
	Order = "artiodactyla",
	Family = "bovidae",
	Subfamily = "caprinae",
	Genus = "capra",
	Species = "hircus",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("yale", {
	Name = "Yale",
	Kingdom = "animalia",
	Subkingdom = "bilateria",
	Infrakingdom = "deuterostomia",
	Phylum = "chordata",
	Subphylum = "vertebrata",
	Infraphylum = "gnathostomata",
	Superclass = "tetrapoda",
	Class = "mammalia",
	Subclass = "theria",
	Infraclass = "eutheria",
	Order = "artiodactyla",
	Family = "bovidae",
	Subfamily = "caprinae",
	Genus = "eale",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("horse", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180691
	Name = "Horse",
	Kingdom = "animalia",
	Subkingdom = "bilateria",
	Infrakingdom = "deuterostomia",
	Phylum = "chordata",
	Subphylum = "vertebrata",
	Infraphylum = "gnathostomata",
	Superclass = "tetrapoda",
	Class = "mammalia",
	Subclass = "theria",
	Infraclass = "eutheria",
	Order = "perissodactyla",
	Family = "equidae",
	Genus = "equus",
	Species = "caballus",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("rat", { -- http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=180363
	Name = "Rat",
	Kingdom = "animalia",
	Subkingdom = "bilateria",
	Infrakingdom = "deuterostomia",
	Phylum = "chordata",
	Subphylum = "vertebrata",
	Infraphylum = "gnathostomata",
	Superclass = "tetrapoda",
	Class = "mammalia",
	Subclass = "theria",
	Infraclass = "eutheria",
	Order = "rodentia",
	Suborder = "myomorpha",
	Superfamily = "muroidea",
	Family = "muridae",
	Subfamily = "murinae",
	Genus = "rattus",
	Species = "norvegicus",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("squirrel", { -- Source: http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value=632439
	Name = "Squirrel", -- Eurasian Red Squirrel
	Kingdom = "animalia",
	Subkingdom = "bilateria",
	Infrakingdom = "deuterostomia",
	Phylum = "chordata",
	Subphylum = "vertebrata",
	Infraphylum = "gnathostomata",
	Superclass = "tetrapoda",
	Class = "mammalia",
	Subclass = "theria",
	Infraclass = "eutheria",
	Order = "rodentia",
	Suborder = "sciuromorpha",
	Family = "sciuridae",
	Subfamily = "sciurinae",
	Tribe = "sciurini",
	Genus = "sciurus",
	Species = "vulgaris",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("bat", {
	Name = "Bat",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("bee", {
	Name = "Bee",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("bird", {
	Name = "Bird",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("blood-bat", {
	Name = "Blood Bat",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("bug", {
	Name = "Bug",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("crow", {
	Name = "Crow",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("dread-bat", {
	Name = "Dread Bat",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("fly", {
	Name = "Fly",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("frog", {
	Name = "Frog",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("gryphon", {
	Name = "Gryphon",
	ChildUpgrade = "upgrade-gryphon-child"
})

DefineSpecies("slime", {
	Name = "Slime",
	ChildUpgrade = "upgrade-child"
})

DefineSpecies("slug", {
	Name = "Slug",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("snail", {
	Name = "Snail",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("snigill", {
	Name = "Snigill",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("worm", {
	Name = "Worm",
	ChildUpgrade = "upgrade-bee-child"
})

DefineSpecies("wyrm", {
	Name = "Wyrm",
	ChildUpgrade = "upgrade-wyrm-child"
})