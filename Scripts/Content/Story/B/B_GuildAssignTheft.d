/////////////////////////////////////////////////////////////////////////
//	B_GuildAssignTheft	(JP)
//	==================
//	Wird von allen Funktionen aufgerufen, in denen ein Diebstahl festge+
//	stellt wird, um pro Gilde einen Zähler für die Anzahl der begangenen
// 	und nicht wieder vergoltenen Diebstähle zu führen
//	Zur Zeit ruft ZS_CatchThief diese Funktion auf, da nur persönlicher
//	Diebstahl relevant ist
////////////////////////////////////////////////////////////////////////
func void B_GuildAssignTheft()
{
	PrintDebugNpc(PD_ZS_CHECK, "B_GuildAssignTheft");
	if (self.guild == GIL_MILITIA)
	{
		int_Theft_Gil_Militia = int_Theft_Gil_Militia + 1;
	};

	if (self.guild == GIL_WORKER)
	{
		int_Theft_Gil_Worker = int_Theft_Gil_Worker + 1;
	};

	if (self.guild == GIL_MINER)
	{
		int_Theft_Gil_Miner = int_Theft_Gil_Miner + 1;
	};

	if (self.guild == GIL_HEALER)
	{
		int_Theft_Gil_Healer = int_Theft_Gil_Healer + 1;
	};

	if (self.guild == GIL_THIEF)
	{
		int_Theft_Gil_Thief = int_Theft_Gil_Thief + 1;
	};

	if (self.guild == GIL_POSSESSED)
	{
		int_Theft_Gil_Possessed = int_Theft_Gil_Possessed + 1;
	};

	if (self.guild == GIL_BEGGAR)
	{
		int_Theft_Gil_Beggar = int_Theft_Gil_Beggar + 1;
	};

	if (self.guild == GIL_DEMONIC)
	{
		int_Theft_Gil_Demonic = int_Theft_Gil_Demonic + 1;
	};

	if (self.guild == GIL_AMAZON)
	{
		int_Theft_Gil_Amazon = int_Theft_Gil_Amazon + 1;
	};

	if (self.guild == GIL_PALADIN)
	{
		int_Theft_Gil_Paladin = int_Theft_Gil_Paladin + 1;
	};

	if (self.guild == GIL_KDF)
	{
		int_Theft_Gil_kdf = int_Theft_Gil_kdf + 1;
	};

	if (self.guild == GIL_BLOODEARTH)
	{
		int_Theft_Gil_Bloodearth = int_Theft_Gil_Bloodearth + 1;
	};

	if (self.guild == GIL_DEMONHUNTER)
	{
		int_Theft_Gil_Demonhunter = int_Theft_Gil_Demonhunter + 1;
	};

	if (self.guild == GIL_RSVD_2)
	{
		int_Theft_Gil_Rsvd2 = int_Theft_Gil_Rsvd2 + 1;
	};

	if (self.guild == GIL_Rsvd_3)
	{
		int_Theft_Gil_Rsvd3 = int_Theft_Gil_Rsvd3 + 1;
	};

	if (Npc_GetPermAttitude(self, other) != ATT_HOSTILE)
	{
		B_SetAttitude(self, ATT_ANGRY);
	};

	self.aivar[AIV_THEFTWITTNESS] = self.aivar[AIV_THEFTWITTNESS] + 1;
};
