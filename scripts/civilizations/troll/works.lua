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

DefineUpgrade("upgrade-work-wid-aelfadle", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 190-191, 226.
	Name = _("For Elf-Disease"), -- Wid Aelfadle
	Work = "scroll",
	Civilization = "troll", -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against a disease believed to be elf-caused
--	Quote = "\"Then go in silence, and, though something of a fearful kind or a man should come upon you, say not a single word to it until you reach the herb you marked the night before.\"\n- Wid Aelfadle" -- original
	Quote = "\"Then go in silence, and, though something of a fearful kind or another troll should come upon you, say not a single word to it until you reach the herb you marked the night before.\"\n- For Elf-Disease"
	-- "Elf-Disease" = bewitchment by elves
})

DefineUpgrade("upgrade-work-wid-aelfcynne", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 210-211.
	Name = _("Against the Elven Race"), -- Wid Aelfcynne
	Work = "scroll",
	Civilization = "troll", -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against elves
	Quote = "\"Make a salve against the elven race\"\n- Against the Elven Race"
})

DefineUpgrade("upgrade-work-wid-aelfe-and-wid-sidsan", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 212-213.
	Name = _("Against an Elf and Against Charm-Magic"), -- Wid Aelfe and Wid Sidsan
	Work = "scroll",
	Civilization = "troll" -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against elves
})

DefineUpgrade("upgrade-work-wid-aelfsogothan", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 186-189.
	Name = _("For Elf Hiccup"),
	Work = "scroll",
	Civilization = "troll", -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against a magic believed to be elf-caused ("Wid Aelfsogothan" means "For Elf Hiccup")
	Quote = "\"If a person has elf hiccup, their eyes will be yellow where they should be red.\"\n- For Elf Hiccup"
})

DefineUpgrade("upgrade-work-wid-waeteraelfadle", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 194-195.
	Name = _("For the Water-Elf Disease"), -- Wid Waeteraelfadle
	Work = "scroll",
	Civilization = "troll", -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against a disease believed to be elf-caused
	Quote = "\"Round the wounds I have wreathed the best of healing amulets,\nThat the wounds may neither burn nor burst\"\n- For Water-Elf Disease"
})

DefineUpgrade("upgrade-work-wid-ylfa-gescotum", { -- Source: Felix Grendon, "The Anglo-Saxon Charms", 1909, pp. 208-209.
	Name = _("For Elf-Shot"), -- Wid Ylfa Gescotum
	Work = "scroll",
	Civilization = "troll", -- actually an Anglo-Saxon charm, but here we put is as a troll one since this is a charm against something believed to be elf-caused
	Quote = "\"Be the elf who he may, this will suffice as a cure\"\n- For Elf-Shot"
})

DefineModifier("upgrade-work-wid-aelfadle",
	{"KnowledgeMagic", 1} -- could also be herbology
)

DefineModifier("upgrade-work-wid-aelfcynne",
	{"KnowledgeMagic", 1} -- could also be herbology
)

DefineModifier("upgrade-work-wid-aelfe-and-wid-sidsan",
	{"KnowledgeMagic", 1}
)

DefineModifier("upgrade-work-wid-aelfsogothan",
	{"KnowledgeMagic", 1}
)

DefineModifier("upgrade-work-wid-waeteraelfadle",
	{"KnowledgeMagic", 1} -- could also be herbology
)

DefineModifier("upgrade-work-wid-ylfa-gescotum",
	{"KnowledgeMagic", 1}
)
