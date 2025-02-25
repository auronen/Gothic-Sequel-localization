/* 09.08.2001: Neu
Hier werden die Scriptfunktionen definiert, bei denen der SC "früher" mit einem Schulterzucken reagierte

self	= der NSC / MOB der die Funktion aufruft
other	= immer Player
*/

// --------------------------------------------------------------------------------------------------------
// KLAUEN-FUNCs
// --------------------------------------------------------------------------------------------------------
// Nsc hat mich gesehn
func void PLAYER_STEAL_NPC_IS_AWARE()
{
	_ = PrintScreen(_STR_MESSAGE_STEAL_NPC_IS_AWARE, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
	//AI_TurnToNpc(self, other);
};

// Der Spieler hat das Talent noch nicht erlernt
func void PLAYER_STEAL_NO_TALENT()
{
	_ = PrintScreen(_STR_MESSAGE_STEAL_NO_TALENT, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
	AI_PlayAni(self, "T_DONTKNOW");
};

// Spieler ist zu weit entfernt
func void PLAYER_STEAL_NOT_IN_RANGE()
{
	_ = PrintScreen(_STR_MESSAGE_STEAL_NOT_IN_RANGE, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
	AI_PlayAni(self, "T_DONTKNOW");
};

// NSC hat nix im Inventory
func void PLAYER_STEAL_NPC_IS_EMPTY()
{
	_ = PrintScreen(_STR_MESSAGE_STEAL_NPC_IS_EMPTY, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
	AI_PlayAni(self, "T_DONTKNOW");
};

// --------------------------------------------------------------------------------------------------------
// Mob-Benutzung
// --------------------------------------------------------------------------------------------------------

// Kein Schlüssel oder Dietrich
func void PLAYER_MOB_MISSING_KEY_OR_LOCKPICK()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_MISSING_KEY_OR_LOCKPICK, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Hat keinen Schlüssel
func void PLAYER_MOB_MISSING_KEY()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_MISSING_KEY, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Hat keinen Dietrich
func void PLAYER_MOB_MISSING_LOCKPICK()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_MISSING_LOCKPICK, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Krieg ich niemals auf
func void PLAYER_MOB_NEVER_OPEN()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_NEVER_OPEN, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Passendes Interact Item fehlt
func void PLAYER_MOB_MISSING_ITEM()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_MISSING_ITEM, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Wird bereits vom NSC benutzt
func void PLAYER_MOB_ANOTHER_IS_USING()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_ANOTHER_IS_USING, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Bin zu weit weg, um den MOB zu benutzen
func void PLAYER_MOB_TOO_FAR_AWAY()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_TOO_FAR_AWAY, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// Falsche Seite für Benutzung
func void PLAYER_MOB_WRONG_SIDE()
{
	_ = PrintScreen(_STR_MESSAGE_MOBSI_WRONG_SIDE, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// --------------------------------------------------------------------------------------------------------
// Leichen plündern
// --------------------------------------------------------------------------------------------------------
// Wird bereits vom NSC benutzt
func void PLAYER_PLUNDER_IS_EMPTY()
{
	_ = PrintScreen(_STR_MESSAGE_PLUNDER_IS_EMPTY, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};

// --------------------------------------------------------------------------------------------------------
// Leichen plündern
// --------------------------------------------------------------------------------------------------------
func void PLAYER_RANGED_NO_AMMO()
{
	_ = PrintScreen(_STR_MESSAGE_RANGED_NO_AMMO, -1, _YPOS_MESSAGE_REFUSEACTION, FONT_OLD_SMALL, _TIME_MESSAGE_REFUSEACTION);
};
