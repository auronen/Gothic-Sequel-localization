// Baut den Menüstring für das Einschmelzen des Erzes im Schmelzofen zusammen
func string B_BuildMelterString!(var int amount, var string ore, var string product)
{
	return format!("{} ({} {})", product, amount, ore);
};

// Baut den Menüstring für das Schmieden am Amboss zusammen
func string B_BuildAnvilString!(var string raw, var string ore, var string product)
{
	// return format!("{}{} schmieden (1 {})", product, ore, raw);
	return format!<BuildAnvilString>("{}{} schmieden", product, ore);
};

// Baut den Menüstring für das abkühlen der Waffe im Wassereimer zusammen
func string B_BuildCoolString!(var string raw, var string ore, var string product)
{
	// return format!("{}{} abkühlen (1 {})", product, ore, raw);
	return format!<BuildCoolString>("{}{} abkühlen", product, ore);
};

// Baut den Menüstring für das Schärfen der Klinge am Schleifstein zusammen
func string B_BuildSharpString!(var string raw, var string ore, var string product)
{
	// return format!("{}{} schleifen (1 {})", product, ore, raw);
	return format!<BuildSharpString>("{}{} schleifen", product, ore);
};

