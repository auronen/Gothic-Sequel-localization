// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- amount: 10
//	- text: "Meatbug-Suppe"
//	- price: 10
//	- Rückgabestring: "10 Portionen Meatbugsuppe (100 Silber)"
func string B_BuildBuyMealString!(var int amount, var string text, var int price)
{
	if amount == 1 {
		return format!<BuyMealStringS>("{} Ration {} kaufen ({} Silber)", amount, text, price);
	} else {
		return format!<BuyMealStringP>("{} Rationen {} kaufen ({} Silber)", amount, text, price * amount);
	};
};
