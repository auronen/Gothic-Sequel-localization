// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- prize: 1500
//	- Rückgabestring: "20 Silber"
func string B_BuildPrizeString!(var int prize)
{
	return format!<PrizeString>("{} Silber", prize);
};
