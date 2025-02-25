/////////////////////////////////////////////////////////////////
//	B_ExchangeTheftAttitude(JP)
//	=======================
//
//	-Wird aufgerufen, wenn der Sc nach dem Diebstahl an einem Character
//	diesen wieder ungeschehen macht (aus B_AssignNewsTheftToVoice)
//	-Es werden alle nötigen Schritte übernommen : Zähler löschen, Attitüde
//	zurücksetzen, Bildschirmausgabe, Silberaustausch und den Gildenzähler
//	für Diebstähle zurücksetzen
//	Auch andere AI bedingte Attitüdenänderungen werden hiermit gesühnt
///////////////////////////////////////////////////////////////////
func void B_ExchangeMemoryAttitude()
{
	self.aivar[AIV_THEFTWITTNESS] = AIV_NODEED;
	self.aivar[AIV_BEENATTACKED] = AIV_NODEED;

	B_SetAttitude(self, ATT_NEUTRAL);

	var string string_NpcName;
	string_NpcName = self.name;
	string_NpcName = ConcatStrings(string_NpcName, _STR_MESSAGE_ATT_PAY_MIDFIX);
	string_NpcName = ConcatStrings(string_NpcName, B_SilverAmountToSatisfy_String());
	string_NpcName = ConcatStrings(string_NpcName, _STR_MESSAGE_ATT_PAY_POSTFIX);
	_ = PrintScreenColored(string_NpcName, -1, (_YPOS_MESSAGE_GIVEN), FONT_OLD_SMALL, _TIME_MESSAGE_GIVEN, TEXT_COLOR_YELLOW);

	CreateInvItems(self, ITMI_Silver, B_SilverAmountToSatisfy_Int());
	_ = Npc_RemoveInvItems(other, ITMI_Silver, B_SilverAmountToSatisfy_Int());

	// JP : Hier wird durch den "Diebstahl" des Nsc´s alles zurückgesetzt, auch auf die Gefahr hin, daß er einen Angriff durch Geld nehmen kompensiert --> Designkonform
	B_GuildDeAssignTheft();
};
