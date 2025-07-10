// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Spitzhacke"
//	- price: 1500
//	- Rückgabestring: "Spitzhacke (20 Silber)"
func string B_BuildBuyString!(var string text, var int price)
{
	return format!<"BuyString">("{} kaufen ({} Silver)", text, price);
};
