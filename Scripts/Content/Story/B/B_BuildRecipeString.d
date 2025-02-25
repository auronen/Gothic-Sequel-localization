func string B_BuildRecipeString1(var string string_prefix, var int int_amount1, var string string_name1)
{
	var string string_recipe;
	var string string_recipeAmount;

	string_recipeAmount = IntToString(int_amount1);

	string_recipe = ConcatStrings(string_prefix, string_name1);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, "x");

	return string_recipe;
};

func string B_BuildRecipeString2(var string string_prefix, var int int_amount1, var string string_name1, var int int_amount2, var string string_name2)
{
	var string string_recipe;
	var string string_recipeAmount;

	string_recipeAmount = IntToString(int_amount1);

	string_recipe = ConcatStrings(string_prefix, string_name1);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, "x");
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipeAmount = IntToString(int_amount2);

	string_recipe = ConcatStrings(string_recipe, string_name2);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, "x");

	return string_recipe;
};

func string B_BuildRecipeString3(var string string_prefix, var int int_amount1, var string string_name1, var int int_amount2, var string string_name2, var int int_amount3, var string string_name3)
{
	var string string_recipe;
	var string string_recipeAmount;

	string_recipeAmount = IntToString(int_amount1);

	string_recipe = ConcatStrings(string_prefix, string_name1);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");

	string_recipe = ConcatStrings(string_recipe, "x");
	string_recipe = ConcatStrings(string_recipe, " ");

	string_recipeAmount = IntToString(int_amount2);

	string_recipe = ConcatStrings(string_recipe, string_name2);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");

	string_recipe = ConcatStrings(string_recipe, "x");
	string_recipe = ConcatStrings(string_recipe, " ");

	string_recipeAmount = IntToString(int_amount3);

	string_recipe = ConcatStrings(string_recipe, string_name3);
	string_recipe = ConcatStrings(string_recipe, " ");
	string_recipe = ConcatStrings(string_recipe, string_recipeAmount);
	string_recipe = ConcatStrings(string_recipe, " ");

	string_recipe = ConcatStrings(string_recipe, "x");

	return string_recipe;
};
