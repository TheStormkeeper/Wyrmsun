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

AddTrigger("the-mead-of-poetry-fjalar-and-galar-conspire",
	function()
		for i=0,14 do
			if (FindHero("Fjalar", i) ~= nil and FindHero("Galar", i) ~= nil) then
				trigger_player = i
				return true
			end
		end
		return false
	end,
	function()
		CallDialogue("the-mead-of-poetry-fjalar-and-galar-conspire", trigger_player)
		return false
	end
)

AddTrigger("the-mead-of-poetry-kvasir-assassinated",
	function()
		for i=0,14 do
			if (FindHero("Fjalar", i) ~= nil and FindHero("Galar", i) ~= nil and GetPlayerData(i, "CompletedQuest", "the-mead-of-poetry-kill-kvasir")) then
				trigger_player = i
				return true
			end
		end
		return false
	end,
	function()
		CallDialogue("the-mead-of-poetry-kvasir-assassinated", trigger_player)
		return false
	end
)
