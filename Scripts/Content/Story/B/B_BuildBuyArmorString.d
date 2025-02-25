// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Kettenhemd"
//	- price: 1500
//	-
//	- Rückgabestring: "Kettenhemd (1500 Silber)"
func string B_BuildBuyArmorString!(var instance armor)
{
	return format!("{} ({} Silber)", armor.name, armor.value);
};
