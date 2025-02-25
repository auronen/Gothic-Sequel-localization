func int B_Ramirez_Tradecheck(var int Num_Arrows)
{
	//return 0 - Handel OK
	//return 1 - Handel spielerseitig nicht okay, da zu wenig Pfeile
	//return 2 - Handel Ramirezseitig nicht okay, weil hat schon genug
	//return 3 - Handel Ramirezseitig nicht okay, weil hat nicht genug Fleisch

	var C_Npc Ramirez;
	Ramirez = Hlp_GetNpc(WRK_205_Ramirez);

	if ((Npc_HasItems(hero, ItAm_Arrow) >= Num_Arrows)
	&& ((Num_Arrows + Given_Arrows) <= Enough_Arrows)
	&& (Npc_HasItems(Ramirez, ItFo_MuttonRaw) >= (Num_Arrows * 2)))
	{
		return 0; // Handel durchführen
	};

	if (Npc_HasItems(hero, ItAm_Arrow) < Num_Arrows)
	{
		return 1; // Spieler hat nicht ausreichend Pfeile
	};

	if ((Num_Arrows + Given_Arrows) > Enough_Arrows)
	{
		return 2; // Ramirez hat genug Pfeile
	};

	if (Npc_HasItems(Ramirez, ItFo_MuttonRaw) < Num_Arrows * 2)
	{
		return 3; // Ramirez hat nicht genug Fleisch
	};

	// Probably add a check if this ever happens
	return 0;
};

func void B_Ramirez_ProceedTrade(var int Num_Arrows)
{
	var C_Npc Ramirez;
	Ramirez = Hlp_GetNpc(WRK_205_Ramirez);

	Given_Arrows += Num_Arrows;
	B_GiveInvItems(hero, Ramirez, ItAm_Arrow, Num_Arrows);
	B_GiveInvItems(Ramirez, hero, ItFo_MuttonRaw, Num_Arrows * 2);
};
