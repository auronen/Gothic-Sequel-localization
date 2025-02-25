// Baut den Menüstring für das schmelzen von Erz zu einer leeren Rune
func string B_BuildRunemelterString!(var string rune, var int oreAmount, var string oreName)
{
	return format!<Dia_RuneMelter>("{} giesen ({} {})", rune, oreAmount, oreName);
};


// Baut den Menüstring für das Binden einer Scroll in einen leeren Runenstein
func string B_BuildRunemakerString!(var string spell, var string rune, var int neededMana)
{
	return format!<Dia_RuneMaker>("{}-{} ershaffen ({} dauerhafte Mana)", spell, rune, neededMana);
};

