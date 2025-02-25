////////////////////////////////////////////////////////////////////////////
//	B_GetMobGuild
//	=============
//
//	mit dieser Funktion läßt sich heraus finden, welcher Gilde das Mobsi gehört,
//	das der Spieler grade manipuliert.
// 	Übergabeparameter ist der Sc/Nsc, der grade das Mobsi benutzt
//	Rückgabewert ist die Besitzgilde des Mobsis
//	Aufgerufen wird die Funktion von B_ClearRoomUseMob	(ZS_ClearRoom)
/////////////////////////////////////////////////////////////////////////////
func int B_GetMobGuild(var C_Npc manipulator)
{
	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_NONE))
	{
		return GIL_NONE;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_MILITIA))
	{
		return GIL_MILITIA;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_WORKER))
	{
		return GIL_WORKER;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_MINER))
	{
		return GIL_MINER;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_HEALER))
	{
		return GIL_HEALER;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_THIEF))
	{
		return GIL_THIEF;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_POSSESSED))
	{
		return GIL_POSSESSED;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_BEGGAR))
	{
		return GIL_BEGGAR;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_DEMONIC))
	{
		return GIL_DEMONIC;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_AMAZON))
	{
		return GIL_AMAZON;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_PALADIN))
	{
		return GIL_PALADIN;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_KDF))
	{
		return GIL_KDF;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_BLOODEARTH))
	{
		return GIL_BLOODEARTH;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_DEMONHUNTER))
	{
		return GIL_DEMONHUNTER;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_RSVD_2))
	{
		return GIL_RSVD_2;
	};

	if (Npc_IsDetectedMobOwnedByGuild(manipulator, GIL_RSVD_3))
	{
		return GIL_RSVD_3;
	};

	return GIL_NONE;
};
