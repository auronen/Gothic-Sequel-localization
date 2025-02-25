/////////////////////////////////////////////////////////////////
//	Verteilfunktionen für die Stimmen bei equippten BesitzFlagwaffen	(JP)
//	====================================================
//
//	- hier werden die Reaktionen auf das Entdecken einer angelegten
//	Waffe mit Besitzflag des self.Nsc beim Spieler behandelt
//
///////////////////////////////////////////////////////////////////
//
//	!!!! SN: VORSICHT: Tagesgrenze funktioniert derzeit nicht !!!!
//
///////////////////////////////////////////////////////////////////

// -------------------------------------------------------------------------
instance MyWeapon(C_Info)
{
	nr				= 1;
	condition		= MyWeapon_Condition;
	information		= MyWeapon_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int MyWeapon_Condition()
{
	PrintDebugNpc(PD_ZS_CHECK, "MyWeapon_Condition");

	var int int_Day;
	var int int_Hour;
	var int int_Compare;

	int_Day = B_GetDay() * 25;
	int_Hour = B_GetHour();
	int_Compare = int_Day + int_Hour;

	if ((int_Compare >= self.aivar[AIV_STOLENWEAPON_HOUR])
	&& self.aivar[AIV_PLAYERHASMYWEAPON])
	{
		PrintDebugNpc(PD_ZS_CHECK, "MyWeapon_Condition ...TRUE");
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void MyWeapon_Info()
{
	PrintDebugNpc(PD_ZS_CHECK, "MyWeapon_Info");
	var int int_Day;
	var int int_Hour;

	int_Day = B_GetDay() * 25;
	int_Hour = B_GetHour();
	self.aivar[AIV_STOLENWEAPON_HOUR] = int_Day + int_Hour + 2;	// zwei Stunden Verzögerung

	Info_ClearChoices(MyWeapon);

	B_PointAndShout(self, other, "$THATSMYWEAPON");

	Info_AddChoice(MyWeapon, "Das war ein Versehen, hier hast Du Deine Waffe zurück.", MyWeapon_Lieb);

	Info_AddChoice(MyWeapon, "Hol sie Dir, wenn Du kannst", MyWeapon_HauAb);
};

// -------------------------------------------------------------------------

func void B_GetBackPersonalWeapon(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_CHECK, "AssignMyWeaponInfos");

	MyWeapon.npc = Hlp_GetInstanceID(slf);
};

func void MyWeapon_Lieb()
{
	PrintDebugNpc(PD_ZS_CHECK, "MyWeapon_Lieb");
	var C_Item melee;
	var C_Item ranged;

	var int int_melee;
	var int int_ranged;

	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);

	int_melee = Hlp_GetInstanceID(melee);
	int_ranged = Hlp_GetInstanceID(ranged);
	AI_Output(hero, self, "MyWeapon_Info_15_01");	//Das war ein Versehen, hier hast Du Deine Waffe zurück.
	B_Say(self, hero, "$WISEMOVE");

	//JP: Sonderbehandlung für die Arenakämpfer, weil hier die Waffe nicht im Slot hängt und ermittelt werden kann, man aber weiß, welche Waffe wer bekommt
	//Grim
	if (B_CompareNpcInstance(self, MIN_306_Grim))
	{
		B_GiveInvItems(other, self, ItMw_Grim_Pickaxe, 1);
	};

	//Goliath
	if (B_CompareNpcInstance(self, WRK_216_Goliath))
	{
		B_GiveInvItems(other, self, ItMw_Goliath_Sledgehammer, 1);
	};

	//Malgar
	if (B_CompareNpcInstance(self, DMH_1302_Malgar))
	{
		B_GiveInvItems(other, self, ItMw_Malgar_Broadsword, 1);
	};

	//Thora
	if (B_CompareNpcInstance(self, AMZ_900_Thora))
	{
		B_GiveInvItems(other, self, ItMw_Thora_Battlestaff, 1);
	};

	//Brutus
	if (B_CompareNpcInstance(self, MIL_121_Brutus))
	{
		B_GiveInvItems(other, self, ItMw_Brutus_Longsword, 1);
	};

	// Arenakämpfer Ende
	if (Npc_OwnedByNpc(melee, self))
	{
		B_GiveInvItems(other, self, int_melee, 1);			// Kann immer nur ein Item sein, da es sich um die angelegte Waffe handelt
	};

	if (Npc_OwnedByNpc(ranged, self))
	{
		B_GiveInvItems(other, self, int_ranged, 1);			// Kann immer nur ein Item sein, da es sich um die angelegte Waffe handelt
	};

	self.aivar[AIV_PLAYERHASMYWEAPON] = FALSE;
	AI_StopProcessInfos(self);
};

func void MyWeapon_HauAb()
{
	AI_Output(hero, self, "MyWeapon_Info_15_02");	//Hol sie Dir, wenn Du kannst
	B_Say(self, hero, "$YOUASKEDFORIT");
	AI_StopProcessInfos(self);
	B_AttackQuick(self, other);
};
