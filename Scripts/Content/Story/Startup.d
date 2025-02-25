func void STARTUP_PSICAMP()
{
};

func void INIT_PSICAMP()
{
	/*************************************************************
	**                STARTUP_LIGHTS IN PSICAMP					**
	*************************************************************/
	/*
	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_01", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_01", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_01", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_02", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_02", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_02", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_03", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_03", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_03", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_04", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_04", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_04", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_05", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_05", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_05", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_06", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_06", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_06", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_07", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_07", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_07", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_08", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_08", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_08", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_09", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_09", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_09", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_10", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_10", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_10", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_11", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_11", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_11", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_12", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_12", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_12", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_13", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_13", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_13", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_14", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_14", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_14", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_15", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_15", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_15", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_16", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_16", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_16", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_17", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_17", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_17", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_18", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_18", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_18", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_19", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_19", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_19", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_20", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_20", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_20", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_21", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_21", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_21", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_22", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_22", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_22", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_23", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_23", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_23", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_24", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_24", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_24", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_25", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_25", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_25", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_26", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_26", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_26", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_27", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_27", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_27", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_28", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_28", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_28", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_29", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_29", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_29", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_30", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_30", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_30", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_31", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_31", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_31", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_32", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_32", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_32", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_33", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_33", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_33", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_34", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_34", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_34", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_35", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_35", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_35", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_36", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_36", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_36", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_37", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_37", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_37", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_38", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_38", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_38", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_39", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_39", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_39", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_40", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_40", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_40", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_41", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_41", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_41", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_42", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_42", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_42", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_43", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_43", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_43", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_44", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_44", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_44", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_45", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_45", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_45", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_46", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_46", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_46", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_47", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_47", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_47", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_48", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_48", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_48", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_49", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_49", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_49", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_50", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_50", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_50", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_51", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_51", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_51", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_52", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_52", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_52", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_53", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_53", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_53", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_54", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_54", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_54", 0);

	Wld_SetObjectRoutine(00, 00, "PC_CRYSTALLIGHT_55", 1);
	Wld_SetObjectRoutine(20, 00, "PC_CRYSTALLIGHT_55", 1);
	Wld_SetObjectRoutine(05, 00, "PC_CRYSTALLIGHT_55", 0);

	/*************************************************************
	**        PORTALRAUMZUWEISUNG IM PSICAMP					**
	*************************************************************/
	/*
	Wld_AssignRoomToGuild("PSIH01", GIL_NOV); //OK				nlhu01 - nlhu32
	Wld_AssignRoomToGuild("PSIH02", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH03", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH04", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH05", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH06", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH07", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH08", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH09", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH10", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH11", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH12", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH13", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH14", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH15", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH16", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH17", GIL_NOV); //defekt
	Wld_AssignRoomToGuild("PSIH18", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH19", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH20", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH21", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH22", GIL_NOV);
	//Wld_AssignRoomToGuild("PSIH23", GIL_NOV); //Harloks Hütte, Hut 31
	Wld_AssignRoomToGuild("PSIH24", GIL_NOV);
	//Wld_AssignRoomToGuild("PSIH25", GIL_NOV); Alchemielabor soll frei zugänglich sein!
	Wld_AssignRoomToGuild("PSIH26", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH27", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH28", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH29", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH30", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH31", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH32", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH33", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH34", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH35", GIL_NOV);
	Wld_AssignRoomToGuild("PSIH36", GIL_NOV);
	*/
};

func void STARTUP_NEWCAMP()
{
	//----------Vorplatz (Surface)---------------------------
};

func void INIT_NEWCAMP()
{
	//**************************************************************

	// Objekt-TAs
	//Wld_SetObjectRoutine(20, 00, "EVT_NC_MAINGATE01_TRIGGER", 1);		// SN 09.01.01: auskommentiert, damit Tore rund um die Uhr offen sind
	//Wld_SetObjectRoutine(08, 00, "EVT_NC_MAINGATE01_TRIGGER", 0);

	/*************************************************************
	**                 PORTALRAUMZUWEISUNG						**
	*************************************************************/
	/*
	Wld_AssignRoomToGuild("RICEB01", GIL_BAU);
	Wld_AssignRoomToGuild("RICEB02", GIL_BAU);

	/*************************************************************
	**        PORTALRAUMZUWEISUNG IM NEUEN LAGER				**
	*************************************************************/
	/*
	Wld_AssignRoomToGuild("NLHU25", GIL_ORG);	// Waypoint NC_HUT01 (SC-Hütte)
	//Wld_AssignRoomToGuild("NLOBERM", GIL_BAU);	// Lee's Höhle

	Wld_AssignRoomToGuild("NLHU26", GIL_SLD);	// Waypoint NC_HUT02
	Wld_AssignRoomToGuild("NLHU27", GIL_SLD);	// Waypoint NC_HUT03
	Wld_AssignRoomToGuild("NLHU31", GIL_SLD);	// Waypoint NC_HUT04
	Wld_AssignRoomToGuild("NLHU32", GIL_SLD);	// Waypoint NC_HUT05
	Wld_AssignRoomToGuild("NLHU23", GIL_SLD);	// Waypoint NC_HUT06
	Wld_AssignRoomToGuild("NLHU24", GIL_SLD);	// Waypoint NC_HUT07
	Wld_AssignRoomToGuild("NLHU30", GIL_SLD);	// Waypoint NC_HUT08
	Wld_AssignRoomToGuild("NLHU29", GIL_SLD);	// Waypoint NC_HUT09
	Wld_AssignRoomToGuild("NLHU28", GIL_SLD);	// Waypoint NC_HUT10

	Wld_AssignRoomToGuild("NLHU22", GIL_ORG);	// Waypoint NC_HUT11
	Wld_AssignRoomToGuild("NLHU03", GIL_ORG);	// Waypoint NC_HUT12
	Wld_AssignRoomToGuild("NLHU05", GIL_ORG);	// Waypoint NC_HUT13
	Wld_AssignRoomToGuild("NLHU06", GIL_ORG);	// Waypoint NC_HUT14
	Wld_AssignRoomToGuild("NLHU21", GIL_ORG);	// Waypoint NC_HUT15
	Wld_AssignRoomToGuild("NLHU20", GIL_ORG);	// Waypoint NC_HUT16
	Wld_AssignRoomToGuild("NLHU19", GIL_ORG);	// Waypoint NC_HUT17
	Wld_AssignRoomToGuild("NLHU18", GIL_ORG);	// Waypoint NC_HUT18
	Wld_AssignRoomToGuild("NLHU17", GIL_ORG);	// Waypoint NC_HUT19
	Wld_AssignRoomToGuild("NLHU16", GIL_ORG);	// Waypoint NC_HUT20
	Wld_AssignRoomToGuild("NLHU15", GIL_ORG);	// Waypoint NC_HUT21
	//Wld_AssignRoomToGuild("NLHU14", GIL_BAU);	// Waypoint NC_HUT22 (Lares' Hütte)
	Wld_AssignRoomToGuild("NLHU13", GIL_ORG);	// Waypoint NC_HUT23
	Wld_AssignRoomToGuild("NLHU12", GIL_ORG);	// Waypoint NC_HUT24
	Wld_AssignRoomToGuild("NLHU11", GIL_ORG);	// Waypoint NC_HUT25
	Wld_AssignRoomToGuild("NLHU10", GIL_ORG);	// Waypoint NC_HUT26
	Wld_AssignRoomToGuild("NLHU09", GIL_ORG);	// Waypoint NC_HUT27
	Wld_AssignRoomToGuild("NLHU08", GIL_ORG);	// Waypoint NC_HUT28
	Wld_AssignRoomToGuild("NLHU07", GIL_ORG);	// Waypoint NC_HUT29
	Wld_AssignRoomToGuild("NLHU04", GIL_ORG);	// Waypoint NC_HUT30
	Wld_AssignRoomToGuild("NLHU02", GIL_ORG);	// Waypoint NC_HUT31
	Wld_AssignRoomToGuild("NLHU01", GIL_ORG);	// Waypoint NC_HUT32

	Wld_AssignRoomToGuild("MAGE01", GIL_KDW);	//NC_KDW01_IN
	//Wld_AssignRoomToGuild("MAGE02", GIL_KDW);	//Alchemielabor frei zugänglich!
	Wld_AssignRoomToGuild("MAGE03", GIL_KDW);	//NC_KDW05_IN
	//Wld_AssignRoomToGuild("MAGE04", GIL_KDW);	//Bibliothek frei zugänglich!
	Wld_AssignRoomToGuild("MAGE05", GIL_KDW);	//NC_KDW03_IN
	Wld_AssignRoomToGuild("MAGE06", GIL_KDW);	//NC_KDW02_IN
	//Wld_AssignRoomToGuild("MAGHO4", GIL_KDW);	//Pentagrammhöhle frei zugänglich
	*/
};

func void STARTUP_OLDCAMP()
{
	//Dämonenjäger

	Wld_InsertNpc(DMH_1303_Rangar, WP_DEFAULT);

	Wld_InsertNpc(PC_Thief, WP_DEFAULT);
	//Wld_InsertNpc(PC_Fighter, WP_DEFAULT);
	Wld_InsertNpc(PC_Psionic, WP_DEFAULT);

	Wld_InsertNpc(MIL_100_Halvor, WP_DEFAULT);
	Wld_InsertNpc(MIL_101_Wylfern, WP_DEFAULT);

	Wld_InsertNpc(MIL_103_Berengar, WP_DEFAULT);
	Wld_InsertNpc(MIL_104_Hyglas, WP_DEFAULT);
	Wld_InsertNpc(MIL_105_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_106_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_107_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_108_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_109_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_110_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_111_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_112_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_113_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_114_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_115_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_116_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_117_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_118_Calgor, WP_DEFAULT);
	Wld_InsertNpc(MIL_119_Cassian, WP_DEFAULT);
	Wld_InsertNpc(MIL_120_Julius, WP_DEFAULT);
	Wld_InsertNpc(MIL_123_Osbert, WP_DEFAULT);
	Wld_InsertNpc(MIL_124_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_125_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_126_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_127_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_128_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_129_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_130_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_131_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_132_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_133_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_134_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_135_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_136_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_137_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_138_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_139_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_140_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_141_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_142_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_143_Militia, WP_DEFAULT);
	Wld_InsertNpc(MIL_144_Militia, WP_DEFAULT);

	Wld_InsertNpc(WRK_200_Gotmar, WP_DEFAULT);
	Wld_InsertNpc(WRK_201_Gordian, WP_DEFAULT);
	Wld_InsertNpc(WRK_202_Dyrian, WP_DEFAULT);
	Wld_InsertNpc(WRK_203_Bromor, WP_DEFAULT);
	//Wld_InsertNpc(WRK_204_Khoriner, WP_DEFAULT); ersatzlos rausgeflogen

	Wld_InsertNpc(WRK_206_Nicolos, WP_DEFAULT);
	Wld_InsertNpc(WRK_207_Worker, WP_DEFAULT);
	Wld_InsertNpc(WRK_208_Worker, WP_DEFAULT);
	Wld_InsertNpc(WRK_209_Worker, WP_DEFAULT);
	Wld_InsertNpc(WRK_210_Worker, WP_DEFAULT);
	//Wld_InsertNpc(WRK_211_Worker, WP_DEFAULT); rausgeflogen für Dyrian
	Wld_InsertNpc(WRK_212_Rassmuson, WP_DEFAULT);
	//Wld_InsertNpc(WRK_213_Worker, WP_DEFAULT);// rausgeflogen für BOTHOLO
	Wld_InsertNpc(WRK_214_Worker, WP_DEFAULT);
	//Wld_InsertNpc(WRK_215_Worker, WP_DEFAULT); durch WRK_228_Horatio ersetzt
	Wld_InsertNpc(WRK_217_Worker, WP_DEFAULT);
	//Wld_InsertNpc(WRK_218_Sandro, WP_DEFAULT);
	Wld_InsertNpc(WRK_219_Botholo, WP_DEFAULT);
	Wld_InsertNpc(WRK_220_Worker, WP_DEFAULT);
	Wld_InsertNpc(WRK_221_Worker, WP_DEFAULT);
	Wld_InsertNpc(WRK_222_Helvegor, WP_DEFAULT);
	Wld_InsertNpc(WRK_223_Ruga, WP_DEFAULT);
	Wld_InsertNpc(WRK_224_Igaraz, WP_DEFAULT);
	Wld_InsertNpc(WRK_225_Agon, WP_DEFAULT);
	Wld_InsertNpc(WRK_226_Osric, WP_DEFAULT);
	Wld_InsertNpc(WRK_227_Snaf, WP_DEFAULT);
	Wld_InsertNpc(WRK_228_Horatio, WP_DEFAULT);

	Wld_InsertNpc(MIN_300_Sylvester, WP_DEFAULT);
	Wld_InsertNpc(MIN_301_Miner, WP_DEFAULT);
	Wld_InsertNpc(MIN_302_Miner, WP_DEFAULT);
	Wld_InsertNpc(MIN_303_Miner, WP_DEFAULT);
	Wld_InsertNpc(MIN_304_Miner, WP_DEFAULT);
	Wld_InsertNpc(MIN_305_Miner, WP_DEFAULT);

	Wld_InsertNpc(THF_400_Edo, WP_DEFAULT);
	Wld_InsertNpc(THF_401_Huldrych, WP_DEFAULT);
	Wld_InsertNpc(THF_402_Karras, WP_DEFAULT);
	Wld_InsertNpc(THF_403_Gerion, WP_DEFAULT);
	Wld_InsertNpc(THF_404_Thief, WP_DEFAULT);
	Wld_InsertNpc(THF_405_Thief, WP_DEFAULT);
	Wld_InsertNpc(THF_406_Thief, WP_DEFAULT);
	Wld_InsertNpc(THF_407_Thief, WP_DEFAULT);
	Wld_InsertNpc(THF_408_Thief, WP_DEFAULT);
	Wld_InsertNpc(THF_409_Pyro, WP_DEFAULT);

	Wld_InsertNpc(HLR_500_Palgur, WP_DEFAULT);
	Wld_InsertNpc(HLR_501_Talamon, WP_DEFAULT);
	Wld_InsertNpc(HLR_502_Isgar, WP_DEFAULT);
	Wld_InsertNpc(HLR_503_Odo, WP_DEFAULT);
	Wld_InsertNpc(HLR_504_Otmar, WP_DEFAULT);

	Wld_InsertNpc(POS_600_Jurgi, WP_DEFAULT);
	Wld_InsertNpc(POS_601_Paskara, WP_DEFAULT);
	Wld_InsertNpc(POS_602_Halbert, WP_DEFAULT);
	Wld_InsertNpc(POS_603_Gonker, WP_DEFAULT);
	Wld_InsertNpc(POS_604_Possessed, WP_DEFAULT);
	Wld_InsertNpc(POS_605_Bartok, WP_DEFAULT);

	Wld_InsertNpc(BEG_700_Jesper, WP_DEFAULT);
	Wld_InsertNpc(BEG_701_Jose, WP_DEFAULT);
	Wld_InsertNpc(BEG_702_Nabor, WP_DEFAULT);
	Wld_InsertNpc(BEG_703_Beggar, WP_DEFAULT);
	Wld_InsertNpc(BEG_704_Lakarus, WP_DEFAULT);
	Wld_InsertNpc(BEG_705_Beggar, WP_DEFAULT);
	Wld_InsertNpc(BEG_706_Beggar, WP_DEFAULT);

	//Arena
	Wld_InsertNpc(MIL_122_Arenamaster, WP_DEFAULT);
	Wld_InsertNpc(AMZ_900_Thora, WP_DEFAULT);
	Wld_InsertNpc(DMH_1302_Malgar, WP_DEFAULT);
	Wld_InsertNpc(MIL_121_Brutus, WP_DEFAULT);
	Wld_InsertNpc(WRK_216_Goliath, WP_DEFAULT);
	Wld_InsertNpc(MIN_306_Grim, WP_DEFAULT);

	//Monster
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_01");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_02");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_03");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_04");
	// Diego AUftrag Meatbugs werden im Auftrag gespawnt
	//Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_05");
	//Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_06");
	//Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_07");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_08");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_09");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_10");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_11");
	Wld_InsertNpc(Meatbug, "FP_MEATBUG_SPAWN_12");

	//SONSTIGE
	Wld_InsertNpc(NON_1401_Ryan, "OC1");

	// wichtige Items MÜSSEN über dieses Skript und NICHT direkt im Spacer in die Welt gesetzt werden!!!
	Wld_InsertItem(ItAr_ScrollTrfMeatbug, "FP_SPAWN_ACROBAT_1");	// Mauerrest an Burgschmiede
	Wld_InsertItem(ItMi_Amulet_Psi, "FP_SPAWN_ACROBAT_2");	// Dach des Gardistenhauses
	Wld_InsertItem(Ring_des_Geschicks, "FP_SPAWN_ACROBAT_3");	// Dach der Burgschmiede
	Wld_InsertItem(ItMi_BloodOreNugget, "FP_SPAWN_ACROBAT_4");	// Dach der Kapelle
	Wld_InsertItem(ItMi_Silver, "FP_SPAWN_ACROBAT_5");	// Dach des EBR-Hauses
	Wld_InsertItem(ItRi_Point_01, "FP_SPAWN_ACROBAT_6");	// Dach der Hausruine

	// Befüllen der Item-Container
	FillChests_OldCamp();
	FillOre_OldCamp();

	// Spielstart-Skript! Liegt hier, damit es auch mit der OLDCAMP.BAT ausgeführt wird!
	//B_InitMonsterAttitudes();
	//B_InitGuildAttitudes();
	//B_Kapitelwechsel(1);
};

func void INIT_OLDCAMP()
{
	/*************************************************************
	**                STARTUP_LIGHTS IN OLDCAMP					**
	*************************************************************/
	//---- SN 09.01.01: auskommentiert, damit Tore rund um die Uhr offen sind ----
	//Wld_SetObjectRoutine(20, 00, "EVT_OC_MAINGATE01_SWITCH", 1);
	//Wld_SetObjectRoutine(08, 00, "EVT_OC_MAINGATE01_SWITCH", 0);
	//Wld_SetObjectRoutine(20, 00, "EVT_OC_MAINGATE02_SWITCH", 1);
	//Wld_SetObjectRoutine(08, 00, "EVT_OC_MAINGATE02_SWITCH", 0);
	//Wld_SetObjectRoutine(23, 15, "EVT_OC_INNERMAINGATE_SWITCH", 1); //Grd_280_Gardist
	//Wld_SetObjectRoutine(06, 30, "EVT_OC_INNERMAINGATE_SWITCH", 0);

	//Wld_SetObjectRoutine(00, 00, "OCR_ARENA_MAINGATE_TRIGGER", 1);
	//Wld_SetObjectRoutine(20, 00, "OCR_ARENA_MAINGATE_TRIGGER", 1);
	//Wld_SetObjectRoutine(08, 00, "OCR_ARENA_MAINGATE_TRIGGER", 0);

	//------------------------------------------
	Wld_SetMobRoutine(00, 00, "FIREPLACE", 1);
	Wld_SetMobRoutine(21, 00, "FIREPLACE", 1);
	Wld_SetMobRoutine(05, 00, "FIREPLACE", 0);

	///Test(Marco)
	Wld_SetMobRoutine(00, 00, "OC_FIREPLACE_CAMPFIRE", 1);
	Wld_SetMobRoutine(21, 00, "OC_FIREPLACE_CAMPFIRE", 1);
	Wld_SetMobRoutine(05, 00, "OC_FIREPLACE_CAMPFIRE", 0);
	///Test Ende

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_01", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH_01", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH_01", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_02", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH_02", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH_02", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_03", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH_03", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH_03", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_04", 1);
	Wld_SetObjectRoutine(20, 03, "OC_FIREPLACE_HIGH_04", 1);
	Wld_SetObjectRoutine(05, 03, "OC_FIREPLACE_HIGH_04", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_05", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH_05", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH_05", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_06", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH_06", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH_06", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_07", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH_07", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH_07", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_08", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH_08", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH_08", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_09", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_HIGH_09", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_HIGH_09", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_10", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_HIGH_10", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_HIGH_10", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_11", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH_11", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH_11", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_12", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH_12", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH_12", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_13", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH_13", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH_13", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH_14", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH_14", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH_14", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_01", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_02", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(20, 03, "OC_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(05, 03, "OC_FIREPLACE_HIGH2_03", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_04", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH2_05", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH2_06", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH2_07", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_HIGH2_08", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_HIGH2_09", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH2_10", 0);

	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_11", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_12", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(20, 03, "OC_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(05, 03, "OC_FIREPLACE_HIGH2_13", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_14", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH2_15", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_16", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH2_16", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH2_16", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_17", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH2_17", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH2_17", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_18", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_HIGH2_18", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_HIGH2_18", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_19", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_HIGH2_19", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_HIGH2_19", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_20", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_20", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH2_20", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_21", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_21", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_21", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_22", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_22", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_22", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_23", 1);
	Wld_SetObjectRoutine(20, 03, "OC_FIREPLACE_HIGH2_23", 1);
	Wld_SetObjectRoutine(05, 03, "OC_FIREPLACE_HIGH2_23", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_24", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_24", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_24", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_25", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH2_25", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH2_25", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_26", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH2_26", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH2_26", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_27", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH2_27", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH2_27", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_28", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_29", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_30", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_31", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_31", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_31", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_32", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_32", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_32", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_33", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_33", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_33", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_34", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_34", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_34", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_35", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH2_35", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH2_35", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_36", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH2_36", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH2_36", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_37", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH2_37", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH2_37", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_38", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_HIGH2_38", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_HIGH2_38", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_39", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_HIGH2_39", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_HIGH2_39", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_40", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_40", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH2_40", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_41", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_41", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_41", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_42", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_42", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_42", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_43", 1);
	Wld_SetObjectRoutine(20, 03, "OC_FIREPLACE_HIGH2_43", 1);
	Wld_SetObjectRoutine(05, 03, "OC_FIREPLACE_HIGH2_43", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_44", 1);
	Wld_SetObjectRoutine(20, 04, "OC_FIREPLACE_HIGH2_44", 1);
	Wld_SetObjectRoutine(05, 04, "OC_FIREPLACE_HIGH2_44", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_45", 1);
	Wld_SetObjectRoutine(20, 05, "OC_FIREPLACE_HIGH2_45", 1);
	Wld_SetObjectRoutine(05, 05, "OC_FIREPLACE_HIGH2_45", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_46", 1);
	Wld_SetObjectRoutine(20, 06, "OC_FIREPLACE_HIGH2_46", 1);
	Wld_SetObjectRoutine(05, 06, "OC_FIREPLACE_HIGH2_46", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_47", 1);
	Wld_SetObjectRoutine(20, 07, "OC_FIREPLACE_HIGH2_47", 1);
	Wld_SetObjectRoutine(05, 07, "OC_FIREPLACE_HIGH2_47", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_48", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_HIGH2_48", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_HIGH2_48", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_49", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_HIGH2_49", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_HIGH2_49", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_50", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_50", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH2_50", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_51", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_51", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_51", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_52", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_52", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_52", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_53", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_HIGH2_53", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_HIGH2_53", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_54", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_HIGH2_54", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_HIGH2_54", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_55", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_HIGH2_55", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_HIGH2_55", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_MIDDLE_01", 1);
	Wld_SetObjectRoutine(20, 08, "OC_FIREPLACE_MIDDLE_01", 1);
	Wld_SetObjectRoutine(05, 08, "OC_FIREPLACE_MIDDLE_01", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_MIDDLE_01", 1);
	Wld_SetObjectRoutine(20, 09, "OC_FIREPLACE_MIDDLE_01", 1);
	Wld_SetObjectRoutine(05, 09, "OC_FIREPLACE_MIDDLE_01", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_MIDDLE_02", 1);
	Wld_SetObjectRoutine(20, 00, "OC_FIREPLACE_MIDDLE_02", 1);
	Wld_SetObjectRoutine(05, 00, "OC_FIREPLACE_MIDDLE_02", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_MIDDLE_03", 1);
	Wld_SetObjectRoutine(20, 01, "OC_FIREPLACE_MIDDLE_03", 1);
	Wld_SetObjectRoutine(05, 01, "OC_FIREPLACE_MIDDLE_03", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_MIDDLE_04", 1);
	Wld_SetObjectRoutine(20, 02, "OC_FIREPLACE_MIDDLE_04", 1);
	Wld_SetObjectRoutine(05, 02, "OC_FIREPLACE_MIDDLE_04", 0);

	//-------- Arenafackeln --------
	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(18, 03, "OC_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(22, 33, "OC_FIREPLACE_HIGH2_28", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(18, 04, "OC_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(22, 34, "OC_FIREPLACE_HIGH2_29", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(18, 05, "OC_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(22, 35, "OC_FIREPLACE_HIGH2_30", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_31", 1);
	Wld_SetObjectRoutine(18, 06, "OC_FIREPLACE_HIGH2_31", 1);
	Wld_SetObjectRoutine(22, 36, "OC_FIREPLACE_HIGH2_31", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_33", 1);
	Wld_SetObjectRoutine(18, 07, "OC_FIREPLACE_HIGH2_33", 1);
	Wld_SetObjectRoutine(22, 37, "OC_FIREPLACE_HIGH2_33", 0);

	Wld_SetObjectRoutine(00, 00, "OC_FIREPLACE_HIGH2_32", 1);
	Wld_SetObjectRoutine(18, 08, "OC_FIREPLACE_HIGH2_32", 1);
	Wld_SetObjectRoutine(22, 38, "OC_FIREPLACE_HIGH2_32", 0);
	//-------- Arenafackeln ENDE --------

	/*************************************************************
	**        PORTALRAUMZUWEISUNG IN OLDCAMP - AUSSENRING		**
	**   CS: Bei den Buddlerhütten Kleinbuchstaben lassen,		**
	**                  sonst gehts nicht						**
	*************************************************************/
	/*
	Wld_AssignRoomToGuild("KI1", GIL_GRD); 	// Portalraum KDF
	Wld_AssignRoomToGuild("HH8", GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH5", GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH4", GIL_GRD);	// Portalraum EBR-Bedroom
	Wld_AssignRoomToGuild("HH7", GIL_GRD);	// Portalraum EBR-Bedroom

	Wld_AssignRoomToGuild("ocgateb", GIL_GRD);	//Wachraum am Haupteingang
	//Wld_AssignRoomToGuild("hütte1", GIL_VLK); //Diegos Hütte
	Wld_AssignRoomToGuild("hütte2", GIL_VLK);
	Wld_AssignRoomToGuild("hütte3", GIL_VLK);
	Wld_AssignRoomToGuild("hütte4", GIL_VLK);
	Wld_AssignRoomToGuild("hütte5", GIL_VLK);

	Wld_AssignRoomToGuild("hütte9", GIL_VLK);
	Wld_AssignRoomToGuild("hütte10", GIL_VLK);
	Wld_AssignRoomToGuild("hütte11", GIL_VLK);

	Wld_AssignRoomToGuild("hütte13", GIL_VLK);
	Wld_AssignRoomToGuild("hütte14", GIL_VLK);
	Wld_AssignRoomToGuild("hütte15", GIL_VLK);
	Wld_AssignRoomToGuild("hütte16", GIL_VLK);
	//Wld_AssignRoomToGuild("hütte17", GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht

	Wld_AssignRoomToGuild("hütte19", GIL_VLK);

	Wld_AssignRoomToGuild("hütte21", GIL_VLK);

	Wld_AssignRoomToGuild("hütte24", GIL_VLK);
	Wld_AssignRoomToGuild("hütte25", GIL_VLK);
	//Wld_AssignRoomToGuild("hütte26", GIL_VLK); //PLAYER Hütte
	Wld_AssignRoomToGuild("hütte27", GIL_VLK);
	Wld_AssignRoomToGuild("hütte28", GIL_VLK);

	Wld_AssignRoomToGuild("hütte31", GIL_VLK);
	Wld_AssignRoomToGuild("hütte32", GIL_VLK);
	Wld_AssignRoomToGuild("hütte33", GIL_VLK);
	Wld_AssignRoomToGuild("hütte34", GIL_VLK);

	Wld_AssignRoomToGuild("hütte36", GIL_VLK);
	Wld_AssignRoomToGuild("hütte37", GIL_VLK);

	Wld_AssignRoomToGuild("hütte40", GIL_VLK);
	Wld_AssignRoomToGuild("hütte41", GIL_VLK);

	Wld_AssignRoomToGuild("hütte44", GIL_VLK);

	Wld_AssignRoomToGuild("hütte47", GIL_VLK);
	Wld_AssignRoomToGuild("hütte48", GIL_VLK);
	Wld_AssignRoomToGuild("hütte49", GIL_VLK);
	Wld_AssignRoomToGuild("hütte50", GIL_VLK);

	Wld_AssignRoomToGuild("hütte52", GIL_VLK);

	Wld_AssignRoomToGuild("hütte54", GIL_VLK);
	Wld_AssignRoomToGuild("hütte55", GIL_VLK);
	Wld_AssignRoomToGuild("hütte56", GIL_VLK);

	Wld_AssignRoomToGuild("hütte58", GIL_VLK);
	Wld_AssignRoomToGuild("hütte59", GIL_VLK);
	Wld_AssignRoomToGuild("hütte60", GIL_VLK);
	Wld_AssignRoomToGuild("hütte61", GIL_VLK);
	Wld_AssignRoomToGuild("hütte62", GIL_VLK);
	Wld_AssignRoomToGuild("hütte63", GIL_VLK);
	//Wld_AssignRoomToGuild("hütte64", GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht
	Wld_AssignRoomToGuild("hütte65", GIL_VLK);
	Wld_AssignRoomToGuild("hütte66", GIL_VLK);
	Wld_AssignRoomToGuild("hütte67", GIL_VLK);
	//Wld_AssignRoomToGuild("hütte68", GIL_VLK); Durchgangshütte, wird nicht auf jedes Betreten überwacht

	Wld_AssignRoomToGuild("hütte73", GIL_VLK);
	Wld_AssignRoomToGuild("hütte74", GIL_VLK);
	Wld_AssignRoomToGuild("hütte75", GIL_VLK);
	//Wld_AssignRoomToGuild("hütte76", GIL_VLK);	Grahams Hütte, abgesprochen mit Mike
	Wld_AssignRoomToGuild("hütte77", GIL_VLK);
	*/
	Wld_AssignRoomToGuild("EG2", GIL_MILITIA);
	Wld_AssignRoomToGuild("EG3", GIL_MILITIA);
	Wld_AssignRoomToGuild("EG4", GIL_MILITIA);
	Wld_AssignRoomToGuild("EG5", GIL_MILITIA);

	Wld_AssignRoomToGuild("STHAUS", GIL_MILITIA);
	Wld_AssignRoomToGuild("ST_KLO", GIL_MILITIA);

	Wld_AssignRoomToGuild("WG1", GIL_MILITIA);
	Wld_AssignRoomToGuild("HE2", GIL_MILITIA);

	//Wld_AssignRoomToGuild("HH1", GIL_MILITIA);gesamter Eingangsbereich/ Erdgeschoss und Gallerie des EBR
	Wld_AssignRoomToGuild("HH8", GIL_MILITIA);
	Wld_AssignRoomToGuild("HH4", GIL_MILITIA);

	Wld_AssignRoomToGuild("hütte6", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte7", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte8", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte69", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte70", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte71", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte72", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte12", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte35", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte38", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte51", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte52", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte53", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte57", GIL_WORKER);
	Wld_AssignRoomToGuild("hütte42", GIL_WORKER);
	//Wld_AssignRoomToGuild("hütte43", GIL_WORKER); weil Schreiber Gordian
	//Wld_AssignRoomToGuild("hütte45", GIL_WORKER); weil Händler Ruga

	Wld_AssignRoomToGuild("hütte18", GIL_BEGGAR);
	Wld_AssignRoomToGuild("hütte22", GIL_BEGGAR);
	Wld_AssignRoomToGuild("hütte23", GIL_BEGGAR);
	Wld_AssignRoomToGuild("hütte1", GIL_BEGGAR);

	Wld_AssignRoomToGuild("hütte20", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte25", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte29", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte30", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte33", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte39", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte40", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte46", GIL_THIEF);	// Hütte von Edo (Marktplatz)
	Wld_AssignRoomToGuild("hütte78", GIL_THIEF);
	Wld_AssignRoomToGuild("hütte79", GIL_THIEF);
};

func void STARTUP_DEMONTOWER()
{
	//**************************************************************************************
	//*                               Dämonenbeschwörer                                    *
	//**************************************************************************************

	Wld_InsertNpc(DMC_800_XARDAS, "LOCATION_03_IN");

	// Befüllen der Item-Container
	FillChests_Demontower();
};

func void INIT_DEMONTOWER()
{
};

//**************************************************************************************
//*								FreemineCamp										   *
//**************************************************************************************

func void STARTUP_FREEMINECAMP()
{
};

func void INIT_FREEMINECAMP()
{
};

func void STARTUP_BERGFESTUNG()
{
	Wld_InsertNpc(PAL_1000_Rhobar, WP_DEFAULT); //King
	Wld_InsertNpc(PAL_1001_Hagen, WP_DEFAULT);
	Wld_InsertNpc(PAL_1002_Vardon, WP_DEFAULT);
	Wld_InsertNpc(PAL_1003_Garwog, WP_DEFAULT);
	Wld_InsertNpc(PAL_1004_Wulfgar, WP_DEFAULT);
	Wld_InsertNpc(PAL_1005_Darius, WP_DEFAULT);
	Wld_InsertNpc(PAL_1006_Albin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1007_Garvell, WP_DEFAULT);
	Wld_InsertNpc(PAL_1010_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1011_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1012_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1013_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1014_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1015_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1016_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1017_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1018_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1019_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1020_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1021_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1022_Ulf, WP_DEFAULT);
	Wld_InsertNpc(PAL_1023_Ugor, WP_DEFAULT);
	Wld_InsertNpc(PAL_1024_Leomar, WP_DEFAULT);
	Wld_InsertNpc(PAL_1025_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1026_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1027_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1028_Paladin, WP_DEFAULT);

	Wld_InsertNpc(PAL_1046_Prinzessin, WP_DEFAULT);

	// auf Brücke
	Wld_InsertNpc(PAL_1039_Paladin, WP_DEFAULT);
	Wld_InsertNpc(PAL_1040_Paladin, WP_DEFAULT);

	// hinter Brücke
	Wld_InsertNpc(PAL_1008_Paladin, WP_DEFAULT);	//FK
	Wld_InsertNpc(PAL_1009_Paladin, WP_DEFAULT);	//FK
	Wld_InsertNpc(PAL_1041_Paladin, WP_DEFAULT);	//Turmwache

	//Wachhaus
	Wld_InsertNpc(PAL_1042_Paladin, WP_DEFAULT);	// vor der Tür
	Wld_InsertNpc(PAL_1043_Paladin, WP_DEFAULT);	// im Haus
	Wld_InsertNpc(PAL_1044_Paladin, WP_DEFAULT);	// im Haus

	//Serpentinen
	Wld_InsertNpc(PAL_1045_Paladin, WP_DEFAULT);

	//Feuermagier
	Wld_InsertNpc(PC_Mage, WP_DEFAULT);
	Wld_InsertNpc(KDF_1100_Catmaol, WP_DEFAULT);
	Wld_InsertNpc(KDF_1101_Feoras, WP_DEFAULT);
	Wld_InsertNpc(KDF_1102_Morogh, WP_DEFAULT);
	Wld_InsertNpc(KDF_1103_Nereus, WP_DEFAULT);

	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_Kapitelwechsel(1);
};

func void INIT_BERGFESTUNG()
{
	/**************************************************************
	**                STARTUP_LIGHTS IN BERGFESTUNG **
	**************************************************************/

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(20, 00, "BF_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(05, 00, "BF_FIREPLACE_HIGH2_01", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(20, 01, "BF_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(05, 00, "BF_FIREPLACE_HIGH2_02", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(20, 02, "BF_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(05, 00, "BF_FIREPLACE_HIGH2_03", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(20, 01, "BF_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(05, 01, "BF_FIREPLACE_HIGH2_04", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(20, 00, "BF_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(05, 02, "BF_FIREPLACE_HIGH2_05", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_06", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(20, 02, "BF_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_07", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_08", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_09", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_10", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_11", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_12", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_13", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_14", 0);

	Wld_SetObjectRoutine(00, 00, "BF_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(20, 03, "BF_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(05, 03, "BF_FIREPLACE_HIGH2_15", 0);
};

const string WP_DEFAULT = "OC1";

//*******************************************************************************
//*								Surface											*
//*******************************************************************************
func void STARTUP_SURFACE()
{
	//------------------------------------
	//NSCs
	//------------------------------------
	// wichtig für mission
	Wld_InsertNpc(MIN_307_Pedro, "PATH_OC_FOGTOWER02");

	// Aussenposten Bergfestung
	Wld_InsertNpc(PAL_1031_Auxiliary, WP_DEFAULT);
	Wld_InsertNpc(PAL_1032_Auxiliary, WP_DEFAULT);

	// vor dem Aussentor der Bergfestung
	Wld_InsertNpc(THF_410_Vito, WP_DEFAULT);
	Wld_InsertNpc(THF_411_Tassio, WP_DEFAULT);

	// Aussentor Bergfestung
	Wld_InsertNpc(PAL_1029_Osraed, WP_DEFAULT);	//GuardPassage
	Wld_InsertNpc(PAL_1030_Auxiliary, WP_DEFAULT);	//GuardPassage
	Wld_InsertNpc(PAL_1033_Auxiliary, WP_DEFAULT);	// FK auf Tor
	Wld_InsertNpc(PAL_1034_Auxiliary, WP_DEFAULT);	// FK auf Tor
	Wld_InsertNpc(PAL_1035_Auxiliary, WP_DEFAULT);	// Reserve hinter Tor
	Wld_InsertNpc(PAL_1036_Auxiliary, WP_DEFAULT);	// Reserve hinter Tor
	Wld_InsertNpc(PAL_1037_Auxiliary, WP_DEFAULT);	// Reserve hinter Tor
	Wld_InsertNpc(PAL_1038_Auxiliary, WP_DEFAULT);	// Reserve hinter Tor

	//------------------------------------
	//MONSTER
	//------------------------------------
	// Anmerkung SN: Folgende Monster aus der GOTHIC1-Startup KOMPLETT übernommen:
	//
	// - Meatbug
	// - Scavenger
	// - Molerat
	// - Bloodfly
	// - Wolf
	// - GreenGobbo
	// - Waran
	//
	// Alle anderen Monster müssen bei Bedarf noch aus der GOTHIC1-Startup
	// herauskopiert werden

	//----------------------- UM ALTES LAGER ---------------------------------
	// Erzhöhle vor dem Alten Lager
	Wld_InsertNpc(Molerat, "OW_CAVE1_OREWOLF_4");
	Wld_InsertNpc(Molerat, "OW_CAVE1_OREWOLF_4");
	Wld_InsertNpc(Molerat, "OW_CAVE1_OREWOLF_4");
	Wld_InsertNpc(Molerat, "OW_CAVE1_OREWOLF_4");

	// vor Cavelorns Hütte
	Wld_InsertNpc(Scavenger, "HELPPOINT");
	Wld_InsertNpc(Scavenger, "HELPPOINT");

	// Cavelorns Hütte
	Wld_InsertNpc(Meatbug, "OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc(Meatbug, "OW_SAWHUT_MEATBUG_SPAWN");
	Wld_InsertNpc(GreenGobboSword, "PATH_OC_NC_6");
	Wld_InsertNpc(GreenGobboSword, "PATH_OC_NC_4");

	// Cavelorns Vorratshöhle
	Wld_InsertNpc(Molerat, "OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc(Molerat, "OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc(Molerat, "OW_SAWHUT_MOLERAT_SPAWN01");
	Wld_InsertNpc(Molerat, "OW_SAWHUT_MOLERAT_SPAWN01");

	// hinter Cavelorns Hütte
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_CAVE3_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc(Molerat, "OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc(Molerat, "OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc(Molerat, "OW_MOLERAT_CAVE_SPAWN");
	Wld_InsertNpc(Molerat, "OW_MOLERAT_CAVE_SPAWN");

	//Biberburg
	Wld_InsertNpc(Lurker, "FP_SPAWN_LURKER_BEAVERLODGE_1");
	//Wld_InsertNpc(Lurker, "FP_SPAWN_LURKER_BEAVERLODGE_2");
	//Wld_InsertNpc(Lurker, "FP_SPAWN_LURKER_BEAVERLODGE_3");

	// Sandbank südlich Altes Lager
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY01_SPAWN01");

	// Wald südlich des Alten Lagers
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCA_05_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCA_05_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER01_SPAWN01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OLDWOOD_C3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SHADOWBEAST_NEAR_SHADOW4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOOD1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWOODEND2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_WOOD10_04");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OLDWOOD1_M");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_OCWOOD_OLDMINE3");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_WOODOLDMINE2");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_06_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_WOOD05_01");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_WOOD05_02");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF_08_08");
	Wld_InsertNpc(Wolf, "FP_ROAM_OW_WOLF_08_08");

	// Baum südöstlich des Alten Lagers
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_SPAWN_TREE");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_SPAWN_TREE");

	// Gilbert's Höhle
	Wld_InsertNpc(Sleepingbeast, "FP_SLEEP_OW_SHADOWBEAST_01");

	//nördlich Altes Lager
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_06_04");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_AL_ORC");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_AL_ORC");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_AL_ORC");
	//Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	//Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_06_CAVE_GUARD3");
	Wld_InsertNpc(WRK_205_Ramirez, "OW_HOEHLE_01");
	// Neks Höhle
	Wld_InsertNpc(Molerat, "SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc(Molerat, "SPAWN_OW_SMALLCAVE01_MOLERAT");
	Wld_InsertNpc(Molerat, "SPAWN_OW_SMALLCAVE01_MOLERAT");

	// Flussufer nordwestlich des Alten Lagers
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_03");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGER_PATH_OC_PSI_02");

	// grosser Wald nordwestlich des Alten Lagers (Psiwood)
	Wld_InsertNpc(Scavenger, "SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_NSCAVENGER_04_PSIWOOD4");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHADOW_PSIWOOD_01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_LONE_WALD_OC3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_ENTRANCE_SCAVENGER_OC1_02");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVNEGER_04_PSI3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_NEARSHAD2_PSIWOOD3");
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01"); // werden beide DemonScavanger
	//Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_GOBBOCAVE_03_01");
	Wld_InsertNpc(Molerat, "FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc(Molerat, "FP_ROAM_OW_MOLERAT_04_PSI");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATL__PSIWOOD_01");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATN_PSIWOOD_1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERATT_04_PSI1");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY02_SPAWN01");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_PSIWOOD_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_PSIWOOD_4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_01_OCWOOD1_OCW5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_OC_PSI");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_OC_PSI");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_PATH_WOLF_WOOD");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_PSIWOOD_5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");	//Südteil
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_04_PSI5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_NWOLF_04_PSIWOOD5");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHADOW_PSIWOOD_02");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFL__PSIWOOD_OUT4");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT"); //Norteil
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF_NEARSHAD2_PSIWOOD_OUT");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFK__PSIWOOD_OUT3");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLFK__PSIWOOD_OUT3");

	// kleiner Wald westlich des Alten Lagers
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER03_SPAWN01");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_INWALD_OC2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_PSIWOOD2");
	Wld_InsertNpc(Molerat, "PATH_WALD_OC_MOLERATSPAWN");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT2_WALD_OC1");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Bloodfly, "SPAWN_WALD_OC_BLOODFLY01");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "PATH_WALD_OC_WOLFSPAWN2");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC2");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC3");
	Wld_InsertNpc(Wolf, "SPAWN_OW_WOLF2_WALD_OC3");

	// südlich des alten Lagers
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_05_02");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc(Scavenger, "SPAWN_O_SCAVENGER_OCWOODL2");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_OC_WOOD03");
	Wld_InsertNpc(Waran, "OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_OW_PATH_WARAN05_SPAWN01");

	// Fluss zum Neuen Lager
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_BANDIT_02");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_12");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_12");

	//----------------------- UM NEUES LAGER HERUM -------------------------
	// Weg von Cavelorns Hütte zum Neuem Lager
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(Scavenger, "OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(GreenGobboSword, "OW_GOBBO_PLACE_SPAWN");
	Wld_InsertNpc(GreenGobboSword, "OW_GOBBO_PLACE_SPAWN");

	// Aidans Hütte
	Wld_InsertNpc(Wolf, "OW_PATH_02_SPAWN_HOGEWOLF");
	Wld_InsertNpc(Wolf, "OW_WOODRUIN_FOR_WOLF_SPAWN");

	// Ebene zwischen Aussentor und Aussensee
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Scavenger, "OW_SCAVENGER_COAST_NEWCAMP_SPAWN");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_03_04");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Bloodfly, "OW_BLOODFLY_NEW_COAST_SPAWN");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_NC_03");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_NC_03");

	// jenseitiges Ufer Aussensee
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_LAKE_NC_BLOODFLY_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_WARAN06_SPAWN01");
	Wld_InsertNpc(Waran, "OW_PATH_WARAN05_SPAWN02");

	// Fluss vom Lagersee weg (oberhalb Wasserfall)
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_A_6_NC4");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLYS_152");

	// Fluss vom Lagersee weg (unterhalb Wasserfall)
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(Bloodfly, "SPAWN_OW_BLOODFLY_C3");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(GreenGobboSword, "SPAWN_OW_GOBBO_WATERFALLCAVE_2");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_CAVE1_1");
	Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_CAVE1_1");

	//----------------------- UM SUMPFLAGER HERUM -------------------------
	// Hang/Weg zum Lager runter
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGERPATH_OC_PSI_14");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_OCWALD_PSI_PATH2");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Molerat, "SPAWN_OW_MOLERAT_PSI_PATH7");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLYPATH_OC_PSI_14");
	Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLYPATH_OC_PSI_14");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");
	Wld_InsertNpc(Waran, "FP_ROAM_OW_WARAN_OCWALD_PSI_PATH4");

	// Klippe südlich Sumpflager
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_OW_SCAVENGER_04_02_1");
	Wld_InsertNpc(Scavenger, "SPAWN_SCAVENGEROW_PATH_280");

	// im Sumpf
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI10");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI11");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI13");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI15");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI18");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI19");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI20");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI20");
	Wld_InsertNpc(Swampshark, "PATH_AROUND_PSI21");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY08_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY09_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY10_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY10_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY11_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY12_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY13_SPAWN01");
	Wld_InsertNpc(Bloodfly, "OW_PATH_BLOODFLY13_SPAWN01");

	// Mission Bloodflies im Sumpf
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_HERB_MOVEMENT2");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");
	Wld_InsertNpc(Bloodfly, "PATH_TAKE_BLOODFLY_SPAWN");

	//----------------------- GOBBOHÖHLE ---------------------------------
	// vor der Brücke
	//Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	//Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	//Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	//Wld_InsertNpc(Bloodfly, "SPAWN_BLOODFLY_LOCATION_29_01");
	//Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	//Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");
	//Wld_InsertNpc(Waran, "SPAWN_OW_WARAN_OC_PSI_GOBBOCAVE_01");

	// hinter der Brücke
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");
	//Wld_InsertNpc(GobboDemon, "SPAWN_GOBBO_LOCATION_29_03");

	// in den Höhlen
	Wld_InsertNpc(GobboDemon, "SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc(GobboDemon, "SPAWN_OW_GOBBO_CAVE03INDOOR_05");
	Wld_InsertNpc(GobboDemon, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(GobboDemon, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(GobboDemon, "SPAWN_OW_GOBBO_CAVE03INDOOR_02");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE5");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE5");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE7");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE7");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE8");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE9");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE10");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE10");
	Wld_InsertNpc(GobboDemon, "GOBBO_MASTERCAVE10");

	//------------------------ SHIPWRECK ----------------------------------
	Wld_InsertNpc(Firewaran, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(Firewaran, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(Firewaran, "OW_COAST_SHIPWRECK_WARAN_2");
	Wld_InsertNpc(Firewaran, "OW_COAST_SHIPWRECK_WARAN");
	Wld_InsertNpc(Firewaran, "OW_COAST_SHIPWRECK_WARAN");

	//----------------------- KLOSTERRUINE ---------------------------------
	// Am Strand
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");
	Wld_InsertNpc(Waran, "SPAWN_ROAM_OW_WARAN_RUIN");

	// vor Baumstamm
	Wld_InsertNpc(Snapper, "OW_PATH_ABYSS_4");
	Wld_InsertNpc(Snapper, "OW_PATH_ABYSS_4");

	// hinter Baumstamm
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE02");
	Wld_InsertNpc(Snapper, "OW_MONSTER_NAVIGATE02");
	Wld_InsertNpc(Snapper, "OW_PATH_179");
	Wld_InsertNpc(Snapper, "OW_PATH_179");

	// in der Grabenhöhle unter dem Baumstamm
	Wld_InsertNpc(Snapper, "OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc(Snapper, "OW_ABYSS_SPAWN_WARAN");
	Wld_InsertNpc(Snapper, "SPAWN_ABYSS_TO_CAVE_MOVE");
	Wld_InsertNpc(Snapper, "SPAWN_ABYSS_TO_CAVE_MOVE");

	// Vor der Mauer
	Wld_InsertNpc(Meatbug, "OW_PATH_175_MEATBUG");
	Wld_InsertNpc(Meatbug, "OW_PATH_175_MEATBUG");
	Wld_InsertNpc(Meatbug, "OW_PATH_175_MEATBUG");

	// im Hof
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN01");

	// Höhle vor dem Bonusraum
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");
	Wld_InsertNpc(Snapper, "OW_PATH_SNAPPER04_SPAWN02");

	Wld_InsertNpc(Shadowbeast, "OW_PATH_TEMPELRUIN06");

	//----------------------- STEINKREIS ---------------------------------
	// Höhle auf Bergweg vor Milten
	Wld_InsertNpc(Bloodhound, "OW_PATH_07_15_CAVE3");
	Wld_InsertNpc(Snapper, "OW_PATH_07_15");
	Wld_InsertNpc(Snapper, "OW_PATH_07_15");
	Wld_InsertNpc(Snapper, "OW_PATH_07_15");
	Wld_InsertNpc(Snapper, "OW_PATH_07_15");

	// Bloodhound bei Milten
	Wld_InsertNpc(Bloodhound, "OW_PATH_274");

	//------------------ TROLLSCHLUCHT -------------------------------
	// 1. Gruppe
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_01");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_01");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_01");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_01");

	// 2. Gruppe
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_SHRINKSCROLL");
	Wld_InsertNpc(BlackGobboWarrior, "SPAWN_BLACKGOBBO_SHRINKSCROLL");

	// 3. Gruppe
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_14");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_14");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_14");
	Wld_InsertNpc(BlackGobboWarrior, "LOCATION_12_14");

	// bei der Winde
	Wld_InsertNpc(Troll, "LOCATION_12_14");

	//Fokusplatform
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");
	Wld_InsertNpc(Harpie, "LOCATION_12_09");

	//-------------- NEBELTURM ---------------------------------------
	//1. Raum
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_06");

	//2. Raum
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_SKELETT_SPAWN");
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_09");

	//3. Raum (mit 2. Wendeltreppe nach unten)
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_SKELETT_SPAWN");

	//Stollensystem nach 2. Wendeltreppe
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_16");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_28");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_28");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_23");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_24");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_19");
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_20");

	//Große Höhle nach Stollensystem
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_36");
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_36_MOVEMENT");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_36_MOVEMENT");
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_36_MOVEMENT2");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_36_MOVEMENT2");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_37");
	//Wld_InsertNpc(SkeletonMage_fogtower, "OW_FOGDUNGEON_37");

	//2. Stollensystem hinter großer Höhle
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_40");
	Wld_InsertNpc(SkeletonScout, "OW_FOGDUNGEON_40");
	Wld_InsertNpc(Skeleton, "OW_FOGDUNGEON_43");
	Wld_InsertNpc(SkeletonWarrior, "OW_FOGDUNGEON_43");

	//-------------- ORKGEBIET ---------------------------------------
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");
	Wld_InsertNpc(Wolf, "OW_DEADWOOD_WOLF_SPAWN01");

	//------------------------------------
	//Items
	//------------------------------------
	// Befüllen der Item-Container
	FillChests_Surface();
	FillOre_Surface();

	// wichtige Items MÜSSEN über dieses Skript und NICHT direkt im Spacer in die Welt gesetzt werden!!!
	Wld_InsertItem(ItWr_Nefarius_Diary, "FP_SPAWN_NEFARIUSDIARY");

	Wld_InsertItem(ItMi_Silver, "FP_SPAWN_BEAVERLODGE_GOODIE");
};

func void INIT_SURFACE()
{
	if (Phoenix_State >= 6)
	{
		// Nest des Phoenix (ehemals Gilbert's Höhle)
		Wld_SetObjectRoutine(00, 00, "FIRE_OW_PHOENIX_NEST", 1);
		Wld_SetObjectRoutine(12, 00, "FIRE_OW_PHOENIX_NEST", 1);
		//Wld_SetObjectRoutine(22, 00, "FIRE_OW_PHOENIX_NEST", 1);
	};

	/*
	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_GROUND2_01", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_GROUND2_01", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_GROUND2_01", 0);

	Wld_SetMobRoutine(00, 00, "FIREPLACE", 1);
	Wld_SetMobRoutine(22, 00, "FIREPLACE", 1);
	Wld_SetMobRoutine(05, 00, "FIREPLACE", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH_01", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH_01", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH_01", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH_02", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH_02", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH_02", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH_03", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH_03", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH_03", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_01", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_01", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_02", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_02", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_03", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_03", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_04", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_04", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_05", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_05", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_06", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_06", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_07", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_07", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_08", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_08", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_09", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_09", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_10", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_10", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_11", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_11", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_12", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_12", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_13", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_13", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_14", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_14", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_15", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_15", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_16", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_16", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_16", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_17", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_17", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_17", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_18", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_18", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_18", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_19", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_19", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_19", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_20", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_20", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_20", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_21", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_21", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_21", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_22", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_22", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_22", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_23", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_23", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_23", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_24", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_24", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_24", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_25", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_25", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_25", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_26", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_26", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_26", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_27", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_27", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_27", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_28", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_28", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_29", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_29", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_HIGH2_30", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_HIGH2_30", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_01", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_01", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_01", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_02", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_02", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_02", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_03", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_03", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_03", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_04", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_04", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_04", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_05", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_05", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_05", 0);

	Wld_SetObjectRoutine(00, 00, "OW_FIREPLACE_PCHIGH2_06", 1);
	Wld_SetObjectRoutine(20, 00, "OW_FIREPLACE_PCHIGH2_06", 1);
	Wld_SetObjectRoutine(05, 00, "OW_FIREPLACE_PCHIGH2_06", 0);

	// aus Orc-City
	Wld_SetMobRoutine(00, 00, "FIREPLACE", 1);

	/*************************************************************/
	//PlayVideo("intro25fr.bik");
};

//-------- eigentliche Startup des Spiels --------
func void INIT_WORLD() // wird bei JEDEN Laden des Levels ausgeführt
{
	INIT_Demontower();
	INIT_Newcamp();
	INIT_Psicamp();
	INIT_Freeminecamp();
	INIT_Surface();
	INIT_Oldcamp();
	INIT_Bergfestung();
};

func void STARTUP_WORLD() // wird NUR beim ERSTEN Laden des Levels ausgeführt
{
	Startup_Newcamp();
	Startup_Psicamp();
	Startup_Demontower();
	Startup_Freeminecamp();
	Startup_Surface();
	Startup_Oldcamp();
	Startup_Bergfestung();

	INIT_WORLD();

	//---- SN 13.06.01: Zur Zeit nach Startup_Oldcamp() verlegt ----
	B_InitMonsterAttitudes();
	B_InitGuildAttitudes();
	B_Kapitelwechsel(1);

	//---- Murdernews ----
	int_MurderId1 = 1;
	int_MurderId2 = 2;

	//---- Intro-Video ----
	_ = PlayVideo("INTRO.BIK");
};

/********************************************************
*                                                       *
*												        *
*					ENDE STARTUP WORLD					*
*												        *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*					ENDE STARTUP WORLD					*
*                                                       *
*                                                       *
********************************************************/

func void STARTUP_ORCGRAVEYARD()
{
};

func void INIT_ORCGRAVEYARD()
{
};

func void STARTUP_ORCTEMPEL()
{
};

func void INIT_ORCTEMPEL()
{
};

func void STARTUP_OLDMINE()
{
};

func void INIT_OLDMINE()
{
};

func void STARTUP_FREEMINE()
{
};

func void INIT_FREEMINE()
{
	//-------------------Fackeln-----------------------------
};

/**********************************************************
TESTLEVELS
**********************************************************/
func void INIT_PORTALTEST()
{
};

func void STARTUP_PORTALTEST()
{
	FillOre_Portaltest();
};

/**********************************************************
*                                                         *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE 						      *
*												          *
*						ENDE	 					      *
*												          *
*												          *
**********************************************************/
