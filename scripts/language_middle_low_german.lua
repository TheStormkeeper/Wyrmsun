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

DefineLanguageWord("Blî", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 148.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Lead"}, -- source gives the German "Blei" as the meaning
	DerivesFrom = {"old-saxon", "noun", "Blî"},
	Gender = "neuter"
})

DefineLanguageWord("Blôsem", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 146.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Blossom"}, -- apparently, but it is not clear from the source
	DerivesFrom = {"proto-germanic", "noun", "Blôma"},
	Gender = "feminine"
})

DefineLanguageWord("Darm", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 97.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Intestine"}, -- source gives the German "Darm" as the meaning
	DerivesFrom = {"old-low-german", "noun", "Tharm"}
})

DefineLanguageWord("Sûd", { -- source also gives the alternative form "sûder"; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 223.
	Language = "middle-low-german",
	Type = "adverb",
	Meanings = {"Southward", "In the South"}, -- source gives the German "südwärts, im Süden" as the meaning
	DerivesFrom = {"proto-germanic", "adverb", "Sunþa"}
})

DefineLanguageWord("Vorde", { -- source also gives the alternative form "Vort"; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 120.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Ford"}, -- source gives the German "Furt" as the meaning
	DerivesFrom = {"old-low-german", "noun", "Ford"},
	Gender = "masculine"
})

DefineLanguageWord("Hēde", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, pp. 1, 7.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Flax Fiber"},
	DerivesFrom = {"proto-germanic", "noun", "Hezdōn"},
	Uncountable = true, -- as a material, it is likely to be uncountable
	Gender = "feminine"
})

DefineLanguageWord("Kên", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 4.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Resinous Wood"}
})

DefineLanguageWord("Lôt", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 181.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Lead", "Ball", "Lot"}, -- source gives the German "Blei, Kugel, ein gewisses Gewicht (Loth)" as the meaning
	DerivesFrom = {"proto-germanic", "noun", "Lauda"},
	Gender = "neuter"
})

DefineLanguageWord("Twern", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 6.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Doubly Spun Twine"}
})

DefineLanguageWord("Twernen", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 6.
	Language = "middle-low-german",
	Type = "verb",
	Meanings = {"Twine"}
})

DefineLanguageWord("Wêt", { -- source also gives the alternative form "Wêde"; Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 4.
	Language = "middle-low-german",
	Type = "noun",
	Meanings = {"Woad"}
})