///////////////////////////////////////////////////////////////////////////////////////
//	B_SilverAmountToSatisfy_Int()
//	==============================
// 	Hier wird die Menge festgelegt, die ein Nsc haben will, um sich wieder zu beruhigen
//	Momentan 5*Nsc.Level
//	liefert diesen Wert als Integer zurück
///////////////////////////////////////////////////////////////////////////////////////
func int B_SilverAmountToSatisfy_Int()
{
	var int int_silver;
	int_silver = self.level * 3;

	return int_silver;
};

////////////////////////////////////////////////////////////////////////////////////
//	B_HasPlayerSilverToSatisfy()
//	=============================
// 	Funktion, die überprüft, ob der Spieler genug Silber hat um einen Nsc gnädig zu
//	stimmen, --> B_SilverAmountToSatisfy_Int
//	liefert TRUE oder FALSE
////////////////////////////////////////////////////////////////////////////////////
func int B_HasPlayerSilverToSatisfy()
{
	var int int_Silver;
	int_Silver = B_SilverAmountToSatisfy_Int();

	if (Npc_HasItems(hero, ItMi_Silver) >= int_Silver)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

///////////////////////////////////////////////////////////////////////////////////////
//	B_SilverAmountToSatisfy_String()
//	==============================
// 	Hier wird die festgelegte Menge Silber, die ein Nsc haben will, um sich wieder zu beruhigen
//	in einen String umgewandelt (Bildschirmausgabe)
//	liefert diesen String zurück
///////////////////////////////////////////////////////////////////////////////////////
func string B_SilverAmountToSatisfy_String()
{
	var int int_silver;

	int_silver = B_SilverAmountToSatisfy_Int();

	var string string_silver;

	string_silver = IntToString(int_Silver);

	return string_silver;
};
