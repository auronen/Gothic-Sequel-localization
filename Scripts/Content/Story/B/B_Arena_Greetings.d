//////////////////////////////////////////////////////////////////////////////////
//	B_Arena_Greetings
//	================
//	spielt eine zufällige Grußanimation ab, bevor der Kampf beginnt.
//////////////////////////////////////////////////////////////////////////////////
func void B_Arena_Greetings(var C_Npc slf)
{
	PrintDebugNpc(PD_TA_DETAIL, "B_Arena_Greetings");

	var int random;
	random = Hlp_Random(6);

	if (random == 0) { AI_PlayAni(slf, "T_GREETGRD"); };
	if (random == 1) { AI_PlayAni(slf, "T_GREETNOV"); };
	if (random == 2) { AI_PlayAni(slf, "T_GREETCOOL"); };
	if (random == 3) { AI_PlayAni(slf, "T_IGETYOU"); };
	if (random == 4) { AI_PlayAni(slf, "T_COMEOVERHERE"); };
	if (random == 5) { AI_PlayAni(slf, "T_GREETFIGHT"); };
};
