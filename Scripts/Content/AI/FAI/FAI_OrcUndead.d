// Nahkampf - AI
// Nahkampf - AI
instance FA_ENEMY_PREHIT_14(C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_JUMPBACK;
	move[3] = MOVE_JUMPBACK;
	move[4] = MOVE_JUMPBACK;
	move[5] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_14(C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_ENEMY_TURNTOHIT_FOCUS_14(C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_MY_W_COMBO_14(C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_RUNTO_14(C_FightAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_14(C_FightAI)
{
	move[0] = MOVE_WAIT;
};

instance FA_MY_W_FOCUS_14(C_FightAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_ATTACK;
	move[4] = MOVE_ATTACK;
	move[5] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_14(C_FightAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_14(C_FightAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_14(C_FightAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_14(C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_G_FOCUS_14(C_FightAI)
{
	//	move[0] = MOVE_TURN;
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_14(C_FightAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_14(C_FightAI)
{
	move[0] = MOVE_RUN;
};

// SN 08.10.00: Die neuen Instanzen wenn Gegner in Fernkampfreichweite und der NSC im Fernkampfmodus ist
instance FA_MY_FK_FOCUS_FAR_14(C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;
};

instance FA_MY_FK_NOFOCUS_FAR_14(C_FightAI)
{
	move[0] = MOVE_TURN;
};
