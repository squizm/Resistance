// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GenerateName(){
	var name = "";
	var vowels = [ "a", "e", "i", "o", "u"];
	var uncommonVowels = [ "ou", "iou", "ae", "ea", "ai" ];
	var consonants = [ "b", "c", "d", "f", "g", "h", "l", "m", "n", "p", "r", "s", "t" ];
	var uncommonConsonants = [ "j", "k", "q", "v", "w", "x", "y", "z" ];
	var beginings = [ "th", "st", "ch", "cr", "br", "gr", "fl", "gh", "gr", "pr" ];
	var ends = [ "nt", "gh", "mn", "rs", "rt", "ch", "nd", "hn", "ph", "ny", "ld", "rk", "rd", "ry", "ck", "my", "ie" ];
	
	for (var i = 0; i < 1; i++) {
		var roll = random(100);
		if (roll >= 80 && i == 0) {
			name += beginings[@ random(array_length(beginings))];
		} else if (roll >= 75) {
			name += uncommonConsonants[@ random(array_length(uncommonConsonants))];
		} else {
			name += consonants[@ random(array_length(consonants))];
		}

		if (random(100) < 90) {
			name += vowels[@ random(array_length(vowels))];
		} else {
			name += uncommonVowels[@ random(array_length(uncommonVowels))];
		}
	}
	name += ends[@ random(array_length(ends))];
	name += " ";
	
	for (var i = 0; i < 2; i++) {
		var roll = random(100);
		if (roll >= 80 && i == 0) {
			name += beginings[@ random(array_length(beginings))];
		} else if (roll >= 75) {
			name += uncommonConsonants[@ random(array_length(uncommonConsonants))];
		} else {
			name += consonants[@ random(array_length(consonants))];
		}

		if (random(100) < 90) {
			name += vowels[@ random(array_length(vowels))];
		} else {
			name += uncommonVowels[@ random(array_length(uncommonVowels))];
		}
	}
	name += ends[@ random(array_length(ends))];
	
	return name;
}