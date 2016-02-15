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
--      (c) Copyright 2015-2016 by Andrettin
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

DefineLanguageWord("Adel", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 14.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Lineage", "Noble Lineage", "Noble"}, -- source gives "Geschlecht, edles Geschlecht, Adel" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Adal"},
	Gender = "masculine"
})

DefineLanguageWord("Bach", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 133.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Stream"}, -- source gives the German "Bach" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Bah"},
	Gender = "masculine"
})

DefineLanguageWord("Bat", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 133.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Bath", "Baths"}, -- source gives the German "Bad" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Bad"},
	Gender = "neuter"
})

DefineLanguageWord("Berc", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 137.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Mountain", "Hill"}, -- source gives "Berg" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Berg"},
	NumberCaseInflections = {
		"singular", "genitive", "Berges"
	},
	Gender = "masculine"
})

DefineLanguageWord("Blî", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 148.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Lead"}, -- source gives the German "Blei" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Blîo"},
	Gender = "neuter"
})

DefineLanguageWord("Bluome", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 146.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Flower"}, -- source gives the German "Blume" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Bluomo"},
	Gender = "masculine"
})

DefineLanguageWord("Bluost", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 146.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Blossom"}, -- apparently, but it is not clear from the source
	DerivesFrom = {"proto-germanic", "noun", "Blôma"},
	Gender = "feminine"
})

DefineLanguageWord("Brort", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 9.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {},
	DerivesFrom = {"old-high-german", "noun", "Brort"}
})

DefineLanguageWord("Brücke", { -- source also gives the alternative form "Brügge"; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 145.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Bridge"}, -- source gives the German "Brücke" as the meaning
	Gender = "feminine",
	DerivesFrom = {"old-high-german", "noun", "Prucca"}
})

DefineLanguageWord("Burc", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 137.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Fortified Place", "Castle", "Palace", "City", "Town"}, -- source gives "befestigter Ort, Burg, Schloß, Stadt" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Burg"},
	Gender = "feminine"
})

DefineLanguageWord("Darm", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 97.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Intestine"}, -- source gives the German "Darm" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Daram"},
	Gender = "masculine",
	NumberCaseInflections = {
		"plural", "nominative", "Derme"
	}
})

DefineLanguageWord("Dorf", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 100.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Village"}, -- source gives the German "Dorf" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Dorf"},
	Gender = "neuter"
})

DefineLanguageWord("Êr", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 11.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Ore", "Iron"}, -- source gives the German "Erz, Eisen" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Êr"},
	Gender = "neuter"
})

DefineLanguageWord("Gart", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 8.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Prickle", "Stick for Driving Animals"},
	Gender = "masculine"
})

DefineLanguageWord("Glanst", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 81.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Shine"}, -- source gives the German "Glanz" as the meaning
	DerivesFrom = {"old-high-german", "adjective", "Glanz"},
	Gender = "masculine"
})

DefineLanguageWord("Glanz", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 81.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Shine", "Glow"}, -- source gives the German "Glanz, Schimmer" as the meaning
	DerivesFrom = {"old-high-german", "adjective", "Glanz"},
	Gender = "masculine"
})

DefineLanguageWord("Glanz", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 81.
	Language = "middle-high-german",
	Type = "adjective",
	Meanings = {"Bright", "Shining"}, -- source gives the German "hell, glänzend" as the meaning
	DerivesFrom = {"old-high-german", "adjective", "Glanz"}
})

DefineLanguageWord("Glinzen", { -- strong verb; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 81.
	Language = "middle-high-german",
	Type = "verb",
	Meanings = {"Shine"}, -- source gives the German "glänzen" as the meaning
	DerivesFrom = {"proto-germanic", "verb", "Glent"}
})

DefineLanguageWord("Golt", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 73.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Gold"}, -- source gives the German "Gold" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Gold"},
	Gender = "neuter",
	NumberCaseInflections = {
		"singular", "genitive", "Goldes"
	},
})

DefineLanguageWord("Got", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 76.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"God"}, -- source gives the German "Gott" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Got"}
})

DefineLanguageWord("Hert", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 46.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Stove"}, -- source gives "Herd" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Herd"},
	Gender = "masculine",
	NumberCaseInflections = {
		"singular", "genitive", "Herdes"
	}
})

DefineLanguageWord("Hort", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 8.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Treasure"},
	DerivesFrom = {"old-high-german", "noun", "Hort"}
})

DefineLanguageWord("Îsern", { -- source also gives the alternative form "Îsen"; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 24.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Iron"}, -- source gives the German "Eisen" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Îsarn"},
	Gender = "neuter"
})

DefineLanguageWord("Kien", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, pp. 4, 7.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Fir", "Spruce"," Fir Splinter", "Fir Torch", "Spruce Splinter", "Spruce Torch"},
	Gender = "masculine"
})

DefineLanguageWord("Lēren", { -- causative verb; Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 5.
	Language = "middle-high-german",
	Type = "verb",
	Meanings = {"Teach"}
})

DefineLanguageWord("Lernen", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 5.
	Language = "middle-high-german",
	Type = "verb",
	Meanings = {"Learn"}
})

DefineLanguageWord("Lôt", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 181.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Pourable Metal", "Cast Metal Weight"}, -- source gives the German "gießbares Metall, gegossenes Metallgewicht" as the meaning
	DerivesFrom = {"proto-germanic", "noun", "Lauda"},
	Gender = "neuter"
})

DefineLanguageWord("Marc", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 9.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Marrow"},
	DerivesFrom = {"old-high-german", "noun", "Marc"},
	NumberCaseInflections = {
		"singular", "genitive", "Marges"
	}
})

DefineLanguageWord("Miete", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 7.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Payment", "Reward", "Bribe"},
	DerivesFrom = {"old-high-german", "noun", "Mēta"},
	Gender = "feminine"
})

DefineLanguageWord("Nare", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 9.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Salvation", "Rescue", "Nourishment", "Sustenance"},
	Gender = "feminine"
})

DefineLanguageWord("Nerigen", { -- source also gives alternative forms "Neren" and "Nern"; Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 9.
	Language = "middle-high-german",
	Type = "verb",
	Meanings = {"Heal", "Sustain the Life of", "Save", "Protect", "Nourish"}
})

DefineLanguageWord("Ort", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, pp. 1, 8.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Point", "Corner", "Edge of a Part", "Edge of a Piece", "Edge of a Small Coin"},
	DerivesFrom = {"old-high-german", "noun", "Ort"},
	Gender = "masculine"
})

DefineLanguageWord("Ôsten", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 12.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"East"}, -- source gives the German "Osten" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Ôstan"},
	Gender = "masculine" -- can also be neuter
})

DefineLanguageWord("Ôsten", { -- source gives "Ôsten(e)"; Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 12.
	Language = "middle-high-german",
	Type = "adverb",
	Meanings = {"From the East", "In the East", "To the East"}, -- source gives the German "von Osten, im Osten, nach Osten" as the meaning
	DerivesFrom = {"old-high-german", "adverb", "Ôstana"}
})

DefineLanguageWord("Rünne", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 8.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Storm Surge"},
	Gender = "feminine"
})

DefineLanguageWord("Silber", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 221.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Silver"}, -- source gives the German "Silber" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Silabar"},
	Gender = "neuter"
})

DefineLanguageWord("Sund", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 223.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"South"}, -- source gives the German "Süden" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Sundar"}
})

DefineLanguageWord("Viur", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, p. 127.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Fire"}, -- source gives "Feuer" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Fuir"},
	Gender = "neuter"
})

DefineLanguageWord("Vurt", { -- Source: August Fick and Alf Torp, "Wortschatz der Germanischen Spracheinheit", 2006, pp. 120-121.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Ford", "Path", "Riverbed"}, -- source gives the German "Furt, Weg, Flußbett" as the meaning
	DerivesFrom = {"old-high-german", "noun", "Furt"},
	Gender = "masculine"
})

DefineLanguageWord("Weit", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, pp. 4, 7.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Woad"},
	Gender = "masculine"
})

DefineLanguageWord("Zwirn", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, pp. 1-2, 6.
	Language = "middle-high-german",
	Type = "noun",
	Meanings = {"Doubly Spun Twine"}
})

DefineLanguageWord("Zwirnen", { -- Source: Sean Crist, "An Analysis of *z loss in West Germanic", 2002, p. 6.
	Language = "middle-high-german",
	Type = "verb",
	Meanings = {"Twist Together Twice", "Twine"}
})