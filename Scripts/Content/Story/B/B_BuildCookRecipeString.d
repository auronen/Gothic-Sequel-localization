func string B_BuildCookRecipeString!(var string string_prefix, var string regName)
{
	return Format!(
	"{}  -={}=- 1x {}, 1x {}, 1x {}.  -={}=- 1x {}, 1x {}, 1x {}. -={}=- 1x {}, 1x {}, 1x {}",
	string_prefix,
	NAME_RecipeSoup, regName, NAME_Loaf, NAME_Salt,
	NAME_RecipeStew, regName, NAME_Cheese, NAME_Salt,
	NAME_RecipeRagout, regName, NAME_Ham, NAME_Salt,
	);
};

