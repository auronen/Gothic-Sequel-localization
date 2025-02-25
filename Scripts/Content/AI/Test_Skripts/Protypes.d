//*******************************************************************************************
//			AddOn Prototypen

instance APrototype (Npc_Default)
{   
	//-------- primary data --------
	
	name =							"APrototype";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3999;
	


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT,-1);
	
	
	
	//Npc_LearnFightTalent	(self,TAL_1H_SWORD2);	
	
	
	Npc_SetAttitude (self,ATT_HOSTILE);
	
	//-------- inventory --------                                    

	//CreateInvItem (self, ItMw1hSword01);
	//CreateInvItem (self, ItMw1hAxe01);
	//CreateInvItem (self, ItMwPoker01);
		
	// FAI
	
	fight_tactic = FAI_HUMAN_COWARD;
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3999;
	//start_aistate	=	ZS_Stand;
	
	
};


FUNC VOID Rtn_start_3999 ()
{
	TA_Stand	(  0, 0, 12, 0, "TEST1");
	TA_Stand	( 12, 0,  0, 0, "TEST4");
};

instance BPrototype (Npc_Default)
{   
	//-------- primary data --------
	
	name =							"BPrototype";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3998;
	


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =		18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",DEFAULT,DEFAULT,"Hum_Head_Bald", DEFAULT,  DEFAULT,-1);
	
	
	
	//Npc_LearnFightTalent	(self,TAL_1H_SWORD2);	
	
	
	Npc_SetAttitude (self,ATT_HOSTILE);
	
	//-------- inventory --------                                    

	//CreateInvItem (self, ItMw1hSword01);
	//CreateInvItem (self, ItMw1hAxe01);
	//CreateInvItem (self, ItMwPoker01);
		
	// FAI
	
	fight_tactic = FAI_HUMAN_COWARD;
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_30002;
	//start_aistate	=	ZS_Stand;
	
	
};


FUNC VOID Rtn_start_30002 ()
{
	TA_Stand	(  0, 0, 12, 0, "TEST1");
	TA_Stand	( 12, 0,  0, 0, "TEST4");
};