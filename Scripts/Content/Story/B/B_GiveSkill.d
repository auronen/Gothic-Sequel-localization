func int B_GiveSkill(var C_Npc typ, var int TAL, var int NEW_Wert, var int LP_Cost) //return 1
{
	// ---------- Umwandeln von var in const
	var int TAL_Wert;
	if (TAL == NPC_TALENT_1H) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_1H); }
	else if (TAL == NPC_TALENT_2H) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_2H); }
	else if (TAL == NPC_TALENT_STAFF) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_STAFF); }
	else if (TAL == NPC_TALENT_BOW) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOW); }
	else if (TAL == NPC_TALENT_CROSSBOW) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_CROSSBOW); }
	else if (TAL == NPC_TALENT_PICKLOCK) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKLOCK); }
	else if (TAL == NPC_TALENT_PICKPOCKET) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKPOCKET); }
	else if (TAL == NPC_TALENT_MAGE) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_MAGE); }
	else if (TAL == NPC_TALENT_SNEAK) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SNEAK); }
	else if (TAL == NPC_TALENT_SMITH) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SMITH); }
	else if (TAL == NPC_TALENT_COOK) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_COOK); }
	else if (TAL == NPC_TALENT_ACROBAT) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ACROBAT); }
	else if (TAL == NPC_TALENT_ALCHEMY) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ALCHEMY); }
	else if (TAL == NPC_TALENT_THAUMATURGY) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_THAUMATURGY); }
	else if (TAL == NPC_TALENT_BOWMAKER) { TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOWMAKER); };
	// ----------- Bedingungen/LP checken, dann ggf. vergeben
	if ((TAL_Wert + 1) == NEW_Wert)
	{
		if (typ.lp >= LP_cost)
		{
			typ.lp = typ.lp - LP_cost;

			if (tal == NPC_TALENT_1H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_1H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_1H, Npc_GetTalentValue(typ, NPC_TALENT_1H) + 5);
				_ = AI_PrintScreen(self, PRINT_LEARN_Onehanded, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_2H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_2H, Npc_GetTalentValue(typ, NPC_TALENT_2H) + 5);
				_ = AI_PrintScreen(self, PRINT_LEARN_Twohanded, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_STAFF)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_STAFF, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_STAFF, Npc_GetTalentValue(typ, NPC_TALENT_STAFF) + 5);
				_ = AI_PrintScreen(self, PRINT_LEARN_Staff, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_BOW, Npc_GetTalentValue(typ, NPC_TALENT_BOW) + 15);
				_ = AI_PrintScreen(self, PRINT_LEARN_Bow, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW) + 20);
				_ = AI_PrintScreen(self, PRINT_LEARN_Crossbow, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKLOCK, NEW_Wert);
				if (NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, 60);
					_ = AI_PrintScreen(self, PRINT_LEARN_Locks, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, 95);
					_ = AI_PrintScreen(self, PRINT_IMPROVE_Locks, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKPOCKET, NEW_Wert);
				if (NEW_Wert == 1)
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, 60);
					_ = AI_PrintScreen(self, PRINT_LEARN_PickPocket, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, 95);
					_ = AI_PrintScreen(self, PRINT_IMPROVE_PickPocket, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_MAGE, NEW_Wert);
				_ = AI_PrintScreen(self, PRINT_LEARN_MagicCircle, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SNEAK, NEW_Wert);
				_ = AI_PrintScreen(self, PRINT_LEARN_Sneak, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_SMITH)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SMITH, NEW_Wert);
				if (NEW_Wert == 1)
				{
					_ = AI_PrintScreen(self, PRINT_LEARN_Smithing, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
					B_LearnShortsword();
				}
				else
				{
					_ = AI_PrintScreen(self, PRINT_IMPROVE_Smithing, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_COOK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_COOK, NEW_Wert);
				if (NEW_Wert == 1)
				{
					_ = AI_PrintScreen(self, PRINT_LEARN_Cooking, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					_ = AI_PrintScreen(self, PRINT_IMPROVE_Cooking, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ACROBAT, NEW_Wert);
				_ = AI_PrintScreen(self, PRINT_LEARN_Acrobatics, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				return 1;
			}
			else if (tal == NPC_TALENT_ALCHEMY)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ALCHEMY, NEW_Wert);
				if (NEW_Wert == 1)
				{
					_ = AI_PrintScreen(self, PRINT_LEARN_Alchemy, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					_ = AI_PrintScreen(self, PRINT_IMPROVE_Alchemy, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_THAUMATURGY)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_THAUMATURGY, NEW_Wert);
				if (NEW_Wert == 1)
				{
					_ = AI_PrintScreen(self, PRINT_LEARN_Runes, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					_ = AI_PrintScreen(self, PRINT_IMPROVE_Runes, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else if (tal == NPC_TALENT_BOWMAKER)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOWMAKER, NEW_Wert);
				if (NEW_Wert == 1)
				{
					_ = AI_PrintScreen(self, PRINT_LEARN_BowMaking, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				}
				else
				{
					_ = AI_PrintScreen(self, PRINT_IMPROVE_BowMaking, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
				};

				return 1;
			}
			else
			{
				return 0;
			};
		}
		else
		{
			_ = AI_PrintScreen(self, PRINT_NotEnoughSkillPoints, -1, -1, FONT_OLD_BIG, 2, TEXT_COLOR_WHITE);
			B_Say(self, other, "$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else // NICHT eine Stufe davor
	{
		if (TAL_Wert >= NEW_Wert)
		{
			B_Say(self, other, "$NOLEARNYOUREBETTER"); //Du bist jetzt schon besser!
			return 0;
		}
		else if ((TAL_Wert + 1) < NEW_Wert) //d.h. i.d.R. TAL_Wert=2 und NEW_Wert=0, außer bei TALENT_MAGE
		{
			B_Say(self, other, "$NOLEARNYOUALREADYKNOW"); //Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
			return 0;
		};

		return 0;
	};
};
