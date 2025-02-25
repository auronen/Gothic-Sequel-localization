func string B_BuildAlchemieRecipeString !(var string string_prefix, var string regName)
{
	return format!(
		"{}  -={}=- 1x {}, 1x {}, 1x {}.  -={}=- 1x {}, 1x {}, 1x {}. -={}=- 1x {}, 1x {}, 1x {}",
		string_prefix,
		NAME_Essence, regName, NAME_OrcLeaf, NAME_Alcohol,
		NAME_Extract, regName, NAME_RavenHerb, NAME_Alcohol,
		NAME_Elixir, regName, NAME_Nightshade, NAME_Alcohol,
	);
};

