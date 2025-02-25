//////////////////////////////////////////////////////////////////////////
//	B_SetGuildAttitude
//	==================
//	Setzt die Gilden-Attitüde von 'fromGuild' gegenüber 'toGuild' auf den
//	Wert 'attitude'. Menschen und Orks können mit der Sammelbezeichnung
//	GIL_SEPERATOR_HUM bzw. GIL_SEPERATOR_ORC angegeben werden
//////////////////////////////////////////////////////////////////////////
func void B_SetGuildAttitude(var int fromGuild, var int attitude, var int toGuild)
{
	if (toGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_NONE);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_MILITIA);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_WORKER);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_HEALER);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_THIEF);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_POSSESSED);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_BEGGAR);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_DEMONIC);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_AMAZON);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_PALADIN);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_KDF);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_BLOODEARTH);
		Wld_SetGuildAttitude(fromGuild, attitude, GIL_MINER);
	}
	else if (fromGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude(GIL_NONE, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_MILITIA, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_WORKER, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_HEALER, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_THIEF, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_POSSESSED, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_BEGGAR, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_DEMONIC, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_AMAZON, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_PALADIN, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_KDF, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_BLOODEARTH, attitude, toGuild);
		Wld_SetGuildAttitude(GIL_MINER, attitude, toGuild);
	}
	else
	{
		Wld_SetGuildAttitude(fromGuild, attitude, toGuild);
	};
};
