-- PokemonData
--		name
--		catchrate
--		move
--		nature
--		type
--		status
--		item
--		map
-- RNGData
--		multspa
--		multspb
--		multspc
-- TableData
--		growth
--		attack
--		effort
--		misc
-- PickupData

--[[PokemonData = {
	name = {"---", "Bulbasaur", "Ivysaur", "Venusaur", "Charmander", "Charmeleon", "Charizard",
		"Squirtle", "Wartortle", "Blastoise", "Caterpie", "Metapod", "Butterfree",
		"Weedle", "Kakuna", "Beedrill", "Pidgey", "Pidgeotto", "Pidgeot", "Rattata", "Raticate",
		"Spearow", "Fearow", "Ekans", "Arbok", "Pikachu", "Raichu", "Sandshrew", "Sandslash",
		"Nidoran F", "Nidorina", "Nidoqueen", "Nidoran M", "Nidorino", "Nidoking",
		"Clefairy", "Clefable", "Vulpix", "Ninetales", "Jigglypuff", "Wigglytuff",
		"Zubat", "Golbat", "Oddish", "Gloom", "Vileplume", "Paras", "Parasect", "Venonat", "Venomoth",
		"Diglett", "Dugtrio", "Meowth", "Persian", "Psyduck", "Golduck", "Mankey", "Primeape",
		"Growlithe", "Arcanine", "Poliwag", "Poliwhirl", "Poliwrath", "Abra", "Kadabra", "Alakazam",
		"Machop", "Machoke", "Machamp", "Bellsprout", "Weepinbell", "Victreebel", "Tentacool", "Tentacruel",
		"Geodude", "Graveler", "Golem", "Ponyta", "Rapidash", "Slowpoke", "Slowbro",
		"Magnemite", "Magneton", "Farfetch'd", "Doduo", "Dodrio", "Seel", "Dewgong", "Grimer", "Muk",
		"Shellder", "Cloyster", "Gastly", "Haunter", "Gengar", "Onix", "Drowzee", "Hypno",
		"Krabby", "Kingler", "Voltorb", "Electrode", "Exeggcute", "Exeggutor", "Cubone", "Marowak",
		"Hitmonlee", "Hitmonchan", "Lickitung", "Koffing", "Weezing", "Rhyhorn", "Rhydon", "Chansey",
		"Tangela", "Kangaskhan", "Horsea", "Seadra", "Goldeen", "Seaking", "Staryu", "Starmie",
		"Mr. Mime", "Scyther", "Jynx", "Electabuzz", "Magmar", "Pinsir", "Tauros", "Magikarp", "Gyarados",
		"Lapras", "Ditto", "Eevee", "Vaporeon", "Jolteon", "Flareon", "Porygon", "Omanyte", "Omastar",
		"Kabuto", "Kabutops", "Aerodactyl", "Snorlax", "Articuno", "Zapdos", "Moltres",
		"Dratini", "Dragonair", "Dragonite", "Mewtwo", "Mew",

		"Chikorita", "Bayleef", "Meganium", "Cyndaquil", "Quilava", "Typhlosion",
		"Totodile", "Croconaw", "Feraligatr", "Sentret", "Furret", "Hoothoot", "Noctowl",
		"Ledyba", "Ledian", "Spinarak", "Ariados", "Crobat", "Chinchou", "Lanturn", "Pichu", "Cleffa",
		"Igglybuff", "Togepi", "Togetic", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Bellossom",
		"Marill", "Azumarill", "Sudowoodo", "Politoed", "Hoppip", "Skiploom", "Jumpluff", "Aipom",
		"Sunkern", "Sunflora", "Yanma", "Wooper", "Quagsire", "Espeon", "Umbreon", "Murkrow", "Slowking",
		"Misdreavus", "Unown", "Wobbuffet", "Girafarig", "Pineco", "Forretress", "Dunsparce", "Gligar",
		"Steelix", "Snubbull", "Granbull", "Qwilfish", "Scizor", "Shuckle", "Heracross", "Sneasel",
		"Teddiursa", "Ursaring", "Slugma", "Magcargo", "Swinub", "Piloswine", "Corsola", "Remoraid", "Octillery",
		"Delibird", "Mantine", "Skarmory", "Houndour", "Houndoom", "Kingdra", "Phanpy", "Donphan",
		"Porygon2", "Stantler", "Smeargle", "Tyrogue", "Hitmontop", "Smoochum", "Elekid", "Magby", "Miltank",
		"Blissey", "Raikou", "Entei", "Suicune", "Larvitar", "Pupitar", "Tyranitar", "Lugia", "Ho-Oh", "Celebi",
		
		"none","none","none","none","none",
		"none","none","none","none","none",
		"none","none","none","none","none",
		"none","none","none","none","none",
		"none","none","none","none","none",
		
		"Treecko", "Grovyle", "Sceptile",
		"Torchic", "Combusken", "Blaziken",
		"Mudkip", "Marshtomp", "Swampert",
		"Poochyena", "Mightyena", "Zigzagoon", "Linoone",
		"Wurmple", "Silcoon", "Beautifly", "Cascoon", "Dustox",
		"Lotad", "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry",		
		"Nincada", "Ninjask", "Shedinja", "Taillow", "Swellow",
		"Shroomish", "Breloom", "Spinda", "Wingull", "Pelipper",
		"Surskit", "Masquerain", "Wailmer", "Wailord", "Skitty", "Delcatty",
		"Kecleon", "Baltoy", "Claydol", "Nosepass", "Torkoal", "Sableye",
		"Barboach", "Whiscash", "Luvdisc", "Corphish", "Crawdaunt", "Feebas", "Milotic",	
		"Carvanha", "Sharpedo", "Trapinch", "Vibrava", "Flygon", "Makuhita", "Hariyama",
		"Electrike", "Manectric", "Numel", "Camerupt", "Spheal", "Sealeo", "Walrein", "Cacnea", "Cacturne",
		"Snorunt", "Glalie", "Lunatone", "Solrock", "Azurill", "Spoink", "Grumpig", "Plusle", "Minun",
		"Mawile", "Meditite", "Medicham", "Swablu", "Altaria", "Wynaut", "Duskull", "Dusclops", "Roselia",
		"Slakoth", "Vigoroth", "Slaking", "Gulpin", "Swalot", "Tropius", "Whismur", "Loudred", "Exploud",
		"Clamperl", "Huntail", "Gorebyss", "Absol", "Shuppet", "Banette", "Seviper", "Zangoose", "Relicanth",
		"Aron", "Lairon", "Aggron", "Castform", "Volbeat", "Illumise", "Lileep", "Cradily",
		"Anorith", "Armaldo", "Ralts", "Kirlia", "Gardevoir", "Bagon", "Shelgon", "Salamence", "Beldum",
		"Metang", "Metagross", "Regirock", "Regice", "Registeel", "Kyogre", "Groudon", "Rayquaza",
		"Latias", "Latios", "Jirachi", "Deoxys", "Chimecho",
		
		"Unown","Unown","Unown","Unown","Unown",
		"Unown","Unown","Unown","Unown","Unown",
		"Unown","Unown","Unown","Unown","Unown",
		"Unown","Unown","Unown","Unown","Unown",
		"Unown","Unown","Unown","Unown","Unown",
		"Unown","Unown"
	},		
	catchrate = {
		0, 45, 45, 45, 45, 45, 45, 45, 45, 45, 255, 120, 
		45, 255, 120, 45, 255, 120, 45, 255, 127, 255, 
		90, 255, 90, 190, 75, 255, 90, 235, 120, 45, 
		235, 120, 45, 150, 25, 190, 75, 170, 50, 255, 
		90, 255, 120, 45, 190, 75, 190, 75, 255, 50, 
		255, 90, 190, 75, 190, 75, 190, 75, 255, 120, 
		45, 200, 100, 50, 180, 90, 45, 255, 120, 45, 
		190, 60, 255, 120, 45, 190, 60, 190, 75, 190, 
		60, 45, 190, 45, 190, 75, 190, 75, 190, 60, 
		190, 90, 45, 45, 190, 75, 225, 60, 190, 60, 
		90, 45, 190, 75, 45, 45, 45, 190, 60, 120, 60, 
		30, 45, 45, 225, 75, 225, 60, 225, 60, 45, 45, 
		45, 45, 45, 45, 45, 255, 45, 45, 35, 45, 45, 
		45, 45, 45, 45, 45, 45, 45, 45, 25, 3, 3, 3, 
		45, 45, 45, 3, 45, 45, 45, 45, 45, 45, 45, 45, 
		45, 45, 255, 90, 255, 90, 255, 90, 255, 90, 
		90, 190, 75, 190, 150, 170, 190, 75, 190, 75, 
		235, 120, 45, 45, 190, 75, 65, 45, 255, 120, 
		45, 45, 235, 120, 75, 255, 90, 45, 45, 30, 70, 
		45, 225, 45, 60, 190, 75, 190, 60, 25, 190, 
		75, 45, 25, 190, 45, 60, 120, 60, 190, 75, 
		225, 75, 60, 190, 75, 45, 25, 25, 120, 45, 45, 
		120, 60, 45, 45, 45, 75, 45, 45, 45, 45, 45, 
		30, 3, 3, 3, 45, 45, 45, 3, 3, 45,
		
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		0,0,0,0,0,
		
		45, 45, 45, 45, 45, 45, 45, 45, 45, 255,
		127, 255, 90, 255, 120, 45, 120, 45, 255,
		120, 45, 255, 120, 45, 255, 120, 45, 200,
		45, 255, 90, 255, 190, 45, 200, 75, 125,
		60, 255, 60, 200, 255, 90, 255, 90, 45,
		190, 75, 225, 205, 155, 255, 60, 225, 60,
		255, 120, 45, 180, 200, 120, 45, 255, 150,
		255, 120, 45, 190, 60, 190, 75, 45, 45,
		150, 255, 60, 200, 200, 45, 180, 90, 255,
		45, 125, 190, 90, 150, 255, 120, 45, 225,
		75, 200, 190, 120, 45, 255, 60, 60, 30,
		225, 45, 90, 90, 25, 180, 90, 45, 45, 150, 
		150, 45, 45, 45, 45, 235, 120, 45, 45, 
		45, 45, 3, 3, 3, 3, 3, 3, 5, 5, 3, 3, 3, 
		3, 3, 45,
		
		225, 225, 225, 225, 225,
		225, 225, 225, 225, 225,
		225, 225, 225, 225, 225,
		225, 225, 225, 225, 225,
		225, 225, 225, 225, 225,
		225, 225
	},
	move = { "---",  "Pound", "Karate Chop", "DoubleSlap", "Comet Punch", "Mega Punch", "Pay Day",
		"Fire Punch", "Ice Punch", "ThunderPunch", "Scratch", "ViceGrip", "Guillotine",
		"Razor Wind", "Swords Dance", "Cut", "Gust", "Wing Attack", "Whirlwind", "Fly",
		"Bind", "Slam", "Vine Whip", "Stomp", "Double Kick", "Mega Kick", "Jump Kick",
		"Rolling Kick", "Sand-Attack", "Headbutt", "Horn Attack", "Fury Attack",
		"Horn Drill", "Tackle", "Body Slam", "Wrap", "Take Down", "Thrash", "Double-Edge",
		"Tail Whip", "Poison Sting", "Twineedle", "Pin Missile", "Leer", "Bite", "Growl",
		"Roar", "Sing", "Supersonic", "SonicBoom", "Disable", "Acid", "Ember",
		"Flamethrower", "Mist", "Water Gun", "Hydro Pump", "Surf", "Ice Beam", "Blizzard",
		"Psybeam", "BubbleBeam", "Aurora Beam", "Hyper Beam", "Peck", "Drill Peck",
		"Submission", "Low Kick", "Counter", "Seismic Toss", "Strength", "Absorb",
		"Mega Drain", "Leech Seed", "Growth", "Razor Leaf", "SolarBeam", "PoisonPowder",
		"Stun Spore", "Sleep Powder", "Petal Dance", "String Shot", "Dragon Rage",
		"Fire Spin", "ThunderShock", "Thunderbolt", "Thunder Wave", "Thunder", "Rock Throw",
		"Earthquake", "Fissure", "Dig", "Toxic", "Confusion", "Psychic", "Hypnosis",
		"Meditate", "Agility", "Quick Attack", "Rage", "Teleport", "Night Shade", "Mimic",
		"Screech", "Double Team", "Recover", "Harden", "Minimize", "SmokeScreen",
		"Confuse Ray", "Withdraw", "Defense Curl", "Barrier", "Light Screen", "Haze",
		"Reflect", "Focus Energy", "Bide", "Metronome", "Mirror Move", "Selfdestruct",
		"Egg Bomb", "Lick", "Smog", "Sludge", "Bone Club", "Fire Blast", "Waterfall",
		"Clamp", "Swift", "Skull Bash", "Spike Cannon", "Constrict", "Amnesia", "Kinesis",
		"Softboiled", "Hi Jump Kick", "Glare", "Dream Eater", "Poison Gas", "Barrage",
		"Leech Life", "Lovely Kiss", "Sky Attack", "Transform", "Bubble", "Dizzy Punch",
		"Spore", "Flash", "Psywave", "Splash", "Acid Armor", "Crabhammer", "Explosion",
		"Fury Swipes", "Bonemerang", "Rest", "Rock Slide", "Hyper Fang", "Sharpen", 
		"Conversion", "Tri Attack", "Super Fang", "Slash", "Substitute", "Struggle",
		"Sketch", "Triple Kick", "Thief", "Spider Web", "Mind Reader", "Nightmare",
		"Flame Wheel", "Snore", "Curse", "Flail", "Conversion 2", "Aeroblast",
		"Cotton Spore", "Reversal", "Spite", "Powder Snow", "Protect", "Mach Punch",
		"Scary Face", "Faint Attack", "Sweet Kiss", "Belly Drum", "Sludge Bomb",
		"Mud-Slap", "Octazooka", "Spikes", "Zap Cannon", "Foresight", "Destiny Bond",
		"Perish Song", "Icy Wind", "Detect", "Bone Rush", "Lock-On", "Outrage", "Sandstorm",
		"Giga Drain", "Endure", "Charm", "Rollout", "False Swipe", "Swagger", "Milk Drink",
		"Spark", "Fury Cutter", "Steel Wing", "Mean Look", "Attract", "Sleep Talk",
		"Heal Bell", "Return", "Present", "Frustration", "Safeguard", "Pain Split",
		"Sacred Fire", "Magnitude", "DynamicPunch", "Megahorn", "DragonBreath",
		"Baton Pass", "Encore", "Pursuit", "Rapid Spin", "Sweet Scent", "Iron Tail",
		"Metal Claw", "Vital Throw", "Morning Sun", "Synthesis", "Moonlight", "Hidden Power",
		"Cross Chop", "Twister", "Rain Dance", "Sunny Day", "Crunch", "Mirror Coat",
		"Psych Up", "ExtremeSpeed", "AncientPower", "Shadow Ball", "Future Sight",
		"Rock Smash", "Whirlpool", "Beat Up", "Fake Out", "Uproar", "Stockpile", "Spit Up",
		"Swallow", "Heat Wave", "Hail", "Torment", "Flatter", "Will-O-Wisp", "Memento",
		"Facade", "Focus Punch", "SmellingSalt", "Follow Me", "Nature Power", "Charge",
		"Taunt", "Helping Hand", "Trick", "Role Play", "Wish", "Assist", "Ingrain",
		"Superpower", "Magic Coat", "Recycle", "Revenge", "Brick Break", "Yawn", "Knock Off",
		"Endeavor", "Eruption", "Skill Swap", "Imprison", "Refresh", "Grudge", "Snatch",
		"Secret Power", "Dive", "Arm Thrust", "Camouflage", "Tail Glow", "Luster Purge",
		"Mist Ball", "FeatherDance", "Teeter Dance", "Blaze Kick", "Mud Sport", "Ice Ball",
		"Needle Arm", "Slack Off", "Hyper Voice", "Poison Fang", "Crush Claw", "Blast Burn",
		"Hydro Cannon", "Meteor Mash", "Astonish", "Weather Ball", "Aromatherapy",
		"Fake Tears", "Air Cutter", "Overheat", "Odor Sleuth", "Rock Tomb", "Silver Wind",
		"Metal Sound", "GrassWhistle", "Tickle", "Cosmic Power", "Water Spout",
		"Signal Beam", "Shadow Punch", "Extrasensory", "Sky Uppercut", "Sand Tomb",
		"Sheer Cold", "Muddy Water", "Bullet Seed", "Aerial Ace", "Icicle Spear",
		"Iron Defense", "Block", "Howl", "Dragon Claw", "Frenzy Plant", "Bulk Up",
		"Bounce", "Mud Shot", "Poison Tail", "Covet", "Volt Tackle", "Magical Leaf",
		"Water Sport", "Calm Mind", "Leaf Blade", "Dragon Dance", "Rock Blast",
		"Shock Wave", "Water Pulse", "Doom Desire", "Psycho Boost"
	},
	map = {
		"Littleroot Town", "Oldale Town", "Dewford Town", "Lavaridge Town", "Fallarbor Town", "Verdanturf Town",
		"Pacifidlog Town", "Petalburg City", "Slateport City", "Mauville City", "Rustboro City", 
		"Fortree City", "Lilycove City", "Mossdeep City", "Sootopolis City", "Ever Grande City", "Route 101", 
		"Route 102", "Route 103", "Route 104", "Route 105", "Route 106", "Route 107", "Route 108", "Route 109",
		"Route 110", "Route 111", "Route 112", "Route 113", "Route 114", "Route 115", "Route 116", 
		"Route 117", "Route 118", "Route 119", "Route 120", "Route 121", "Route 122", "Route 123", "Route 124",
		"Route 125", "Route 126", "Route 127", "Route 128", "Route 129", "Route 130", "Route 131", 
		"Route 132", "Route 133", "Route 134", "Underwater (Route 124)", "Underwater (Route 126)", 
		"Underwater (Route 127)", "Underwater (Route 128)", "Underwater (Sootopolis City)", "Granite Cave", 
		"Mt. Chimney", "Safari Zone", "Battle Frontier", "Petalburg Woods", "Rusturf Tunnel", 
		"Abandoned Ship", "New Mauville", "Meteor Falls", "Meteor Falls", "Mt. Pyre", "Hideout", "Shoal Cave",
		"Seafloor Cavern", "Underwater (Seafloor Cavern)", "Victory Road", "Mirage Island", "Cave of Origin",
		"Southern Island", "Fiery Path", "Fiery Path", "Jagged Pass", "Jagged Pass", "Sealed Chamber",
		"Underwater (Route 134)", "Scorched Slab", "Island Cave", "Desert Ruins", "Ancient Tomb", 
		"Inside of Truck", "Sky Pillar", "Secret Base", "Ferry", "Pallet Town", "Viridian City", "Pewter City",
		"Cerulean City", "Lavender Town", "Vermilion City", "Celadon City", "Fuchsia City", "Cinnabar Island",
		"Indigo Plateau", "Saffron City", "Route 4 (Pokémon Center)", "Route 10 (Pokémon Center)", 
		"Route 1", "Route 2", "Route 3", "Route 4", "Route 5", "Route 6", "Route 7", "Route 8", "Route 9", 
		"Route 10", "Route 11", "Route 12", "Route 13", "Route 14", "Route 15", "Route 16", "Route 17", 
		"Route 18", "Route 19", "Route 20", "Route 21", "Route 22", "Route 23", "Route 24", "Route 25", 
		"Viridian Forest", "Mt. Moon", "S.S. Anne", "Underground Path (Routes 5-6)",
		"Underground Path (Routes 7-8)", "Diglett's Cave", "Victory Road", "Rocket Hideout", "Silph Co.",
		"Pokémon Mansion", "Safari Zone", "Pokémon League", "Rock Tunnel", "Seafoam Islands", "Pokémon Tower", 
		"Cerulean Cave", "Power Plant", "One Island", "Two Island", "Three Island", "Four Island", "Five Island",
		"Seven Island", "Six Island", "Kindle Road", "Treasure Beach", "Cape Brink", "Bond Bridge", 
		"Three Isle Port", "Sevii Isle 6", "Sevii Isle 7", "Sevii Isle 8", "Sevii Isle 9", "Resort Gorgeous", 
		"Water Labyrinth", "Five Isle Meadow", "Memorial Pillar", "Outcast Island", "Green Path", "Water Path",
		"Ruin Valley", "Trainer Tower", "Canyon Entrance", "Sevault Canyon", "Tanoby Ruins",
		"Sevii Isle 22", "Sevii Isle 23", "Sevii Isle 24", "Navel Rock", "Mt. Ember", "Berry Forest", "Icefall Cave",
		"Rocket Warehouse", "Trainer Tower", "Dotted Hole", "Lost Cave", "Pattern Bush",
		"Altering Cave", "Tanoby Chambers", "Three Isle Path", "Tanoby Key", "Birth Island", "Monean Chamber",
		"Liptoo Chamber", "Weepth Chamber", "Dilford Chamber", "Scufib Chamber", "Rixy Chamber", "Viapois Chamber", 
		"Ember Spa", "Celadon Dept", "Aqua Hideout", "Magma Hideout", "Mirage Tower", "Birth Island", 
		"Faraway Island", "Artisan Cave", "Marine Cave", "Underwater (Marine Cave)", "Terra Cave", 
		"Underwater (Route 105)", "Underwater (Route 125)", "Underwater (Route 129)", "Desert Underpass", 
		"Altering Cave", "Navel Rock", "Trainer Hill", "none", "none", "none", "none", "none", "none", 
		"none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", 
		"none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", 
		"none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "In-game trade", "Fateful encounter"
	},
	nature = {
		"Hardy", "Lonely", "Brave", "Adamant", "Naughty",
		"Bold", "Docile", "Relaxed", "Impish", "Lax",
		"Timid", "Hasty", "Serious", "Jolly", "Naive",
		"Modest", "Mild", "Quiet", "Bashful", "Rash",
		"Calm", "Gentle", "Sassy", "Careful", "Quirky"
	},
	type = {
		"Fighting","Flying","Poison","Ground",
		"Rock","Bug","Ghost","Steel",
		"Fire","Water","Grass","Electric",
		"Psychic","Ice","Dragon","Dark"
	},
	status = {
		"None","Sleep","Poison","Burn","Freeze",
		"Paralysis","Bad Poison"
	},
	
}

RNGData = {
	multspa = {
		0x41C64E6D, 0xC2A29A69, 0xEE067F11, 0xCFDDDF21,
		0x5F748241, 0x8B2E1481, 0x76006901, 0x1711D201,
		0xBE67A401, 0xDDDF4801, 0x3FFE9001, 0x90FD2001,
		0x65FA4001, 0xDBF48001, 0xF7E90001, 0xEFD20001,
		0xDFA40001, 0xBF480001, 0x7E900001, 0xFD200001,
		0xFA400001, 0xF4800001, 0xE9000001, 0xD2000001,
		0xA4000001, 0x48000001, 0x90000001, 0x20000001,
		0x40000001, 0x80000001, 0x00000001, 0x00000001
	},
	multspb={
		0x00006073, 0xE97E7B6A, 0x31B0DDE4, 0x67DBB608,
		0xCBA72510, 0x1D29AE20, 0xBA84EC40, 0x79F01880,
		0x08793100, 0x6B566200, 0x803CC400, 0xA6B98800,
		0xE6731000, 0x30E62000, 0xF1CC4000, 0x23988000,
		0x47310000, 0x8E620000, 0x1CC40000, 0x39880000,
		0x73100000, 0xE6200000, 0xCC400000, 0x98800000,
		0x31000000, 0x62000000, 0xC4000000, 0x88000000,
		0x10000000, 0x20000000, 0x40000000, 0x80000000
	},
	multspc={
		0x00003039, 0xD3DC167E, 0xD6651C2C, 0xCD1DCF18,
		0x65136930, 0x642B7E60, 0x1935ACC0, 0xB6461980,
		0x1EF73300, 0x1F9A6600, 0x85E4CC00, 0x26899800,
		0xB8133000, 0x1C266000, 0xE84CC000, 0x90998000,
		0x21330000, 0x42660000, 0x84CC0000, 0x09980000,
		0x13300000, 0x26600000, 0x4CC00000, 0x99800000,
		0x33000000, 0x66000000, 0xCC000000, 0x98000000,
		0x30000000, 0x60000000, 0xC0000000, 0x80000000
	}
}--]]

TableData = {
	growth = {1,1,1,1,1,1, 2,2,3,4,3,4, 2,2,3,4,3,4, 2,2,3,4,3,4},
	attack = {2,2,3,4,3,4, 1,1,1,1,1,1, 3,4,2,2,4,3, 3,4,2,2,4,3},
	effort = {3,4,2,2,4,3, 3,4,2,2,4,3, 1,1,1,1,1,1, 4,3,4,3,2,2},
	misc   = {4,3,4,3,2,2, 4,3,4,3,2,2, 4,3,4,3,2,2, 1,1,1,1,1,1}
}

--[[PickupData = {
	{
		item   = {22,  2, 19, 23,110, 24, 68, 64, 69,187},
		rarity = {30, 10, 10, 10, 10, 10, 10,  5,  4,  1}
	},
	{
		item = {
			{13, 14, 22,  3, 86, 85, 75, 23,  2, 21,110},
			{14, 22,  3, 86, 85, 75, 23,  2, 21,110,187},
			{22,  3, 86, 85, 75, 23,  2, 21, 68,187, 19},
			{ 3, 86, 85, 75, 23,  2, 21, 68, 64, 19, 34},
			{86, 85, 75, 23,  2, 21, 68, 64, 24, 34,180},
			{85, 75, 23,  2, 21, 68, 64, 24, 63,180,332},
			{75, 23,  2, 21, 68, 64, 24, 63, 19,332, 36},
			{23,  2, 21, 68, 64, 24, 63, 19, 25, 36,289},
			{ 2, 21, 68, 64, 24, 63, 19, 25, 69,289,200},
			{21, 68, 64, 24, 63, 19, 25, 69, 37,200,314}
		},
		rarity = {30, 10, 10, 10, 10, 10, 10, 4, 4, 1, 1}
		
	},
	{
		item   = {139,137,133,134,135,140,136,110, 69, 68,298,167,166,164,163,165},
		rarity = { 15, 10, 10, 10, 10, 10, 10,  5,  5,  5,  5,  1,  1,  1,  1,  1}
	}
}--]]

ItemData = {
"---", "MASTER BALL", "ULTRA BALL", "GREAT BALL", "POKé BALL", "SAFARI BALL", "NET BALL", "DIVE BALL",							-- 0X000-0X007
"NEST BALL", "REPEAT BALL", "TIMER BALL", "LUXURY BALL", "PREMIER BALL", "POTION", "ANTIDOTE", "BURN HEAL",						-- 0X008-0X00F
"ICE HEAL", "AWAKENING", "PARLYZ HEAL", "FULL RESTORE", "MAX POTION", "HYPER POTION", "SUPER POTION", "FULL HEAL",				-- 0X010-0X017
"REVIVE", "MAX REVIVE", "FRESH WATER", "SODA POP", "LEMONADE", "MOOMOO MILK", "ENERGYPOWDER", "ENERGY ROOT",					-- 0X018-0X01F
"HEAL POWDER", "REVIVAL HERB", "ETHER", "MAX ETHER", "ELIXIR", "MAX ELIXIR", "LAVA COOKIE", "BLUE FLUTE",						-- 0X020-0X027
"YELLOW FLUTE", "RED FLUTE", "BLACK FLUTE", "WHITE FLUTE", "BERRY JUICE", "SACRED ASH", "SHOAL SALT", "SHOAL SHELL",			-- 0X028-0X02F
"RED SHARD", "BLUE SHARD", "YELLOW SHARD", "GREEN SHARD", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",							-- 0X030-0X037
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "HP UP",											-- 0X038-0X03F
"PROTEIN", "IRON", "CARBOS", "CALCIUM", "RARE CANDY", "PP UP", "ZINC", "PP MAX",												-- 0X040-0X047
"UNKNOWN", "GUARD SPEC.", "DIRE HIT", "X ATTACK", "X DEFEND", "X SPEED", "X ACCURACY", "X SPECIAL",								-- 0X048-0X04F
"POKé DOLL", "FLUFFY TAIL", "UNKNOWN", "SUPER REPEL", "MAX REPEL", "ESCAPE ROPE", "REPEL", "UNKNOWN",							-- 0X050-0X057
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "SUN STONE", "MOON STONE", "FIRE STONE",									-- 0X058-0X05F
"THUNDER STONE", "WATER STONE", "LEAF STONE", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "TINYMUSHROOM",						-- 0X060-0X067
"BIG MUSHROOM", "UNKNOWN", "PEARL", "BIG PEARL", "STARDUST", "STAR PIECE", "NUGGET", "HEART SCALE",								-- 0X068-0X06F
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",											-- 0X070-0X077
"UNKNOWN", "ORANGE MAIL", "HARBOR MAIL", "GLITTER MAIL", "MECH MAIL", "WOOD MAIL", "WAVE MAIL", "BEAD MAIL",					-- 0X078-0X07F
"SHADOW MAIL", "TROPIC MAIL", "DREAM MAIL", "FAB MAIL", "RETRO MAIL", "CHERI BERRY", "CHESTO BERRY", "PECHA BERRY",				-- 0X080-0X087
"RAWST BERRY", "ASPEAR BERRY", "LEPPA BERRY", "ORAN BERRY", "PERSIM BERRY", "LUM BERRY", "SITRUS BERRY", "FIGY BERRY",			-- 0X088-0X08F
"WIKI BERRY", "MAGO BERRY", "AGUAV BERRY", "IAPAPA BERRY", "RAZZ BERRY", "BLUK BERRY", "NANAB BERRY", "WEPEAR BERRY",			-- 0X090-0X097
"PINAP BERRY", "POMEG BERRY", "KELPSY BERRY", "QUALOT BERRY", "HONDEW BERRY", "GREPA BERRY", "TAMATO BERRY", "CORNN BERRY",		-- 0X098-0X09F
"MAGOST BERRY", "RABUTA BERRY", "NOMEL BERRY", "SPELON BERRY", "PAMTRE BERRY", "WATMEL BERRY", "DURIN BERRY", "BELUE BERRY",	-- 0X0A0-0X0A7
"LIECHI BERRY", "GANLON BERRY", "SALAC BERRY", "PETAYA BERRY", "APICOT BERRY", "LANSAT BERRY", "STARF BERRY", "ENIGMA BERRY",	-- 0X0A8-0X0AF
"UNKNOWN", "UNKNOWN", "UNKNOWN", "BRIGHTPOWDER", "WHITE HERB", "MACHO BRACE", "EXP. SHARE", "QUICK CLAW",						-- 0X0B0-0X0B7
"SOOTHE BELL", "MENTAL HERB", "CHOICE BAND", "KING'S ROCK", "SILVERPOWDER", "AMULET COIN", "CLEANSE TAG", "SOUL DEW",			-- 0X0B8-0X0BF
"DEEPSEATOOTH", "DEEPSEASCALE", "SMOKE BALL", "EVERSTONE", "FOCUS BAND", "LUCKY EGG", "SCOPE LENS", "METAL COAT",				-- 0X0C0-0X0C7
"LEFTOVERS", "DRAGON SCALE", "LIGHT BALL", "SOFT SAND", "HARD STONE", "MIRACLE SEED", "BLACKGLASSES", "BLACK BELT",				-- 0X0C8-0X0CF
"MAGNET", "MYSTIC WATER", "SHARP BEAK", "POISON BARB", "NEVERMELTICE", "SPELL TAG", "TWISTEDSPOON", "CHARCOAL",					-- 0X0D0-0X0D7
"DRAGON FANG", "SILK SCARF", "UP-GRADE", "SHELL BELL", "SEA INCENSE", "LAX INCENSE", "LUCKY PUNCH", "METAL POWDER",				-- 0X0D8-0X0DF
"THICK CLUB", "STICK", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",										-- 0X0E0-0X0E7
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",											-- 0X0E8-0X0EF
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",											-- 0X0F0-0X0F7
"UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "RED SCARF", "BLUE SCARF",									-- 0X0F8-0X0FF
"PINK SCARF", "GREEN SCARF", "YELLOW SCARF", "MACH BIKE", "COIN CASE", "ITEMFINDER", "OLD ROD", "GOOD ROD",						-- 0X100-0X107
"SUPER ROD", "S.S. TICKET", "CONTEST PASS", "UNKNOWN", "WAILMER PAIL", "DEVON GOODS", "SOOT SACK", "BASEMENT KEY",				-- 0X108-0X10F
"ACRO BIKE", "POKéBLOCK CASE", "LETTER", "EON TICKET", "RED ORB", "BLUE ORB", "SCANNER", "GO-GOGGLES",							-- 0X110-0X117
"METEORITE", "RM. 1 KEY", "RM. 2 KEY", "RM. 4 KEY", "RM. 6 KEY", "STORAGE KEY", "ROOT FOSSIL", "CLAW FOSSIL",					-- 0X118-0X11F
"DEVON SCOPE", "TM01", "TM02", "TM03", "TM04", "TM05", "TM06", "TM07",															-- 0X120-0X127
"TM08", "TM09", "TM10", "TM11", "TM12", "TM13", "TM14", "TM15",																	-- 0X128-0X12F
"TM16", "TM17", "TM18", "TM19", "TM20", "TM21", "TM22", "TM23",																	-- 0X130-0X137
"TM24", "TM25", "TM26", "TM27", "TM28", "TM29", "TM30", "TM31",																	-- 0X138-0X13F
"TM32", "TM33", "TM34", "TM35", "TM36", "TM37", "TM38", "TM39",																	-- 0X140-0X147
"TM40", "TM41", "TM42", "TM43", "TM44", "TM45", "TM46", "TM47",																	-- 0X148-0X14F
"TM48", "TM49", "TM50", "HM01", "HM02", "HM03", "HM04", "HM05",																	-- 0X150-0X157
"HM06", "HM07", "HM08", "UNKNOWN", "UNKNOWN", "POKé FLUTE", "SECRET KEY", "BIKE VOUCHER",										-- 0X158-0X15F
"GOLD TEETH", "OLD AMBER", "CARD KEY", "LIFT KEY", "HELIX FOSSIL", "DOME FOSSIL", "SILPH SCOPE", "BICYCLE",						-- 0X160-0X167
"TOWN MAP", "VS. SEEKER", "FAME CHECKER", "TM CASE", "BERRY POUCH", "TEACHY TV", "TRI-PASS", "RAINBOW PASS",					-- 0X168-0X16F
"TEA", "MYSTICTICKET", "AURORATICKET", "POWDER JAR", "RUBY", "SAPPHIRE", "MAGMA EMBLEM", "OLD SEA MAP"							-- 0X170-0X177
}

NatDexLookup = {--TODO finish filling this out for the remaining Hoenn Pokes
	[283]=258,
	[284]=259,
	[285]=260,
	[286]=261,
	[287]=262,
	[288]=263,
	[289]=264,
	[290]=265,
	[291]=266,
	[292]=267,
	[293]=268,
	[294]=269,
	[295]=270,
	[296]=271,
	[304]=276,
	[305]=277,
	[309]=278,
	[310]=279,
	[392]=280,
	[393]=281,
	[394]=282,
	[311]=283,
	[312]=284,
	[306]=285,
	[307]=286,
	[364]=287,
	[365]=288,
	[366]=289,
	[301]=290,
	[302]=291,
	[303]=292,
	[370]=293,
	[371]=294,
	[372]=295,
	[335]=296,
	[336]=297,
	[315]=300,
	[322]=302,
	[382]=304,
	[383]=305,
	[384]=306,
	[337]=309,
	[338]=310,
	[353]=311,
	[354]=312,
	[386]=313,
	[387]=314,
	[363]=315,
	[367]=316,
	[368]=317,
}
--[[
	["Pre-Badge 2"]={--30 Pokes
		41, 42, 169, --Zubat line
		43, 44, --Oddish line
		63, 64, --Abra line
		72, 73, --Tentacool line
		74, 75, --Geodude line
		118, 119, --Goldeen line
		129, 130, --Magikarp line
		183, 184, --Marill line
		322, --Sableye
		382, 383, 384, --Aron line
		337, 338, --Electrike line
		353, 354, --Plusle & Minun
		386, 387, --Volbeat & Illumise
		363, --Roselia
		367, 368 --Gulpin line
	},
	["Pre-Badge 3"]={--25 Pokes
		27, 28, --Sandshrew line
		66, 67, --Machop line
		88, 89, --Grimer line
		109, 110, --Koffing line
		360, 202, --Wobbuffet line
		218, 219, --Slugma line
		227, --Skarmory
		320, --Nosepass
		316, --Delcatty
		339, 340, --Numel line
		321, --Torkoal
		351, 352, --Spoink line
		308, --Spinda
		358, 359, --Swablu line
		379, --Seviper
		348 --Lunatone
	},
	["Pre-Badge 4"]={--9 Pokes
		332, 333, 334, --Trapinch line
		344, 345, --Cacnea line
		318, 319, --Baltoy line
		388, 389 --Lileep line 390, 391 --Anorith line
	},
	["Pre-Badge 6"]={--59 Pokes
		172, 25, 26, --Pikachu line
		37, 38, --Vulpix line
		174, 39, 40, --Jigglypuff line
		45, 182, --Vileplume & Bellossom
		54, 55, --Psyduck line
		81, 82, --Magnemite line
		84, 85, --Doduo line
		100, 101, --Voltorb line
		111, 112, --Rhyhorn line
		116, 117, --Horsea line
		120, --Staryu
		127, --Pinsir
		177, 178, --Natu line
		203, --Girafarig
		214, --Heracross
		222, --Corsola line
		231, 232, --Phanpy line
		350, --Azurill
		356, 357, --Meditite line
		330, 331, --Carvanha line
		313, 314, --Wailmer line
		323, 324, --Barboach line
		326, 327, --Corphish line
		328, 329, --Feebas line
		385, --Castform
		317, --Kecleon
		377, 378, --Shuppet line
		361, 362, --Duskull line
		369, --Tropius
		411, --Chimecho
		376, --Absol
		346, 347, --Snorunt line
		341, 342, 343, --Spheal line
		325 --Luvdisc
	},
	["Pre-Badge 7"]={--9 Pokes
		121, --Starmie
		170, 171, --Chinchou line
		297, --Ludicolo
		373, --Clamperl
		381, --Relicanth
		401, 402, --Regirock & Regice
		404 --Kyogre
	},
	["Pre-Badge 8"]={--3 Pokes
		395, 396, 397 --Bagon line
	},
	["Pre-Elite 4"]={--1 Poke
		403 --Registeel
	},
	["Postgame"]={--5 Pokes
		398, 399, 400, --Beldum line
		407, --Latias
		406 --Rayquaza
	}
}	
--]]