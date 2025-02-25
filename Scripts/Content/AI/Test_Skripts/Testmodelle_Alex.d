instance OverlayHuman (C_NPC)
{   
	//-------- primary data --------
	
	name =							"OverlayHuman";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3001;

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
	
	Mdl_ApplyOverlayMds (self,"Humans_1hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_1hST2.mds");
	
	Mdl_ApplyOverlayMds (self,"Humans_2hST1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_2hST2.mds");
	
	Mdl_ApplyOverlayMds (self,"Humans_BowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_BowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_CBowT1.mds");
	Mdl_ApplyOverlayMds (self,"Humans_CBowT2.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Acrobatic.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Arrogance.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Militia.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Mage.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Relaxed.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Tired.mds");

	Mdl_ApplyOverlayMds (self,"Humans_drunken.mds");

	Mdl_ApplyOverlayMds (self,"Humans_Swim.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Sprint.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Torch.mds");
	Mdl_ApplyOverlayMds (self,"Humans_Flee.mds");	

};


instance OverlayOrc (C_NPC)
{   
	//-------- primary data	--------
	name[0]						=		"Orc Rockefeller";
	guild						=		GIL_ORCWARRIOR;
	level						=		4;

	//---------	abilities --------
	attribute[ATR_STRENGTH]		=		15;
	attribute[ATR_DEXTERITY]	=		0;
	
	attribute[ATR_HITPOINTS_MAX]=		20;
	attribute[ATR_HITPOINTS]	=		20;

	protection[PROT_EDGE]		=		5;
	protection[PROT_BLUNT]		=		5;
	protection[PROT_POINT]		=		5;
	protection[PROT_FIRE]		=		5;
	protection[PROT_MAGIC]		=		5;


	//-------- visuals --------
	Mdl_SetVisual		(self,"orc.mds");
	Mdl_SetVisualBody	(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_Head", DEFAULT,  DEFAULT,-1);


	
	Mdl_ApplyOverlayMds (self,"Orc_Drunken.mds");
	Mdl_ApplyOverlayMds (self,"Orc_Torch.mds");

};



instance Pos1 (C_NPC)
{   
	//-------- primary data --------
	
	name =							"testbesessener";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3001;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Tired.mds");	// overlay animation file

	//						Body-Mesh				Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	// Textur-Varianten 21+22 von C0 sind Possessed-Gesichter!
	Mdl_SetVisualBody (self,"hum_body_possessed",	0,			0,			"Hum_Head_Bald",	21, 		2,			-1);
};



instance Pos2 (C_NPC)
{   
	//-------- primary data --------
	
	name =							"testbesessener";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3001;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		10;
	attribute[ATR_DEXTERITY] =		7;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	18;
	attribute[ATR_HITPOINTS] =		18;

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,	"Humans_Tired.mds");	// overlay animation file

	//						Body-Mesh				Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	// Textur-Varianten 21+22 von C0 sind Possessed-Gesichter!
	Mdl_SetVisualBody (self,"hum_body_possessed",	0,			0,			"Hum_Head_Bald",	22, 		2,			-1);
};

instance Princess(NPC_DEFAULT)

{
	//-------- primary data --------
	name 						=	"Princess";
	Npctype						=	NPCTYPE_FEMALE;
	guild						=	GIL_AMAZON;
	level						=	35;
	voice						=	16;
	id							=	900;
	flags						=	NPC_FLAG_IMMORTAL;

	//-------- attributes --------
	attribute[ATR_STRENGTH] 	=	200;     
	attribute[ATR_DEXTERITY] 	=	200;     
	attribute[ATR_MANA_MAX] 	=	300;
	attribute[ATR_MANA] 		=	300;
	attribute[ATR_HITPOINTS_MAX]=	900;    
	attribute[ATR_HITPOINTS] 	=	900; 
	aivar[AIV_FEMALE]			=	TRUE;   

	//-------- visuals --------
	Mdl_SetVisual			(self,	"babe.mds");			// basic animation file
	Mdl_SetVisualBody		(self,	"Bab_Body_Princess",		// body mesh
									3,						// body texture variant
									1,						// skin color
									"Bab_Head_Hair1.mms",	// head mesh
									1,						// head texture variant
									0,						// teeth texture variant
									-1);					// armor instance
	B_Scale 				(self);							// body width according to strength of character
	Mdl_SetModelFatness 	(self, 0);						// limb fatness
	
	//-------- talents --------
	// !!!  Keine Waffentalent für Thora, weil sie dann beim Aplien des Overlay.mds die Ani zermatscht
	
	//-------- inventory --------                                    
	
	//------------- ai -------------
	senses						=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	fight_tactic				=	FAI_HUMAN_STRONG; 
	
};

