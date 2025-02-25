// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese können	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.

class C_SVM
{
	// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	var string StopMagic;																		// NSC  sieht wie in seiner Nähe gezaubert wird -> er fordert auf, damit aufzuhören!
	var string ISaidStopMagic;																	// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string WeaponDown;																		//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pünten-Stimme etwas	unsicher, trotzdem kernig)
	var string ISaidWeaponDown;																	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	var string WatchYourAim;																	// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Paß auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string WatchYourAimAngry;																// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhören)
	var string WhatAreYouDoing;																	// NSC wird von einem FRIENDLY-SC/NSC geschlagen

	// SC hat Waffe weggesteckt, NSC beendet Kampf
	var string LetsForgetOurLittleFight;														//Friede, kann direkt kommen ( Wenn freundliche kämpfen und der Spieler die Waffe wegsteckt) oder als Reaction über das news-Gedächtnis, sollte daher Zeitneutral sein

	// NSC greift an!
	var string DieMonster;																		// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string DieMOrtalEnemy;																	// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	var string NowWait;																			// NSC hat den SC früher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	var string YouStillNotHaveEnough;															// NSC hat den SC früher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var string YouAskedForIt;																	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurückzugeben, seine Waffe wegzustecken -> "Wer nicht hören will muß fühlen..."
	var string NowWaitIntruder;																	// SC hat einen bewachten Durchgang durchbrochen...

	var string DirtyThief;																		// 1. NSC ertappt den (schwächeren)	SC mit den Fingern in den eigenen Taschen
																								// 2. NSC sieht	wie	der	(schwächere) SC	ein personalisiertes Objekt benutzt	(z.B. Kiste öffnet)
																								// 3. NSC sieht	schwächeren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"

	var string YouAttackedMyCharge;																// SC/NSC greift einen Schützling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string YouKilledOneOfUs;																// Nsc spricht nach zweitem Mord mit SC und greift danach an

	// im Kampf
	var string Dead;																			// Tödlich verletzt
	var string Aargh_1;																			// Treffer kassiert im Kampf
	var string Aargh_2;																			// Treffer kassiert im Kampf
	var string Aargh_3;																			// Treffer kassiert im Kampf

	var string Berzerk;																			// Wahnsinnsschrei im Zustand der Raserei!

	// SC hat NSC niedergeschlagen oder bedroht
	var string YoullBeSorryForThis;																// 1. Nsc die sich einen Diebstahl oder Angriff gemerkt haben (ANGRY) und der Spieler lehnt es ab sich zu entschuldigen.
																								// 2. NSC wurde durch SC besiegt und wacht aus der Ohnmacht auf: 'Das wird	Dir	noch leidtun!'

	var string YesYes;																			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schächer als sein Kontrahent
																								// 2. SC zieht Waffe oder nähert sich mit Waffe und NSC ist schwächer als SC
	// NSC flieht
	var string ShitWhatAMonster;																// NSC flieht vor zu starkem Monster -> "Scheiße, was ein Höllenvieh. Nichts wie weg!"
	var string Help;																			// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch

	// SC wurde von NSC besiegt und wird geplündert
	var string NeverTryThatAgain;																// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string ITookYourOre;																	// NSC plündert bewußtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch. !!! Ist jetzt Silber
	var string ShitNoOre;																		// NSC ärgert sich darüber, daß er beim Durchsuchen eines bewußtlosen/toten Körpers kein Erz gefunden hat! !!! Ist jetzt Silber

	// NSC verwarnt SC
	var string HandsOff;																		// SC manipuliert ein MOB (Drehkreuz, Truhe, Tür) und ein Wächter-NSC sieht das... Wenn NSC nicht FRIENDLY, wird SC sofort azttackiert...
	var string GetOutOfHere;																	// NSC erwischt	schwächeren	SC in seiner Hütte -> ("Raus hier"). SC wird beim Betreten eines verbotenen Portalraums erwischt

	var string WhyAreYouSneaking;																// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?"
																								// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann

	var string GetOutOrICallGuards;																// NSC erwischt stärkeren SC in seiner Hütte -> Raus oder ich ruf die Wachen
	var string WhatDidYouInThere;																// Wache sieht Sc aus einer Hütte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	var string WiseMove;																		// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
																								// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung

	// NSC alarmiert/warnt andere NSCs vor SC
	var string CallGuards;																		// 1. Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!"
																								// 2. Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
																								// 3. Gemüse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.

	var string IntruderAlert;																	// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	var string BehindYou;																		// NSC sieht, wie jemand vom SC bestohlen wird und warnt das Opfer

	// NSC beobachtet Kampf
	var string TheresAFight;																	// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drüben gibt's einen	Kampf"
	var string HeyHeyHey;																		// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	var string CheerFight;																		// NSC ist im Zustand WatchFight: Neutraler	Kämpfer	schlägt irgendeinen Typen. '5 Erz auf den Dicken'
	var string CheerFriend;																		// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	var string Ooh;																				// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'

	// NSC-Gegner flieht
	var string RunCoward;																		// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kämpfer haut	ab
																								// 2. Der Gegner des NSCs flieht
	var string HeDefeatedHim;																	// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var string HeKilledHim;																		// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tötet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlägerei" getötet)

	var string Awake;																			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

	//Grüße
	var string FriendlyGreetings;																// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	var string ALGreetings;																		// FIXME: Ändern oder rauslassen? 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Für Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var string MageGreetings;																	// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	var string SectGreetings;																	// FIXME: Ändern oder rauslassen? 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schläfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	// Lehrer-Kommentare
	var string NoLearnNoPoints;																	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverMax;																	// NSC-Lehrer verbietet Attribut-Steigerung über 100
	var string NoLearnYouAlreadyKnow;															// Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string NoLearnYoureBetter;																// Du bist jetzt schon besser!

	// NSC spricht SC an
	var string HeyYou;																			// z.B. Wache, die den SC im Räumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

	// NSC will nicht reden
	var string NotNow;																			// NSC wird vom SC angesprochen, lehnt aber ein Gespräch ab.

	// SC zu nah
	var string WhatDoYouWant;																	// SC rückt NSC zu dicht auf die Pelle -> "Kann ich was für Dich tun?"
	var string ISaidWhatDoYouWant;																// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"

	// SC im Weg
	var string MakeWay;																			// SC steht	schwächerem NSC im Weg	-> Aufforderung, Platz zu	machen
	var string OutOfMyWay;																		// SC steht stärkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	var string YouDeafOrWhat;																	// SC folgt	nicht der Aufforderung des stärkeren NSCs	-> letzte Warnung, danach Angriff

	// SC spricht NSC an, der ihn besiegt hat
	var string LookingForTroubleAgain;															//Erster Satz eines Dialoges, nachdem der NSC und der SC gekämpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

	// NSC ist schwächer...
	var string WhatsThat;																		// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	var string ThatsMyWeapon;																	// SC trägt	eine Waffe,	die	dem	NSC	gehört -> Folge: ZS_GetBackBelongings
																								// 2. NSC will ein Item	aufheben und wird von einem	stärkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurück

	var string YouDisturbedMySlumber;															// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

	// Angry NSCs kommentieren SC-Aktionen
	var string YouStoleFromMe;																	// Du Sau hast mich beklaut
	var string YouAttackedMe;																	// Sc hat vorher einen Nsc angegriffen. Der ist nun ANGRY und sagt das beim Ansprechen
	var string YouKilledMyFriend;																// Warnung nach ersten Mord des Sc

	//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehört, daß Du Mist gebaut hat...
	var string YouDefeatedMeWell;																//Zu SC	freundlich/neutral:	Du hast	mich ganz schön	geplättet.  FIXME: feststellen, ob sinnvol einsetzbar

	// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufällig zu "Dialogen" zusammengewürfelt werden...
	var string Smalltalk01;																		// ...wenn Du meinst...
	var string Smalltalk02;																		// ...kann schon sein...
	var string Smalltalk03;																		// ...war nicht besonders schlau....
	var string Smalltalk04;																		// ...ich halt mich da lieber raus...
	var string Smalltalk05;																		// ...das ist wirklich nicht mein Problem...
	var string Smalltalk06;																		// ...war doch klar, daß das Ärger gibt...
	var string Smalltalk07;																		// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	var string Smalltalk08;																		// ...das passiert mir nicht nochmal...
	var string Smalltalk09;																		// ...an der Gechichte muß wohl doch was dran sein...
	var string Smalltalk10;																		// ...man muß eben aufpassen was man rumerzählt...
	var string Smalltalk11;																		// ...solange ich damit nichts zu tun habe...
	var string Smalltalk12;																		// ...man darf auch nicht alles glauben, was man hört...
	var string Smalltalk13;																		// ...in seiner Haut will ich trotzdem nicht stecken...
	var string Smalltalk14;																		// ...immer wieder die selbe Leier...
	var string Smalltalk15;																		// ...manche lernen eben garnichts dazu...
	var string Smalltalk16;																		// ...früher wäre das ganz anders gelaufen...
	var string Smalltalk17;																		// ...gequatscht wird viel...
	var string Smalltalk18;																		// ...ich hör nicht mehr auf das Gefasel...
	var string Smalltalk19;																		// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	var string Smalltalk20;																		// ...ich glaube kaum, daß sich daran was ändern wird...
	var string Smalltalk21;																		// ...wahrscheinlich hast Du recht...
	var string Smalltalk22;																		// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	var string Smalltalk23;																		// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	var string Smalltalk24;																		// ...laß uns lieber über was anderes reden...
	var string Om;																				//Ommm(Meditation)

	var string NotEnoughSilver;																	//SC will etwas kaufen und hat nicht genug Geld!

	// Arena-SVMs
	var string YouDisturbedArenaFight;															//Wenn der Spieler einen Arenakampf unterbricht
	var string YouMurderedInArena;																//Wenn der Spieler in der Arena mordet
	var string NoMagicInArena;																	//Wenn der Spieler Magie in der Arena zieht oder benutzt
	var string NoBowInArena;																	//Wenn der Spieler Fernkampfwaffe in der Arena zieht oder benutzt
	var string PointForMe;																		//Wenn der NSC einen anderen Arenakämfper besiegt hat
	var string PointForYou;																		//Wenn der NSC von einem anderen Arenakämpfer besiegt wurde
	var string Buh;																				//empörte Rufe von Zuschauern, wenn der SC eine Arenaregel verletzt (kann auch für andere Empörungen eingesetzt werden)

	//	Waterpipe-Svms --> nur für den Sc
	var string WaterpipeVision1;																// Alle Svms werden randommäßig abgespielt, wenn der Spieler die Wasserpfeife benutzt
	var string WaterpipeVision2;
	var string WaterpipeVision3;
	var string WaterpipeVision4;
	var string WaterpipeVision5;

	//	Neues Mordsystem (ehemals News)
	//var string IWantToRegret;																	// Der Spieler hat einen Wiedergutmachungsauftrag angenommen und ist bei dem Nsc angekommen, der die Wiedergutmachung annimmt
	//var string RegretAccepted;																// Der Spieler kommt zurück, zu einem der vier Freunde, nachdem er den Wiedergutmachungsauftrag erfüllt hat, der Freund gibt hiermit sein ok

	//	Bessessenen Svm
	var string Possessed1;																		// Nur unverständliches Gebrabbel
	var string Possessed2;																		// Variation von unverständlichem Gebrabbel
};

instance SVM_0(C_SVM) // wird nur intern gebraucht...
{
};

// ********************************
// 		Die SVM-Instanzen
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese müssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

prototype SVM_PROTOTYPE_1(C_SVM) 	//Malocher,	Nörgler, Alkoholiker, schimpft über	alles - zieht Kraft aus seinem Hass
{
	StopMagic											= "SVM_1_StopMagic";					//Hör auf mit dieser Magie-Scheiße!
	ISaidStopMagic										= "SVM_1_ISaidStopMagic";				//Willst du Schläge? Hör sofort damit auf!!!
	WeaponDown											= "SVM_1_WeaponDown";					//Steck die Waffe weg!
	ISaidWeaponDown										= "SVM_1_ISaidWeaponDown";				//Steck endlich die Scheißwaffe weg!!
	WatchYourAim										= "SVM_1_WatchYourAim";					//Nimm das Ding runter!!
	WatchYourAimAngry									= "SVM_1_WatchYourAimAngry";			//Wenn du eine aufs Maul willst, ziel ruhig weiter auf mich!
	WhatAreYouDoing										= "SVM_1_WhatAreYouDoing";				//Pass auf! Noch mal und ich verpass dir eine.
	LetsForgetOurLittleFight							= "SVM_1_LetsForgetOurLittleFight";		//Lass uns den kleinen Streit vergessen, okay?
	DieMonster											= "SVM_1_DieMonster";					//Verdammtes Drecksvieh!
	DieMortalEnemy										= "SVM_1_DieMortalEnemy";				//Jetzt musst du dran glauben!
	NowWait												= "SVM_1_NowWait";						//Jetzt gibt's was aufs Maul ...
	YouStillNotHaveEnough								= "SVM_1_YouStillNotHaveEnough";		//Du willst wohl noch eine aufs Maul!
	YouAskedForIt										= "SVM_1_YouAskedForIt";				//Du wolltest so es so haben!
	NowWaitIntruder										= "SVM_1_NowWaitIntruder";				//Jetzt sorg ich dafür, dass du in Einzelteilen hier weggeschafft wirst!
	DirtyThief											= "SVM_1_DirtyThief";					//Ich mach dich fertig, du Dieb!
	YouAttackedMyCharge									= "SVM_1_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Kumpels!
	YouKilledOneOfUs									= "SVM_1_YouKilledOneOfUs";				//Du hast einen von uns platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_1_Dead";							//Aaaaaargl !
	Aargh_1												= "SVM_1_Aargh_1";						//Aargh
	Aargh_2												= "SVM_1_Aargh_2";						//Aargh
	Aargh_3												= "SVM_1_Aargh_3";						//Aargh
	Berzerk												= "SVM_1_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_1_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_1_YesYes";						//Keine Panik! Hast gewonnen!
	ShitWhatAMonster									= "SVM_1_ShitWhatAMonster";				//Scheiße! Nichts wie weg!
	Help												= "SVM_1_Help";							//Verdammt !
	NeverTryThatAgain									= "SVM_1_NeverTryThatAgain";			//Noch einmal und du kannst was erleben.
	ITookYourOre										= "SVM_1_ITookYourOre";					//Danke für das Silber, du Held!
	ShitNoOre											= "SVM_1_ShitNoOre";					//Du arme Wurst, hast ja nicht mal Erz dabei!
	HandsOff											= "SVM_1_HandsOff";						//Flossen weg!
	GetOutOfHere										= "SVM_1_GetOutOfHere";					//Verschwinde hier!
	WhyAreYouSneaking									= "SVM_1_WhyAreYouSneaking";			//Hey du! Was schleichst du da rum.
	GetOutOrICallGuards									= "SVM_1_GetOutOrICallGuards";			//Raus aus meiner Hütte oder ich ruf die Wachen!
	WhatDidYouInThere									= "SVM_1_WhatDidYouInThere";			//Du hast da drinnen nichts verloren! Verschwinde!
	WiseMove											= "SVM_1_WiseMove";						//Kluges Kerlchen!
	CallGuards											= "SVM_1_CallGuards";					//Wachen! Hierher!
	IntruderAlert										= "SVM_1_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_1_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_1_TheresAFight";					//Ah, ein Kampf!
	HeyHeyHey											= "SVM_1_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_1_CheerFight";					//Ihr kämpft wie Frauen!
	CheerFriend											= "SVM_1_CheerFriend";					//Mach ihn alle!!
	Ooh													= "SVM_1_Ooh";							//Schlag doch zurück!
	RunCoward											= "SVM_1_RunCoward";					//Komm zurück, du Feigling!
	HeDefeatedHim										= "SVM_1_HeDefeatedHim";				//Der hat genug!
	HeKilledHim											= "SVM_1_HeKilledHim";					//Warum hast du ihn kaltgemacht? Du bist so gut wie tot!
	Awake												= "SVM_1_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_1_FriendlyGreetings";			//Hallo
	ALGreetings											= "SVM_1_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_1_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_1_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_1_NoLearnNoPoints";				//Komm wieder, wenn du mehr Erfahrung hast.
	NoLearnOverMax										= "SVM_1_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_1_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_1_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_1_HeyYou";						//Hey, du!
	NotNow												= "SVM_1_NotNow";						//Nicht jetzt!
	WhatDoYouWant										= "SVM_1_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_1_ISaidWhatDoYouWant";			//Kann ich irgendwas für dich tun?!
	MakeWay												= "SVM_1_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_1_OutOfMyWay";					//Mach endlich Platz, Mann!
	YouDeafOrWhat										= "SVM_1_YouDeafOrWhat";				//Bist du taub? WEG DA!!
	LookingForTroubleAgain								= "SVM_1_LookingForTroubleAgain";		//Suchst du wieder Streit?
	WhatsThat											= "SVM_1_WhatsThat";					//Was war das denn?
	ThatsMyWeapon										= "SVM_1_ThatsMyWeapon";				//Du rennst mit MEINER Waffe rum!
	YouDisturbedMySlumber								= "SVM_1_YouDisturbedMySlumber";		//Verdammt, warum weckst du mich?
	YouStoleFromMe										= "SVM_1_YouStoleFromMe";				//Du Arsch hast mich beklaut!
	YouAttackedMe										= "SVM_1_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_1_YouKilledMyFriend";			//Einer unserer eigenen Leute hat ins Gras gebissen und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouDefeatedMeWell									= "SVM_1_YouDefeatedMeWell";			//War ein guter Kampf. Du hast mir ganz schön aufs Maul gehauen, Mann!
	Smalltalk01											= "SVM_1_Smalltalk01";					// ... der letzte Scheiß ...
	Smalltalk02											= "SVM_1_Smalltalk02";					// ... kann schon sein, aber wen interessiert das? ...
	Smalltalk03											= "SVM_1_Smalltalk03";					// ... absolut idiotisch ...
	Smalltalk04											= "SVM_1_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_1_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_1_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_1_Smalltalk07";					// ... warum passiert so was immer wieder? ...
	Smalltalk08											= "SVM_1_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_1_Smalltalk09";					// ... an der Geschichte muss doch wohl was dran sein ...
	Smalltalk10											= "SVM_1_Smalltalk10";					// ... nicht so viel quatschen, ja, ja ...
	Smalltalk11											= "SVM_1_Smalltalk11";					// ... so lange ich nichts damit zu tun habe ...
	Smalltalk12											= "SVM_1_Smalltalk12";					// ... man darf auch nicht alles glauben ...
	Smalltalk13											= "SVM_1_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_1_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_1_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_1_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_1_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_1_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_1_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_1_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_1_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_1_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_1_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_1_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_1_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_1_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_1_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_1_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_1_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_1_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_1_PointForMe";					//Punkt für mich!
	Buh													= "SVM_1_Buh";							//BUUHHH !!!!
	NotEnoughSilver										= "SVM_1_NotEnoughSilver";				//Du hast ja garnicht genug Silber, um zu bezahlen!
	Possessed1											= "SVM_1_Possessed1";					//Die Sonne wird den Mond fressen
	Possessed2											= "SVM_1_Possessed2";					//Ein großer Aschtopf wird vom Himmel fallen
};

//SVM_2	// Misstrauisch. Defensiv. Angst in was reingezogen zu werden.

prototype SVM_PROTOTYPE_2(C_SVM) // Misstrauisch
{
	StopMagic											= "SVM_2_StopMagic";					//Keine Magie!
	ISaidStopMagic										= "SVM_2_ISaidStopMagic";				//HEY! Keine Magie, hab' ich gesagt!
	WeaponDown											= "SVM_2_WeaponDown";					//Komm, steck das Ding weg!
	ISaidWeaponDown										= "SVM_2_ISaidWeaponDown";				//Weg mit der Waffe!
	WatchYourAim										= "SVM_2_WatchYourAim";					//Pass auf, wo du hinzielst!
	WatchYourAimAngry									= "SVM_2_WatchYourAimAngry";			//Wenn du weiter auf mich anlegst, muss ich das wohl persönlich nehmen!
	WhatAreYouDoing										= "SVM_2_WhatAreYouDoing";				//Hey, was soll denn das??
	LetsForgetOurLittleFight							= "SVM_2_LetsForgetOurLittleFight";		//Lass uns die Sache vergessen, ok?
	DieMonster											= "SVM_2_DieMonster";					//Schon wieder eins!
	DieMortalEnemy										= "SVM_2_DieMortalEnemy";				//Ich befürchte, ich muss dich beseitigen!
	NowWait												= "SVM_2_NowWait";						//Du bist selbst Schuld!
	YouStillNotHaveEnough								= "SVM_2_YouStillNotHaveEnough";		//Hast du noch nicht genug?
	YouAskedForIt										= "SVM_2_YouAskedForIt";				//Wenn du es unbedingt willst!
	NowWaitIntruder										= "SVM_2_NowWaitIntruder";				//Du weißt doch, dass du hier nichts zu Suchen hast!
	DirtyThief											= "SVM_2_DirtyThief";					//Du hast mich beklaut! Das nehme ich dir echt übel!
	YouAttackedMyCharge									= "SVM_2_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs									= "SVM_2_YouKilledOneOfUs";				//Du hast einen von uns umgebracht! Dafür musst du büßen!
	Dead												= "SVM_2_Dead";							//Aaargl
	Aargh_1												= "SVM_2_Aargh_1";						//Aargh
	Aargh_2												= "SVM_2_Aargh_2";						//Aargh
	Aargh_3												= "SVM_2_Aargh_3";						//Aargh
	Berzerk												= "SVM_2_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_2_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_2_YesYes";						//Langsam, langsam, du hast gewonnen!
	ShitWhatAMonster									= "SVM_2_ShitWhatAMonster";				//Ich - ähm - geh' Hilfe holen!
	Help												= "SVM_2_Help";							//Keine Zeit, ich muss noch was erledigen!
	NeverTryThatAgain									= "SVM_2_NeverTryThatAgain";			//Versuch das nicht noch mal!
	ITookYourOre										= "SVM_2_ITookYourOre";					//Etwas Silber kannst du doch entbehren!
	ShitNoOre											= "SVM_2_ShitNoOre";					//Du hast kein Erz? Scheint heute nicht dein Tag zu sein!
	HandsOff											= "SVM_2_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_2_GetOutOfHere";					//Raus hier!
	WhyAreYouSneaking									= "SVM_2_WhyAreYouSneaking";			//Was schleichst du da rum?
	GetOutOrICallGuards									= "SVM_2_GetOutOrICallGuards";			//Raus aus meiner Hütte oder ich ruf die Wachen!
	WhatDidYouInThere									= "SVM_2_WhatDidYouInThere";			//Bleib aus den Hütten draußen!
	WiseMove											= "SVM_2_WiseMove";						//Die richtige Entscheidung.
	CallGuards											= "SVM_2_CallGuards";					//Wachen, hierher!
	IntruderAlert										= "SVM_2_IntruderAlert";				//ALARM !!!
	BehindYou											= "SVM_2_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_2_TheresAFight";					//Ah, ein Kampf!
	HeyHeyHey											= "SVM_2_HeyHeyHey";					//Ist das alles!
	CheerFight											= "SVM_2_CheerFight";					//Nicht so müde!
	CheerFriend											= "SVM_2_CheerFriend";					//Guter Schlag!
	Ooh													= "SVM_2_Ooh";							//Das tat weh!
	RunCoward											= "SVM_2_RunCoward";					//Bleib hier, du Feigling!
	HeDefeatedHim										= "SVM_2_HeDefeatedHim";				//Der hat genug!
	HeKilledHim											= "SVM_2_HeKilledHim";					//Du hast ihn umgebracht! War das nötig?
	Awake												= "SVM_2_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_2_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_2_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_2_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_2_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_2_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_2_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_2_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_2_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_2_HeyYou";						//Hey, du!
	NotNow												= "SVM_2_NotNow";						//Jetzt nicht.
	WhatDoYouWant										= "SVM_2_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_2_ISaidWhatDoYouWant";			//Kann ich was für dich tun?
	MakeWay												= "SVM_2_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_2_OutOfMyWay";					//Mach Platz!
	YouDeafOrWhat										= "SVM_2_YouDeafOrWhat";				//Verschwinde, sonst lauf ich über dich drüber!
	LookingForTroubleAgain								= "SVM_2_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_2_WhatsThat";					//Was? Wie?
	ThatsMyWeapon										= "SVM_2_ThatsMyWeapon";				//Sieht aus wie meine Waffe, was du da hast!
	YouDisturbedMySlumber								= "SVM_2_YouDisturbedMySlumber";		//Warum weckst du mich?
	YouStoleFromMe										= "SVM_2_YouStoleFromMe";				//Wieso hast du mich beklaut?
	YouAttackedMe										= "SVM_2_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_2_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_2_YouDefeatedMeWell";			//Ja, du hast mich besiegt. War ein guter Kampf! Aber jetzt ist genug!
	Smalltalk01											= "SVM_2_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_2_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_2_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_2_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_2_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_2_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_2_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_2_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_2_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_2_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_2_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_2_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_2_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_2_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_2_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_2_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_2_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_2_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_2_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_2_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_2_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_2_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_2_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_2_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_2_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_2_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_2_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_2_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_2_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_2_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_2_PointForMe";					//Punkt für mich!
	//RegretAccepted									= "SVM_2_RegretAccepted" ;				//Auch wenn es nicht recht war, was Du getan hast, wir brauchen jeden Mann und Deine Buße wird akzeptiert
	NotEnoughSilver										= "SVM_2_NotEnoughSilver";				//Kann es sein, dass du garnicht genug Silber hast?
	Buh													= "SVM_2_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_2_Possessed1";					//Arbeit, Leben, Tod
	Possessed2											= "SVM_2_Possessed2";					//Tod wird gemrntg
};

prototype SVM_PROTOTYPE_3(C_SVM) // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic											= "SVM_3_StopMagic";					//Weg mit der Magie!
	ISaidStopMagic										= "SVM_3_ISaidStopMagic";				//Steck endlich die Magie weg.
	WeaponDown											= "SVM_3_WeaponDown";					//Nimm die Waffe runter!
	ISaidWeaponDown										= "SVM_3_ISaidWeaponDown";				//Ich krieg' schlechte Laune, wenn du weiter mit der Waffe rumfummelst!!
	WatchYourAim										= "SVM_3_WatchYourAim";					//Warum zielst du auf mich?!
	WatchYourAimAngry									= "SVM_3_WatchYourAimAngry";			//Waffe runter, sonst werd ich böse!
	WhatAreYouDoing										= "SVM_3_WhatAreYouDoing";				//Heeeeeey! Was soll der Scheiß??
	LetsForgetOurLittleFight							= "SVM_3_LetsForgetOurLittleFight";		//Nun gut, wir betrachten unsere Auseinandersetzung als Missverständnis.
	DieMonster											= "SVM_3_DieMonster";					//Du Mistvieh nervst mich nicht mehr!
	DieMortalEnemy										= "SVM_3_DieMortalEnemy";				//Gleich hast du's hinter dir!
	NowWait												= "SVM_3_NowWait";						//Ich muss wohl noch deutlicher werden!
	YouStillNotHaveEnough								= "SVM_3_YouStillNotHaveEnough";		//Du hast wohl noch nicht genug!
	YouAskedForIt										= "SVM_3_YouAskedForIt";				//Du wolltest es so!
	NowWaitIntruder										= "SVM_3_NowWaitIntruder";				//Hier hast du nichts zu suchen! Jetzt muss ich dich platt machen!
	DirtyThief											= "SVM_3_DirtyThief";					//Du beklaust mich! Ich glaub' es nicht!
	YouAttackedMyCharge									= "SVM_3_YouAttackedMyCharge";			//Hier kannst du nicht einfach jedem aufs Maul hauen!
	YouKilledOneOfUs									= "SVM_3_YouKilledOneOfUs";				//Du hast einen von uns umgebracht! Das war dein letzter Fehler!
	Dead												= "SVM_3_Dead";							//Aaargl
	Aargh_1												= "SVM_3_Aargh_1";						//Aargh
	Aargh_2												= "SVM_3_Aargh_2";						//Aargh
	Aargh_3												= "SVM_3_Aargh_3";						//Aargh
	Berzerk												= "SVM_3_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_3_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_3_YesYes";						//Du hast gewonnen! Schon gut!
	ShitWhatAMonster									= "SVM_3_ShitWhatAMonster";				//Scheiße! Nichts wie weg!
	Help												= "SVM_3_Help";							//Ich muss weg!
	NeverTryThatAgain									= "SVM_3_NeverTryThatAgain";			//Versuch so was nicht noch mal!
	ITookYourOre										= "SVM_3_ITookYourOre";					//Ich nehme mir noch etwas Silber ...
	ShitNoOre											= "SVM_3_ShitNoOre";					//Kein Erz dabei? Das ist traurig, Mann, echt traurig!
	HandsOff											= "SVM_3_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_3_GetOutOfHere";					//Verzieh dich!
	WhyAreYouSneaking									= "SVM_3_WhyAreYouSneaking";			//Hör auf, hier herumzuschleichen!
	GetOutOrICallGuards									= "SVM_3_GetOutOrICallGuards";			//Verschwinde aus meiner Hütte oder ich rufe die Wachen!
	WhatDidYouInThere									= "SVM_3_WhatDidYouInThere";			//Was machst du da? Wenn ich dich erwische, bist du dran!
	WiseMove											= "SVM_3_WiseMove";						//Du weißt ja doch, was gut für dich ist!
	CallGuards											= "SVM_3_CallGuards";					//Wachen, hierher!
	IntruderAlert										= "SVM_3_IntruderAlert";				//ALARM !!!
	BehindYou											= "SVM_3_BehindYou";					//Pass auf!
	TheresAFight										= "SVM_3_TheresAFight";					//Ein Kampf!
	HeyHeyHey											= "SVM_3_HeyHeyHey";					//Haue !
	CheerFight											= "SVM_3_CheerFight";					//Was wird das denn?
	CheerFriend											= "SVM_3_CheerFriend";					//Guter Schlag!!
	Ooh													= "SVM_3_Ooh";							//Ooooh !
	RunCoward											= "SVM_3_RunCoward";					//Der haut einfach ab!
	HeDefeatedHim										= "SVM_3_HeDefeatedHim";				//Er hat ihn fertig gemacht.
	HeKilledHim											= "SVM_3_HeKilledHim";					//Der bewegt sich nicht mehr. Du hast ihn umgebracht!
	Awake												= "SVM_3_Awake";						//Ein neuer Tag und nichts hat sich geändert ...
	FriendlyGreetings									= "SVM_3_FriendlyGreetings";			//Hey, Mann.
	ALGreetings											= "SVM_3_ALGreetings";					//Für Gomez, ja, ja.
	MageGreetings										= "SVM_3_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_3_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_3_NoLearnNoPoints";				//Du hast nicht genug Erfahrung. Ich kann dir das nicht beibringen!
	NoLearnOverMax										= "SVM_3_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_3_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_3_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_3_HeyYou";						//Hey, du!
	NotNow												= "SVM_3_NotNow";						//Nicht jetzt!
	WhatDoYouWant										= "SVM_3_WhatDoYouWant";				//Willst du was von mir?
	ISaidWhatDoYouWant									= "SVM_3_ISaidWhatDoYouWant";			//Kann ich irgendwas für dich tun?
	MakeWay												= "SVM_3_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_3_OutOfMyWay";					//Mach Platz, Mann!
	YouDeafOrWhat										= "SVM_3_YouDeafOrWhat";				//Wie oft denn noch? Lass mich durch!
	LookingForTroubleAgain								= "SVM_3_LookingForTroubleAgain";		//Willst du dich wieder mit mir anlegen?
	WhatsThat											= "SVM_3_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_3_ThatsMyWeapon";				//Du hast da meine Waffe dabei!
	YouDisturbedMySlumber								= "SVM_3_YouDisturbedMySlumber";		//Warum reißt du mich aus den Träumen?
	YouStoleFromMe										= "SVM_3_YouStoleFromMe";				//Du hast mich bestohlen, du dreckiger Dieb?
	YouAttackedMe										= "SVM_3_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_3_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein klitzekleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_3_YouDefeatedMeWell";			//War ein fairer Kampf! Schwamm drüber, dass du mich umgehauen hast!
	Smalltalk01											= "SVM_3_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_3_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_3_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_3_Smalltalk04";					// ... ich halt' mich da lieber raus ...
	Smalltalk05											= "SVM_3_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_3_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_3_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_3_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_3_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_3_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_3_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_3_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_3_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_3_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_3_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_3_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_3_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_3_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_3_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_3_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_3_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_3_Smalltalk22";					// ... erst mal abwarten. Es wird längst nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_3_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_3_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_3_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_3_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_3_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_3_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_3_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_3_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_3_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_3_NotEnoughSilver";				//Also, wenn du natürlich genug Silber hättest, dann vielleicht!
	Buh													= "SVM_3_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_3_Possessed1";					//Marl Du Mani
	Possessed2											= "SVM_3_Possessed2";					//Barbar Ele farm
};

prototype SVM_PROTOTYPE_4(C_SVM) // Alter Sack, alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic											= "SVM_4_StopMagic";					//Steck lieber die Magie weg!
	ISaidStopMagic										= "SVM_4_ISaidStopMagic";				//Hör besser auf meinen Rat und steck die Magie weg!
	WeaponDown											= "SVM_4_WeaponDown";					//Steck die Waffe weg, wenn du keinen Ärger willst!
	ISaidWeaponDown										= "SVM_4_ISaidWeaponDown";				//Steck schon endlich die Waffe weg!
	WatchYourAim										= "SVM_4_WatchYourAim";					//Pass lieber auf, wo du hinzielst!
	WatchYourAimAngry									= "SVM_4_WatchYourAimAngry";			//Wenn du nicht aufhörst, nehme ich dir das Spielzeug weg!
	WhatAreYouDoing										= "SVM_4_WhatAreYouDoing";				//He da! Pass doch auf!
	LetsForgetOurLittleFight							= "SVM_4_LetsForgetOurLittleFight";		//Vergessen wir unseren kleinen Streit!
	DieMonster											= "SVM_4_DieMonster";					//Egal wie viele man tötet, es werden einfach nicht weniger!
	DieMortalEnemy										= "SVM_4_DieMortalEnemy";				//Älter wirst du nicht mehr!
	NowWait												= "SVM_4_NowWait";						//Ich werde dich lehren, dich mit mir anzulegen ...
	YouStillNotHaveEnough								= "SVM_4_YouStillNotHaveEnough";		//Hast du denn noch nicht genug?
	YouAskedForIt										= "SVM_4_YouAskedForIt";				//Das hast du dir selbst zuzuschreiben!
	NowWaitIntruder										= "SVM_4_NowWaitIntruder";				//Hier einzudringen war sehr dumm von dir!!
	DirtyThief											= "SVM_4_DirtyThief";					//Du hat es gewagt, mich zu bestehlen!
	YouAttackedMyCharge									= "SVM_4_YouAttackedMyCharge";			//Wenn du dich mit uns anlegst, wird dir das nicht gut bekommen.
	YouKilledOneOfUs									= "SVM_4_YouKilledOneOfUs";				//Du hast einen von uns getötet! Dein Leben für seins!
	Dead												= "SVM_4_Dead";							//Aaargl
	Aargh_1												= "SVM_4_Aargh_1";						//Aargh
	Aargh_2												= "SVM_4_Aargh_2";						//Aargh
	Aargh_3												= "SVM_4_Aargh_3";						//Aargh
	Berzerk												= "SVM_4_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_4_YoullBeSorryForThis";			//Das wirst du noch bereuen!
	YesYes												= "SVM_4_YesYes";						//Nicht aufregen, du hast gewonnen!
	ShitWhatAMonster									= "SVM_4_ShitWhatAMonster";				//Schnell weg von hier!
	Help												= "SVM_4_Help";							//Ich bin zu alt für so was!
	NeverTryThatAgain									= "SVM_4_NeverTryThatAgain";			//Versuch das besser nicht noch mal!
	ITookYourOre										= "SVM_4_ITookYourOre";					//Dein Silber ist bei mir in besseren Händen!
	ShitNoOre											= "SVM_4_ShitNoOre";					//Nicht mal ein paar armselige Erz-Nuggets
	HandsOff											= "SVM_4_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_4_GetOutOfHere";					//Verschwinde hier!
	WhyAreYouSneaking									= "SVM_4_WhyAreYouSneaking";			//Hey, du! Was schleichst du da rum.
	GetOutOrICallGuards									= "SVM_4_GetOutOrICallGuards";			//Geh raus, sonst ruf' ich die Wachen!
	WhatDidYouInThere									= "SVM_4_WhatDidYouInThere";			//Was hast du da drinnen getrieben?
	WiseMove											= "SVM_4_WiseMove";						//Da hast du noch mal Glück gehabt.
	CallGuards											= "SVM_4_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_4_IntruderAlert";				//EINDRINGLING !!!
	BehindYou											= "SVM_4_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_4_TheresAFight";					//Schon wieder ein Kampf.
	HeyHeyHey											= "SVM_4_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_4_CheerFight";					//Ist das alles, was ihr draufhabt?!
	CheerFriend											= "SVM_4_CheerFriend";					//Gib's ihm!
	Ooh													= "SVM_4_Ooh";							//Schlag mal zurück!
	RunCoward											= "SVM_4_RunCoward";					//Der Feigling verzieht sich!
	HeDefeatedHim										= "SVM_4_HeDefeatedHim";				//Wir haben damals mehr ausgehalten!
	HeKilledHim											= "SVM_4_HeKilledHim";					//Du hast ihn umgebracht! Das war ein großer Fehler!
	Awake												= "SVM_4_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_4_FriendlyGreetings";			//Sei gegrüßt.
	ALGreetings											= "SVM_4_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_4_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_4_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_4_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_4_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_4_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_4_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_4_HeyYou";						//He da!
	NotNow												= "SVM_4_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_4_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_4_ISaidWhatDoYouWant";			//Willst du was von mir?
	MakeWay												= "SVM_4_MakeWay";						//Lass mich vorbei.
	OutOfMyWay											= "SVM_4_OutOfMyWay";					//Mach schon Platz!
	YouDeafOrWhat										= "SVM_4_YouDeafOrWhat";				//Beiseite, sonst bereust du es!
	LookingForTroubleAgain								= "SVM_4_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_4_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_4_ThatsMyWeapon";				//Rück mal schön meine Waffe wieder raus!
	YouDisturbedMySlumber								= "SVM_4_YouDisturbedMySlumber";		//Ich will schlafen! Komm später wieder.
	YouStoleFromMe										= "SVM_4_YouStoleFromMe";				//Lass bloß die Finger von meinen Sachen, verstanden?
	YouAttackedMe										= "SVM_4_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_4_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_4_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_4_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_4_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_4_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_4_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_4_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_4_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_4_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_4_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_4_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_4_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_4_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_4_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_4_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_4_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_4_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_4_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_4_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_4_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_4_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_4_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_4_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_4_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_4_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_4_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_4_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_4_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_4_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_4_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_4_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_4_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_4_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_4_NotEnoughSilver";				//Glaubst wohl ich seh nicht, dass das nicht genug Silber ist, Junge!
	Buh													= "SVM_4_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_4_Possessed1";					//Ich sehe Regen nach oben fliegen
	Possessed2											= "SVM_4_Possessed2";					//Aaaaarrgh Ha Ha Ha argh
};

prototype SVM_PROTOTYPE_5(C_SVM) //Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic											= "SVM_5_StopMagic";					//Pack mal lieber die Magie weg!
	ISaidStopMagic										= "SVM_5_ISaidStopMagic";				//Wenn ich 'Magie weg' sage, dann mein' ich das auch so!
	WeaponDown											= "SVM_5_WeaponDown";					//Was hast du mit der Waffe vor, Mann!
	ISaidWeaponDown										= "SVM_5_ISaidWeaponDown";				//Komm schon, steck weg, das Ding!
	WatchYourAim										= "SVM_5_WatchYourAim";					//Du zielst auf mich, du Komiker!
	WatchYourAimAngry									= "SVM_5_WatchYourAimAngry";			//Wenn du nicht aufhörst, dann übe ich gleich auch mal mit dir!
	WhatAreYouDoing										= "SVM_5_WhatAreYouDoing";				//Hey, bist du blind oder was?
	LetsForgetOurLittleFight							= "SVM_5_LetsForgetOurLittleFight";		//Den kleinen Streit vergessen wir, okay?
	DieMonster											= "SVM_5_DieMonster";					//Du bist fällig, Mistvieh!
	DieMortalEnemy										= "SVM_5_DieMortalEnemy";				//Jetzt wird abgerechnet!
	NowWait												= "SVM_5_NowWait";						//Du brauchst wohl dringend was hinter die Ohren!
	YouStillNotHaveEnough								= "SVM_5_YouStillNotHaveEnough";		//Hast du immer noch nicht genug?
	YouAskedForIt										= "SVM_5_YouAskedForIt";				//Na gut, du willst es scheinbar so!
	NowWaitIntruder										= "SVM_5_NowWaitIntruder";				//Hier werden sie dich raustragen müssen!
	DirtyThief											= "SVM_5_DirtyThief";					//Du Dieb! Ich bring dir Manieren bei!
	YouAttackedMyCharge									= "SVM_5_YouAttackedMyCharge";			//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs									= "SVM_5_YouKilledOneOfUs";				//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_5_Dead";							//Aaargl
	Aargh_1												= "SVM_5_Aargh_1";						//Aargh
	Aargh_2												= "SVM_5_Aargh_2";						//Aargh
	Aargh_3												= "SVM_5_Aargh_3";						//Aargh
	Berzerk												= "SVM_5_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_5_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_5_YesYes";						//Bleib locker! Hast gewonnen.
	ShitWhatAMonster									= "SVM_5_ShitWhatAMonster";				//Das ist 'ne Nummer zu groß für mich!
	Help												= "SVM_5_Help";							//Verdammt !
	NeverTryThatAgain									= "SVM_5_NeverTryThatAgain";			//Versuch das nicht noch mal!
	ITookYourOre										= "SVM_5_ITookYourOre";					//Ich sorg dafür, dass dein Silber gut angelegt wird!
	ShitNoOre											= "SVM_5_ShitNoOre";					//So ein Pech! Kein Erz!
	HandsOff											= "SVM_5_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_5_GetOutOfHere";					//Raus hier!
	WhyAreYouSneaking									= "SVM_5_WhyAreYouSneaking";			//Weshalb schleichst du hier rum?
	GetOutOrICallGuards									= "SVM_5_GetOutOrICallGuards";			//Raus hier, sonst ruf' ich die Wachen!
	WhatDidYouInThere									= "SVM_5_WhatDidYouInThere";			//Du hast da drinnen nichts verloren!
	WiseMove											= "SVM_5_WiseMove";						//Du lernst schnell!
	CallGuards											= "SVM_5_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_5_IntruderAlert";				//ALARM !!!!
	BehindYou											= "SVM_5_BehindYou";					//Hey, pass auf!
	TheresAFight										= "SVM_5_TheresAFight";					//Ein Kampf!
	HeyHeyHey											= "SVM_5_HeyHeyHey";					//Drauf !
	CheerFight											= "SVM_5_CheerFight";					//Gut so!
	CheerFriend											= "SVM_5_CheerFriend";					//Hau ihn endlich um!
	Ooh													= "SVM_5_Ooh";							//Pass doch auf!
	RunCoward											= "SVM_5_RunCoward";					//Der Typ verdrückt sich!
	HeDefeatedHim										= "SVM_5_HeDefeatedHim";				//Klarer Sieger würde ich sagen!
	HeKilledHim											= "SVM_5_HeKilledHim";					//Einfach einen kalt machen. Du hast jetzt echt ein Problem!
	Awake												= "SVM_5_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_5_FriendlyGreetings";			//Hi Ho Kumpel!
	ALGreetings											= "SVM_5_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_5_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_5_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_5_NoLearnNoPoints";				//So unerfahren, wie du bist, kann ich dir nichts beibringen.
	NoLearnOverMax										= "SVM_5_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_5_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_5_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_5_HeyYou";						//Hey du!
	NotNow												= "SVM_5_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_5_WhatDoYouWant";				//Kann ich dir helfen?
	ISaidWhatDoYouWant									= "SVM_5_ISaidWhatDoYouWant";			//Was willst du?
	MakeWay												= "SVM_5_MakeWay";						//Lass mich mal durch.
	OutOfMyWay											= "SVM_5_OutOfMyWay";					//Komm schon, ich will vorbei!
	YouDeafOrWhat										= "SVM_5_YouDeafOrWhat";				//Bist du taub oder suchst du Streit?
	LookingForTroubleAgain								= "SVM_5_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_5_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_5_ThatsMyWeapon";				//Ich würde es vorziehen, meine Waffe zurückzubekommen!
	YouDisturbedMySlumber								= "SVM_5_YouDisturbedMySlumber";		//Hey, was soll das? Warum weckst du mich?
	YouStoleFromMe										= "SVM_5_YouStoleFromMe";				//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_5_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_5_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_5_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_5_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_5_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_5_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_5_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_5_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_5_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_5_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_5_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_5_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_5_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_5_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_5_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_5_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_5_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_5_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_5_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_5_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_5_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_5_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_5_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_5_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_5_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_5_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_5_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_5_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_5_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_5_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_5_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_5_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_5_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_5_PointForMe";					//Punkt für mich!
	//RegretAccepted									= "SVM_5_RegretAccepted";				//Auch wenn man nicht gut machen kann was Du getan hast, erkenne ich Deinen reinen Willen an.
	NotEnoughSilver										= "SVM_5_NotEnoughSilver";				//Hey, sobald du mit genügend Silber hier anrückst, können wir nochmal drüber reden!
	Buh													= "SVM_5_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_5_Possessed1";					//Sie kamen und sie werden kommen
	Possessed2											= "SVM_5_Possessed2";					//Barga Ha Ha sie sind da
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_6(C_SVM) //Raufbold(Will saufen und raufen(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic											= "SVM_6_StopMagic";					//Hör auf mit der Magie-Scheiße!
	ISaidStopMagic										= "SVM_6_ISaidStopMagic";				//Magie weg! Sofort!!
	WeaponDown											= "SVM_6_WeaponDown";					//Steck die scheiß Waffe weg!
	ISaidWeaponDown										= "SVM_6_ISaidWeaponDown";				//Soll ich dir aufs Maul hauen? Steck das Ding weg!!!
	WatchYourAim										= "SVM_6_WatchYourAim";					//Nimm das Ding runter, oder es passiert was!
	WatchYourAimAngry									= "SVM_6_WatchYourAimAngry";			//Na, ziel ruhig weiter auf mich, wenn du eine aufs Mauls willst!
	WhatAreYouDoing										= "SVM_6_WhatAreYouDoing";				//He! Pass auf!
	LetsForgetOurLittleFight							= "SVM_6_LetsForgetOurLittleFight";		//Hey, Mann! Lass uns den kleinen Streit vergessen, okay?
	DieMonster											= "SVM_6_DieMonster";					//Aus dir mach' ich Gulasch, Drecksvieh!
	DieMortalEnemy										= "SVM_6_DieMortalEnemy";				//Jetzt musst du dran glauben!
	NowWait												= "SVM_6_NowWait";						//Na warte, jetzt gibt's was aufs Maul...
	YouStillNotHaveEnough								= "SVM_6_YouStillNotHaveEnough";		//Du willst wohl noch eine auf's Maul!
	YouAskedForIt										= "SVM_6_YouAskedForIt";				//Du wolltest es so haben!
	NowWaitIntruder										= "SVM_6_NowWaitIntruder";				//Jetzt mach' ich Hackfleisch aus dir!
	DirtyThief											= "SVM_6_DirtyThief";					//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge									= "SVM_6_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs									= "SVM_6_YouKilledOneOfUs";				//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_6_Dead";							//Aaargl
	Aargh_1												= "SVM_6_Aargh_1";						//Aargh
	Aargh_2												= "SVM_6_Aargh_2";						//Aargh
	Aargh_3												= "SVM_6_Aargh_3";						//Aargh
	Berzerk												= "SVM_6_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_6_YoullBeSorryForThis";			//Das wird dir noch leid tun!
	YesYes												= "SVM_6_YesYes";						//Ja, Ja! Keine Panik! Hast gewonnen.
	ShitWhatAMonster									= "SVM_6_ShitWhatAMonster";				//Verdammt, was für ein Vieh! Nichts wie weg!
	Help												= "SVM_6_Help";							//Verdammt !
	NeverTryThatAgain									= "SVM_6_NeverTryThatAgain";			//Noch einmal und du kannst was erleben.
	ITookYourOre										= "SVM_6_ITookYourOre";					//Danke für das Silber, ich trink einen auf dich mit!
	ShitNoOre											= "SVM_6_ShitNoOre";					//Scheiße, nicht mal Erz dabei...
	HandsOff											= "SVM_6_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_6_GetOutOfHere";					//Raus hier!
	WhyAreYouSneaking									= "SVM_6_WhyAreYouSneaking";			//Hey! Was soll das Rumgeschleiche?
	GetOutOrICallGuards									= "SVM_6_GetOutOrICallGuards";			//Geh raus oder ich ruf' die Wachen!
	WhatDidYouInThere									= "SVM_6_WhatDidYouInThere";			//Was hast du da drinnen getrieben?
	WiseMove											= "SVM_6_WiseMove";						//Glück gehabt!
	CallGuards											= "SVM_6_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_6_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_6_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_6_TheresAFight";					//Ah, ein Kampf!
	HeyHeyHey											= "SVM_6_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_6_CheerFight";					//Ihr kämpft wie Frauen!
	CheerFriend											= "SVM_6_CheerFriend";					//Mach ihn alle!!
	Ooh													= "SVM_6_Ooh";							//Lass dir das nicht bieten! Hau ihm auf's Maul!
	RunCoward											= "SVM_6_RunCoward";					//Feigling, komm zurück!
	HeDefeatedHim										= "SVM_6_HeDefeatedHim";				//Der hat genug!
	HeKilledHim											= "SVM_6_HeKilledHim";					//Du bist so gut wie tot! Einfach einen kalt machen.
	Awake												= "SVM_6_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_6_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_6_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_6_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_6_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_6_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_6_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_6_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_6_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_6_HeyYou";						//Hey du!
	NotNow												= "SVM_6_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_6_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_6_ISaidWhatDoYouWant";			//Willst du was von mir?
	MakeWay												= "SVM_6_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_6_OutOfMyWay";					//Komm, geh zur Seite!
	YouDeafOrWhat										= "SVM_6_YouDeafOrWhat";				//Weg da! Oder soll ich's in dich reinprügeln?
	LookingForTroubleAgain								= "SVM_6_LookingForTroubleAgain";		//Willst du wieder Ärger?
	WhatsThat											= "SVM_6_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_6_ThatsMyWeapon";				//Rück mal meine Waffe raus, Witzbold!
	YouDisturbedMySlumber								= "SVM_6_YouDisturbedMySlumber";		//Verdammt, warum weckst du mich?
	YouStoleFromMe										= "SVM_6_YouStoleFromMe";				//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouAttackedMe										= "SVM_6_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_6_YouKilledMyFriend";			//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouDefeatedMeWell									= "SVM_6_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_6_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_6_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_6_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_6_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_6_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_6_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_6_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_6_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_6_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_6_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_6_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_6_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_6_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_6_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_6_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_6_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_6_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_6_Smalltalk18";					// ... hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_6_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_6_Smalltalk20";					// ... glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_6_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_6_Smalltalk22";					// ... erst mal abwarten. Wird nich' so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_6_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_6_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_6_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_6_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_6_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_6_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_6_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_6_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_6_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_6_NotEnoughSilver";				//Willst du mich auf den Arm nehmen??? Das ist nicht genug Silber, das sehe ich doch!
	Buh													= "SVM_6_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_6_Possessed1";					//Das riesen große Tier
	Possessed2											= "SVM_6_Possessed2";					//fällt ineinander
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_7(C_SVM) //Sadist, Aggressiv. Spielt mit seiner Macht.
{
	StopMagic											= "SVM_7_StopMagic";					//Steck das weg! Steck es weg!!
	ISaidStopMagic										= "SVM_7_ISaidStopMagic";				//Die Magie weg, pack sie weg!!
	WeaponDown											= "SVM_7_WeaponDown";					//Weg mit der Waffe, weg damit!
	ISaidWeaponDown										= "SVM_7_ISaidWeaponDown";				//Ich mein's ernst! Weg damit!
	WatchYourAim										= "SVM_7_WatchYourAim";					//Auf mich zielen? Pass auf du!
	WatchYourAimAngry									= "SVM_7_WatchYourAimAngry";			//Willst du mir Angst machen? Ich hab' keine Angst!
	WhatAreYouDoing										= "SVM_7_WhatAreYouDoing";				//Das merk ich mir! Pass auf!
	LetsForgetOurLittleFight							= "SVM_7_LetsForgetOurLittleFight";		//Den Streit vergisst du, okay?
	DieMonster											= "SVM_7_DieMonster";					//Ich zerhack dich, du Mistvieh!
	DieMortalEnemy										= "SVM_7_DieMortalEnemy";				//Jetzt sezier ich dich! Du bist dran! Keine Gnade!
	NowWait												= "SVM_7_NowWait";						//Endlich lieferst du mir einen Grund!
	YouStillNotHaveEnough								= "SVM_7_YouStillNotHaveEnough";		//Du willst es doch wohl nicht noch mal versuchen?
	YouAskedForIt										= "SVM_7_YouAskedForIt";				//Blut! Dein Blut!!
	NowWaitIntruder										= "SVM_7_NowWaitIntruder";				//Ich schneide dich in Streifen!
	DirtyThief											= "SVM_7_DirtyThief";					//Du mieser Dieb! Ich will dich leiden sehen!
	YouAttackedMyCharge									= "SVM_7_YouAttackedMyCharge";			//Wenn hier jemand Prügel austeilt, bin ich das!
	YouKilledOneOfUs									= "SVM_7_YouKilledOneOfUs";				//Du hast einen von uns gekillt!
	Dead												= "SVM_7_Dead";							//Aaargl
	Aargh_1												= "SVM_7_Aargh_1";						//Aargh
	Aargh_2												= "SVM_7_Aargh_2";						//Aargh
	Aargh_3												= "SVM_7_Aargh_3";						//Aargh
	Berzerk												= "SVM_7_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_7_YoullBeSorryForThis";			//Du wirst wenig Zeit haben, das zu bereuen!
	YesYes												= "SVM_7_YesYes";						//Schon gut! Schon gut!
	ShitWhatAMonster									= "SVM_7_ShitWhatAMonster";				//Ich hab' nicht die richtige Waffe. Wir sehen uns ...
	Help												= "SVM_7_Help";							//Verdammt !
	NeverTryThatAgain									= "SVM_7_NeverTryThatAgain";			//Tu das nie wieder!
	ITookYourOre										= "SVM_7_ITookYourOre";					//Lieber würde ich dich umbringen, aber das Silber ist auch nicht schlecht!
	ShitNoOre											= "SVM_7_ShitNoOre";					//Kein Erz? Du nutzloses Stück Dreck!
	HandsOff											= "SVM_7_HandsOff";						//Behalt deine Drecksgriffel bei dir!
	GetOutOfHere										= "SVM_7_GetOutOfHere";					//Verzieh dich! Raus hier!
	WhyAreYouSneaking									= "SVM_7_WhyAreYouSneaking";			//Hey du! Was schleichst du da rum.
	GetOutOrICallGuards									= "SVM_7_GetOutOrICallGuards";			//Verschwinde, sonst ruf ich die Wachen!
	WhatDidYouInThere									= "SVM_7_WhatDidYouInThere";			//Du hast da drinnen nichts zu suchen!
	WiseMove											= "SVM_7_WiseMove";						//Dein Glück! Aber ich hätte dir auch gerne die Fresse poliert!
	CallGuards											= "SVM_7_CallGuards";					//Wachen, zu mir!
	IntruderAlert										= "SVM_7_IntruderAlert";				//ALARM !!
	BehindYou											= "SVM_7_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_7_TheresAFight";					//Ein Kampf!
	HeyHeyHey											= "SVM_7_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_7_CheerFight";					//Ich will Blut sehen!
	CheerFriend											= "SVM_7_CheerFriend";					//Mach ihn fertig!!
	Ooh													= "SVM_7_Ooh";							//Wehr dich, du Flasche!
	RunCoward											= "SVM_7_RunCoward";					//Renn heim zu Mutti!!
	HeDefeatedHim										= "SVM_7_HeDefeatedHim";				//Der hat genug!
	HeKilledHim											= "SVM_7_HeKilledHim";					//Du bist wirklich lebensmüde, vor Zeugen jemanden kaltzumachen.
	Awake												= "SVM_7_Awake";						//Schon wieder aufstehen!
	FriendlyGreetings									= "SVM_7_FriendlyGreetings";			//Hallo
	ALGreetings											= "SVM_7_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_7_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_7_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_7_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_7_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_7_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_7_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_7_HeyYou";						//Hey du!
	NotNow												= "SVM_7_NotNow";						//Nicht jetzt!
	WhatDoYouWant										= "SVM_7_WhatDoYouWant";				//Was willst du von mir?
	ISaidWhatDoYouWant									= "SVM_7_ISaidWhatDoYouWant";			//Kann ich was für dich tun?!
	MakeWay												= "SVM_7_MakeWay";						//Lass mich vorbei.
	OutOfMyWay											= "SVM_7_OutOfMyWay";					//Mach Platz!
	YouDeafOrWhat										= "SVM_7_YouDeafOrWhat";				//Suchst du Streit? Weg da!
	LookingForTroubleAgain								= "SVM_7_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_7_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_7_ThatsMyWeapon";				//Gib mir meine Waffe zurück!
	YouDisturbedMySlumber								= "SVM_7_YouDisturbedMySlumber";		//Warum weckst du mich?
	YouStoleFromMe										= "SVM_7_YouStoleFromMe";				//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouAttackedMe										= "SVM_7_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_7_YouKilledMyFriend";			//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouDefeatedMeWell									= "SVM_7_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_7_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_7_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_7_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_7_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_7_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_7_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_7_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_7_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_7_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_7_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_7_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_7_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_7_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_7_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_7_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_7_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_7_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_7_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_7_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_7_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_7_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_7_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_7_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_7_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_7_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_7_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_7_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_7_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_7_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_7_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_7_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_7_NotEnoughSilver";				//Das ist nicht genug Silber.
	Buh													= "SVM_7_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_7_Possessed1";					//Wo ist der Himmel hingegangen
	Possessed2											= "SVM_7_Possessed2";					//Er war da ! Er war da!
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_8(C_SVM) // Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic											= "SVM_8_StopMagic";					//Keine Zaubereien, in meiner Nähe!
	ISaidStopMagic										= "SVM_8_ISaidStopMagic";				//Aufhören, sag' ich! Sofort!
	WeaponDown											= "SVM_8_WeaponDown";					//Waffe weg!
	ISaidWeaponDown										= "SVM_8_ISaidWeaponDown";				//Steck das Ding weg, oder du bist dran!
	WatchYourAim										= "SVM_8_WatchYourAim";					//Waffe runter, Idiot!
	WatchYourAimAngry									= "SVM_8_WatchYourAimAngry";			//Du Wurm wagst es, auf mich anzulegen?
	WhatAreYouDoing										= "SVM_8_WhatAreYouDoing";				//Pass doch auf!
	LetsForgetOurLittleFight							= "SVM_8_LetsForgetOurLittleFight";		//Gut, vergessen wir unseren kleinen Streit.
	DieMonster											= "SVM_8_DieMonster";					//Lästige Viecher!
	DieMortalEnemy										= "SVM_8_DieMortalEnemy";				//Jetzt stirbst du. Nimm's nicht persönlich!
	NowWait												= "SVM_8_NowWait";						//Du Wurm greifst MICH an! Na warte ...
	YouStillNotHaveEnough								= "SVM_8_YouStillNotHaveEnough";		//hab' ich dich nicht schon mal in den Staub getreten? Auf ein Neues ...
	YouAskedForIt										= "SVM_8_YouAskedForIt";				//Wer nicht hören will, muss fühlen!
	NowWaitIntruder										= "SVM_8_NowWaitIntruder";				//Du wagst es, HIER rumzulaufen? Na warte!
	DirtyThief											= "SVM_8_DirtyThief";					//Das hättest du nicht klauen sollen!
	YouAttackedMyCharge									= "SVM_8_YouAttackedMyCharge";			//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs									= "SVM_8_YouKilledOneOfUs";				//Einen von uns umzubringen war dein letzter Fehler!
	Dead												= "SVM_8_Dead";							//Aaargl
	Aargh_1												= "SVM_8_Aargh_1";						//Aargh
	Aargh_2												= "SVM_8_Aargh_2";						//Aargh
	Aargh_3												= "SVM_8_Aargh_3";						//Aargh
	Berzerk												= "SVM_8_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_8_YoullBeSorryForThis";			//Das wird dir noch sehr Leid tun!
	YesYes												= "SVM_8_YesYes";						//Ganz ruhig. Alles in Ordnung!
	ShitWhatAMonster									= "SVM_8_ShitWhatAMonster";				//Dieses Biest sehe ich mir lieber aus der Entfernung an!
	Help												= "SVM_8_Help";							//Nichts wie weg!
	NeverTryThatAgain									= "SVM_8_NeverTryThatAgain";			//Noch einmal und du bist tot!
	ITookYourOre										= "SVM_8_ITookYourOre";					//Du hast mit heute noch kein Silber gegeben!
	ShitNoOre											= "SVM_8_ShitNoOre";					//Klar, dass ein Verlierer wie du kein Erz hat!
	HandsOff											= "SVM_8_HandsOff";						//Finger weg!
	GetOutOfHere										= "SVM_8_GetOutOfHere";					//Raus hier!
	WhyAreYouSneaking									= "SVM_8_WhyAreYouSneaking";			//Hey du! Was schleichst du da rum.
	GetOutOrICallGuards									= "SVM_8_GetOutOrICallGuards";			//Verschwinde, sonst ruf ich die Wachen!
	WhatDidYouInThere									= "SVM_8_WhatDidYouInThere";			//Was hast du da drinnen getrieben?
	WiseMove											= "SVM_8_WiseMove";						//Da hast du noch mal Glück gehabt.
	CallGuards											= "SVM_8_CallGuards";					//Wachen, hierher!
	IntruderAlert										= "SVM_8_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_8_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_8_TheresAFight";					//Mal sehen, wer da kämpft!
	HeyHeyHey											= "SVM_8_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_8_CheerFight";					//Ja! Weiter, weiter!
	CheerFriend											= "SVM_8_CheerFriend";					//Gut so! Nicht nachlassen!
	Ooh													= "SVM_8_Ooh";							//Lass dir das nicht bieten! Hau ihm aufs Maul!
	RunCoward											= "SVM_8_RunCoward";					//Lass dich hier nicht mehr blicken!
	HeDefeatedHim										= "SVM_8_HeDefeatedHim";				//Langweiliger Kampf!
	HeKilledHim											= "SVM_8_HeKilledHim";					//Das war unnötig. du wirst die Folgen zu tragen haben.
	Awake												= "SVM_8_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_8_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_8_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_8_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_8_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_8_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_8_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_8_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_8_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_8_HeyYou";						//Hey du!
	NotNow												= "SVM_8_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_8_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_8_ISaidWhatDoYouWant";			//Kann ich was für dich tun?
	MakeWay												= "SVM_8_MakeWay";						//Kann ich da mal vorbei?
	OutOfMyWay											= "SVM_8_OutOfMyWay";					//Geh zur Seite!
	YouDeafOrWhat										= "SVM_8_YouDeafOrWhat";				//Soll ich's in dich reinprügeln? Weg da!
	LookingForTroubleAgain								= "SVM_8_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_8_WhatsThat";					//Häh? Was war das?
	ThatsMyWeapon										= "SVM_8_ThatsMyWeapon";				//Du trägst meine Waffe ...?
	YouDisturbedMySlumber								= "SVM_8_YouDisturbedMySlumber";		//Was ist los?
	YouStoleFromMe										= "SVM_8_YouStoleFromMe";				//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_8_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_8_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_8_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_8_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_8_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_8_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_8_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_8_Smalltalk05";					// ... das ist nun wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_8_Smalltalk06";					// ... das war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_8_Smalltalk07";					// ... aber behalt's für dich, ich meine, muss ja nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_8_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_8_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_8_Smalltalk10";					// ... man muss eben aufpassen, was man so rumerzählt ...
	Smalltalk11											= "SVM_8_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_8_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_8_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_8_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_8_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_8_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_8_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_8_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_8_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_8_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_8_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_8_Smalltalk22";					// ... erst mal abwarten. Komm, es wird ja auch nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_8_Smalltalk23";					// ... Ah, ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_8_Smalltalk24";					// ... lass uns lieber über was anderes reden ....
	Om													= "SVM_8_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_8_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_8_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_8_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_8_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_8_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_8_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_8_NotEnoughSilver";				//Kein Silber, keine Ware!
	Buh													= "SVM_8_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_8_Possessed1";					//Jubelt der König ist der König.
	Possessed2											= "SVM_8_Possessed2";					//Huldigt dem Henker.
};

prototype SVM_PROTOTYPE_9(C_SVM) // brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic											= "SVM_9_StopMagic";					//Ich will keine Magie in meiner Nähe!
	ISaidStopMagic										= "SVM_9_ISaidStopMagic";				//Aufhören, sag' ich! Sofort!
	WeaponDown											= "SVM_9_WeaponDown";					//Willst du mich angreifen?
	ISaidWeaponDown										= "SVM_9_ISaidWeaponDown";				//Soll ich dir aufs Maul hauen oder steckst du das Ding weg?
	WatchYourAim										= "SVM_9_WatchYourAim";					//Pass auf, wo du hinzielst!
	WatchYourAimAngry									= "SVM_9_WatchYourAimAngry";			//Pack das Ding weg!
	WhatAreYouDoing										= "SVM_9_WhatAreYouDoing";				//He! Pass auf!
	LetsForgetOurLittleFight							= "SVM_9_LetsForgetOurLittleFight";		//Von mir aus können wir unseren Streit vergessen ...
	DieMonster											= "SVM_9_DieMonster";					//Die Biester sind wirklich saudumm!
	DieMortalEnemy										= "SVM_9_DieMortalEnemy";				//Jetzt musst du dran glauben!
	NowWait												= "SVM_9_NowWait";						//Jetzt wirst du mich kennen lernen!
	YouStillNotHaveEnough								= "SVM_9_YouStillNotHaveEnough";		//Du bist verdammt hartnäckig!
	YouAskedForIt										= "SVM_9_YouAskedForIt";				//Wer nicht hören will, muss fühlen!
	NowWaitIntruder										= "SVM_9_NowWaitIntruder";				//Jetzt mach' ich Hackfleisch aus dir, Eindringling!
	DirtyThief											= "SVM_9_DirtyThief";					//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge									= "SVM_9_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs									= "SVM_9_YouKilledOneOfUs";				//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_9_Dead";							//Aaargl
	Aargh_1												= "SVM_9_Aargh_1";						//Aargh
	Aargh_2												= "SVM_9_Aargh_2";						//Aargh
	Aargh_3												= "SVM_9_Aargh_3";						//Aargh
	Berzerk												= "SVM_9_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_9_YoullBeSorryForThis";			//Du bist schon tot, du weißt es nur noch nicht.
	YesYes												= "SVM_9_YesYes";						//Ganz ruhig. Alles in Ordnung!
	ShitWhatAMonster									= "SVM_9_ShitWhatAMonster";				//Scheiße, was ein Biest!
	Help												= "SVM_9_Help";							//Nichts wie weg!
	NeverTryThatAgain									= "SVM_9_NeverTryThatAgain";			//Beim nächsten Mal werde ich dich umbringen!
	ITookYourOre										= "SVM_9_ITookYourOre";					//Silber! Na das ist doch besser als gar nichts!
	ShitNoOre											= "SVM_9_ShitNoOre";					//Der hat ja nicht mal Erz dabei!
	HandsOff											= "SVM_9_HandsOff";						//Finger weg, Freundchen!
	GetOutOfHere										= "SVM_9_GetOutOfHere";					//Raus hier!
	WhyAreYouSneaking									= "SVM_9_WhyAreYouSneaking";			//Hey du! Was schleichst du da rum.
	GetOutOrICallGuards									= "SVM_9_GetOutOrICallGuards";			//Geh raus oder ich hol die Wachen!
	WhatDidYouInThere									= "SVM_9_WhatDidYouInThere";			//Was hast du da drinnen getrieben?
	WiseMove											= "SVM_9_WiseMove";						//Kluges Köpfchen!
	CallGuards											= "SVM_9_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_9_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_9_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_9_TheresAFight";					//Mal sehen, was die so draufhaben ...
	HeyHeyHey											= "SVM_9_HeyHeyHey";					//Weiter so!
	CheerFight											= "SVM_9_CheerFight";					//Ja! Weiter, weiter!
	CheerFriend											= "SVM_9_CheerFriend";					//Gut so!
	Ooh													= "SVM_9_Ooh";							//Oh, das hat gesessen!
	RunCoward											= "SVM_9_RunCoward";					//Lass dich hier nie wieder blicken!
	HeDefeatedHim										= "SVM_9_HeDefeatedHim";				//Der Kampf ist entschieden.
	HeKilledHim											= "SVM_9_HeKilledHim";					//Das war unnötig. du wirst die Folgen zu tragen haben.
	Awake												= "SVM_9_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_9_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_9_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_9_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_9_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_9_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_9_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_9_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_9_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_9_HeyYou";						//Heh, du!
	NotNow												= "SVM_9_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_9_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_9_ISaidWhatDoYouWant";			//Kann ich dir helfen?!
	MakeWay												= "SVM_9_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_9_OutOfMyWay";					//Geh zur Seite!
	YouDeafOrWhat										= "SVM_9_YouDeafOrWhat";				//Na los, verschwinde schon!
	LookingForTroubleAgain								= "SVM_9_LookingForTroubleAgain";		//Suchst du wieder Streit? Und schon wieder bei mir?
	WhatsThat											= "SVM_9_WhatsThat";					//Was war das denn?
	ThatsMyWeapon										= "SVM_9_ThatsMyWeapon";				//Ich zähl' bis drei, dann hab' ich meine Waffe wieder.
	YouDisturbedMySlumber								= "SVM_9_YouDisturbedMySlumber";		//Was ist los?
	YouStoleFromMe										= "SVM_9_YouStoleFromMe";				//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_9_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_9_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_9_YouDefeatedMeWell";			//Ein guter Kampf. Dein Training hat sich ausgezahlt.
	Smalltalk01											= "SVM_9_Smalltalk01";					// ... ja, wenn du meinst ...
	Smalltalk02											= "SVM_9_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_9_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_9_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_9_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_9_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_9_Smalltalk07";					// ... aber behalt's für dich, muss nicht jeder gleich wissen ...
	Smalltalk08											= "SVM_9_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_9_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_9_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_9_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_9_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_9_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_9_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_9_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_9_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_9_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_9_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_9_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_9_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_9_Smalltalk21";					// ... ja, wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_9_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_9_Smalltalk23";					// ... ich dachte, das wär' schon lange geklärt ...
	Smalltalk24											= "SVM_9_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_9_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_9_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_9_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_9_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_9_NoBowInArena";					//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_9_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_9_PointForMe";					//Punkt für mich!
	//RegretAccepted									= "SVM_9_RegretAccepted";				//Nichts wird die Kampfkraft der Verstorbenen ersetzen, aber Du hast etwas getan um unsere Kampfkraft wieder zu stärken, Du sollst wieder unbescholten sein
	NotEnoughSilver										= "SVM_9_NotEnoughSilver";				//Du musst schon genug Silber haben, damit wir ins Geschäft kommen!
	Buh													= "SVM_9_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_9_Possessed1";					//Freiheit, Freiheit für die Berge !
	Possessed2											= "SVM_9_Possessed2";					//Geht in den Untergrund unter der Burg.
};

prototype SVM_PROTOTYPE_10(C_SVM) // Schlau, verschlagen, heimlich. Zwielichtig, zynisch, intrigant (z.B. Dealer)
{
	StopMagic											= "SVM_10_StopMagic";					//Hör mit der Magie auf!
	ISaidStopMagic										= "SVM_10_ISaidStopMagic";				//Hör sofort damit auf!!!
	WeaponDown											= "SVM_10_WeaponDown";					//Steck die Waffe weg!
	ISaidWeaponDown										= "SVM_10_ISaidWeaponDown";				//Was soll das werden? Willst du dich mit mir anlegen?
	WatchYourAim										= "SVM_10_WatchYourAim";				//Nimm das Ding runter, oder ich sorg' selbst dafür!
	WatchYourAimAngry									= "SVM_10_WatchYourAimAngry";			//Wenn du eins aufs Maul willst, ziel ruhig weiter auf mich!
	WhatAreYouDoing										= "SVM_10_WhatAreYouDoing";				//He! Pass auf! Noch mal und ich verpass' dir eine.
	LetsForgetOurLittleFight							= "SVM_10_LetsForgetOurLittleFight";	//Hey, Mann! Lass uns unseren kleinen Streit von letztens vergessen, okay?
	DieMonster											= "SVM_10_DieMonster";					//Drecksviecher !
	DieMortalEnemy										= "SVM_10_DieMortalEnemy";				//Jetzt musst du dran glauben!
	NowWait												= "SVM_10_NowWait";						//Jetzt rechnen wir ab!
	YouStillNotHaveEnough								= "SVM_10_YouStillNotHaveEnough";		//Du willst wohl noch eine auf's Maul!
	YouAskedForIt										= "SVM_10_YouAskedForIt";				//Du wolltest so es so haben!
	NowWaitIntruder										= "SVM_10_NowWaitIntruder";				//Jetzt mach' ich Hackfleisch aus dir, Eindringling!
	DirtyThief											= "SVM_10_DirtyThief";					//Du Dieb! Ich mach dich fertig!
	YouAttackedMyCharge									= "SVM_10_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs									= "SVM_10_YouKilledOneOfUs";			//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_10_Dead";						//Aaargl
	Aargh_1												= "SVM_10_Aargh_1";						//Aargh
	Aargh_2												= "SVM_10_Aargh_2";						//Aargh
	Aargh_3												= "SVM_10_Aargh_3";						//Aargh
	Berzerk												= "SVM_10_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_10_YoullBeSorryForThis";			//Das wirst du noch zu spüren kriegen! Bastard!
	YesYes												= "SVM_10_YesYes";						//Ja, Ja! Keine Panik! Hast gewonnen.
	ShitWhatAMonster									= "SVM_10_ShitWhatAMonster";			//Was für ein Monstrum, nichts wie weg!
	Help												= "SVM_10_Help";						//Rückzug !
	NeverTryThatAgain									= "SVM_10_NeverTryThatAgain";			//Noch einmal und du kannst was erleben.
	ITookYourOre										= "SVM_10_ITookYourOre";				//Ich nehm' mir mal etwas von deinem Silber!
	ShitNoOre											= "SVM_10_ShitNoOre";					//Kein Erz dabei, Mist!
	HandsOff											= "SVM_10_HandsOff";					//Du Ratte! Finger weg!
	GetOutOfHere										= "SVM_10_GetOutOfHere";				//Raus hier!
	WhyAreYouSneaking									= "SVM_10_WhyAreYouSneaking";			//Hey, du! Was schleichst du da rum?
	GetOutOrICallGuards									= "SVM_10_GetOutOrICallGuards";			//Raus oder ich rufe die Wachen!
	WhatDidYouInThere									= "SVM_10_WhatDidYouInThere";			//Was hast du da drinnen getrieben?
	WiseMove											= "SVM_10_WiseMove";					//Da hast du noch mal Glück gehabt.
	CallGuards											= "SVM_10_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_10_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_10_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_10_TheresAFight";				//Ah, ein Kampf!
	HeyHeyHey											= "SVM_10_HeyHeyHey";					//Fester !
	CheerFight											= "SVM_10_CheerFight";					//Keine Gnade!
	CheerFriend											= "SVM_10_CheerFriend";					//Mach ihn alle!!
	Ooh													= "SVM_10_Ooh";							//Lass dir das nicht bieten!
	RunCoward											= "SVM_10_RunCoward";					//Feigling, komm zurück!
	HeDefeatedHim										= "SVM_10_HeDefeatedHim";				//Ein kleiner Windstoß und er wäre von alleine umgefallen.
	HeKilledHim											= "SVM_10_HeKilledHim";					//Du bist so gut wie tot! Einfach einen kalt machen.
	Awake												= "SVM_10_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_10_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_10_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_10_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_10_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_10_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_10_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_10_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_10_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_10_HeyYou";						//Heh, du!
	NotNow												= "SVM_10_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_10_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_10_ISaidWhatDoYouWant";			//Kann ich dir helfen?
	MakeWay												= "SVM_10_MakeWay";						//Lass mich mal durch.
	OutOfMyWay											= "SVM_10_OutOfMyWay";					//Mach Platz!
	YouDeafOrWhat										= "SVM_10_YouDeafOrWhat";				//Soll ich's in dich reinprügeln? Weg da!
	LookingForTroubleAgain								= "SVM_10_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_10_WhatsThat";					//Was war das denn?
	ThatsMyWeapon										= "SVM_10_ThatsMyWeapon";				//Rück meine Waffe raus.
	YouDisturbedMySlumber								= "SVM_10_YouDisturbedMySlumber";		//Warum weckst du mich?
	YouStoleFromMe										= "SVM_10_YouStoleFromMe";				//Versuch das nicht noch mal, du Dieb!
	YouAttackedMe										= "SVM_10_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_10_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_10_YouDefeatedMeWell";			//Alle Achtung! Du hast mich sauber besiegt. War ein guter Kampf.
	Smalltalk01											= "SVM_10_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_10_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_10_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_10_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_10_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_10_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_10_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_10_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_10_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_10_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_10_Smalltalk11";					// ... solange ich nichts damit zu tun habe ...
	Smalltalk12											= "SVM_10_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_10_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_10_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_10_Smalltalk15";					// ... manche lernen aber gar nichts dazu ...
	Smalltalk16											= "SVM_10_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_10_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_10_Smalltalk18";					// ... ich höre nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_10_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_10_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_10_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_10_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_10_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_10_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_10_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_10_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_10_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_10_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_10_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_10_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_10_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_10_NotEnoughSilver";				//So läuft das nicht! Erst seh ich das Silber, dann siehst du deine Ware!
	Buh													= "SVM_10_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_10_Possessed1";					//Seht denn ihr seid blind.
	Possessed2											= "SVM_10_Possessed2";					//Hört und ihr werdet hören
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_11(C_SVM) //Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic											= "SVM_11_StopMagic";					//Keine Zaubereien in meiner Nähe!
	ISaidStopMagic										= "SVM_11_ISaidStopMagic";				//Aufhören, sag' ich! Sofort!
	WeaponDown											= "SVM_11_WeaponDown";					//Wenn du Streit suchst, komm ruhig näher!
	ISaidWeaponDown										= "SVM_11_ISaidWeaponDown";				//Steck das Ding weg, oder du bist dran!
	WatchYourAim										= "SVM_11_WatchYourAim";				//Nimm das Ding runter!
	WatchYourAimAngry									= "SVM_11_WatchYourAimAngry";			//Du willst dich also mit mir anlegen? Bist du sicher?
	WhatAreYouDoing										= "SVM_11_WhatAreYouDoing";				//Was machst du! Lass das!
	LetsForgetOurLittleFight							= "SVM_11_LetsForgetOurLittleFight";	//Gut, vergessen wir unseren kleinen Streit.
	DieMonster											= "SVM_11_DieMonster";					//Die werden aussterben, wenn sie mir ständig über den Weg laufen!
	DieMortalEnemy										= "SVM_11_DieMortalEnemy";				//Wer sich Todfeinde macht, muss auch damit umgehen können, stirb.
	NowWait												= "SVM_11_NowWait";						//Das hättest du nicht tun sollen!
	YouStillNotHaveEnough								= "SVM_11_YouStillNotHaveEnough";		//Hab' ich dich nicht schon mal in den Staub getreten? Auf ein Neues ...
	YouAskedForIt										= "SVM_11_YouAskedForIt";				//Wer nicht hören will, muss fühlen!
	NowWaitIntruder										= "SVM_11_NowWaitIntruder";				//He Eindringling. Nun kommt deine Lektion!
	DirtyThief											= "SVM_11_DirtyThief";					//Diebstahl lohnt nicht!
	YouAttackedMyCharge									= "SVM_11_YouAttackedMyCharge";			//Du bringst Unruhe in meinen Bereich! Jetzt muss ich dich fertig machen!
	YouKilledOneOfUs									= "SVM_11_YouKilledOneOfUs";			//Einen von uns umzubringen war dein letzter Fehler!
	Dead												= "SVM_11_Dead";						//Aaargl
	Aargh_1												= "SVM_11_Aargh_1";						//Aargh
	Aargh_2												= "SVM_11_Aargh_2";						//Aargh
	Aargh_3												= "SVM_11_Aargh_3";						//Aargh
	Berzerk												= "SVM_11_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_11_YoullBeSorryForThis";			//Das hättest du besser nicht getan!
	YesYes												= "SVM_11_YesYes";						//Schon gut! Du hast ja gewonnen!
	ShitWhatAMonster									= "SVM_11_ShitWhatAMonster";			//Dieses Vieh ist eine Nummer zu groß für mich!
	Help												= "SVM_11_Help";						//Rückzug !
	NeverTryThatAgain									= "SVM_11_NeverTryThatAgain";			//Versuch das nicht noch einmal!
	ITookYourOre										= "SVM_11_ITookYourOre";				//Nett, dass du mir etwas von deinem Silber überlässt!
	ShitNoOre											= "SVM_11_ShitNoOre";					//Fehlanzeige, kein Erz!
	HandsOff											= "SVM_11_HandsOff";					//Nimm deine Griffel weg!
	GetOutOfHere										= "SVM_11_GetOutOfHere";				//Raus hier, sonst mach' ich dir Beine!
	WhyAreYouSneaking									= "SVM_11_WhyAreYouSneaking";			//Was wird das denn, wenn's fertig ist?
	GetOutOrICallGuards									= "SVM_11_GetOutOrICallGuards";			//Die Hütte gehört mir. Raus oder ich ruf die Wachen!
	WhatDidYouInThere									= "SVM_11_WhatDidYouInThere";			//Was wolltest du da drin? Verschwinde, bevor ich mich mit dir beschäftige!
	WiseMove											= "SVM_11_WiseMove";					//Gut! Mach das nicht noch mal!
	CallGuards											= "SVM_11_CallGuards";					//Wachen, hier her!
	IntruderAlert										= "SVM_11_IntruderAlert";				//ALARM!!! EINDRINGLING!!!
	BehindYou											= "SVM_11_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_11_TheresAFight";				//Mal sehen, wer diesmal gewinnt!
	HeyHeyHey											= "SVM_11_HeyHeyHey";					//Na los, mach schon!
	CheerFight											= "SVM_11_CheerFight";					//Hör auf, mit ihm zu spielen!
	CheerFriend											= "SVM_11_CheerFriend";					//Na, mit dem wirst du doch wohl noch fertig!
	Ooh													= "SVM_11_Ooh";							//Ouh! Nicht gut!
	RunCoward											= "SVM_11_RunCoward";					//Lass dich hier nie mehr blicken!
	HeDefeatedHim										= "SVM_11_HeDefeatedHim";				//Der hat gesessen!
	HeKilledHim											= "SVM_11_HeKilledHim";					//Du hast ihn getötet! Das gibt großen Ärger!
	Awake												= "SVM_11_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_11_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_11_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_11_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_11_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_11_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_11_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_11_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_11_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_11_HeyYou";						//Heh, du!
	NotNow												= "SVM_11_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_11_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_11_ISaidWhatDoYouWant";			//Kann ich was für dich tun?
	MakeWay												= "SVM_11_MakeWay";						//Kann ich da mal vorbei?
	OutOfMyWay											= "SVM_11_OutOfMyWay";					//Geh zur Seite!
	YouDeafOrWhat										= "SVM_11_YouDeafOrWhat";				//Soll ich's in dich reinprügeln? Weg da!
	LookingForTroubleAgain								= "SVM_11_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_11_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_11_ThatsMyWeapon";				//Du trägst meine Waffe ... ?
	YouDisturbedMySlumber								= "SVM_11_YouDisturbedMySlumber";		//Was ist denn los?
	YouStoleFromMe										= "SVM_11_YouStoleFromMe";				//Du wagst es, mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_11_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_11_YouKilledMyFriend";			//Du hast die Regel Nr.1 gebrochen! Kein Töten!
	YouDefeatedMeWell									= "SVM_11_YouDefeatedMeWell";			//Das war ein guter Kampf. Die Schmerzen werde ich noch tagelang spüren. Aber jetzt ist gut!
	Smalltalk01											= "SVM_11_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_11_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_11_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_11_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_11_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_11_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_11_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_11_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_11_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_11_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_11_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_11_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_11_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_11_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_11_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_11_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_11_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_11_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_11_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_11_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_11_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_11_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_11_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_11_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_11_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_11_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_11_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_11_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_11_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_11_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_11_PointForMe";					//Punkt für mich!
	//RegretAccepted									= "SVM_11_RegretAccepted";				//Du hast gezeigt das es Dir ernst ist, Dein Verhalten ungeschehen zu machen
	NotEnoughSilver										= "SVM_11_NotEnoughSilver";				//Ware nur gegen Silber... gegen AUSREICHEND Silber!
	Buh													= "SVM_11_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_11_Possessed1";					//Die Horden kommen, die Horden kommen.
	Possessed2											= "SVM_11_Possessed2";					//Seht den Höllenfürsten
};

prototype SVM_PROTOTYPE_12(C_SVM) //Bazaar-Händler		Nach außen freundlich, jovial. Innen raffgierig. Redet gern und viel. Versucht andere zu belabern
{
	StopMagic											= "SVM_12_StopMagic";					//Pack die Magie weg!
	ISaidStopMagic										= "SVM_12_ISaidStopMagic";				//Wenn ich 'Magie weg' sage, dann mein' ich das auch so!
	WeaponDown											= "SVM_12_WeaponDown";					//Was hast du mit der Waffe vor, Mann!
	ISaidWeaponDown										= "SVM_12_ISaidWeaponDown";				//Steck weg, das Ding!
	WatchYourAim										= "SVM_12_WatchYourAim";				//Du zielst auf mich!
	WatchYourAimAngry									= "SVM_12_WatchYourAimAngry";			//Wenn du nicht aufhörst, gibt's Ärger!
	WhatAreYouDoing										= "SVM_12_WhatAreYouDoing";				//Hey, bist du blind oder was?
	LetsForgetOurLittleFight							= "SVM_12_LetsForgetOurLittleFight";	//Den kleinen Streit vergessen wir, okay?
	DieMonster											= "SVM_12_DieMonster";					//Du bist fällig, Mistvieh!!
	DieMortalEnemy										= "SVM_12_DieMortalEnemy";				//Jetzt wird abgerechnet!
	NowWait												= "SVM_12_NowWait";						//Du brauchst wohl dringend was hinter die Ohren!
	YouStillNotHaveEnough								= "SVM_12_YouStillNotHaveEnough";		//Hast du immer noch nicht genug?
	YouAskedForIt										= "SVM_12_YouAskedForIt";				//Na gut, du willst es scheinbar so!
	NowWaitIntruder										= "SVM_12_NowWaitIntruder";				//Hier werden sie dich raustragen müssen!
	DirtyThief											= "SVM_12_DirtyThief";					//Du Dieb! Ich bring' dir Manieren bei!
	YouAttackedMyCharge									= "SVM_12_YouAttackedMyCharge";			//Niemand vergreift sich ungestraft an meinen Jungs!
	YouKilledOneOfUs									= "SVM_12_YouKilledOneOfUs";			//Du hast einen meiner Jungs platt gemacht. Jetzt mach' ich DICH platt!
	Dead												= "SVM_12_Dead";						//Aaargl
	Aargh_1												= "SVM_12_Aargh_1";						//Aargh
	Aargh_2												= "SVM_12_Aargh_2";						//Aargh
	Aargh_3												= "SVM_12_Aargh_3";						//Aargh
	Berzerk												= "SVM_12_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_12_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_12_YesYes";						//Bleib locker! Hast gewonnen.
	ShitWhatAMonster									= "SVM_12_ShitWhatAMonster";			//Das ist 'ne Nummer zu groß! Ich hau ab!
	Help												= "SVM_12_Help";						//Verdammt !
	NeverTryThatAgain									= "SVM_12_NeverTryThatAgain";			//Versuch das nicht noch mal!
	ITookYourOre										= "SVM_12_ITookYourOre";				//Ich sorg dafür, dass dein Silber gut angelegt wird!
	ShitNoOre											= "SVM_12_ShitNoOre";					//Mist! Kein Erz!
	HandsOff											= "SVM_12_HandsOff";					//Finger weg!
	GetOutOfHere										= "SVM_12_GetOutOfHere";				//Raus hier!
	WhyAreYouSneaking									= "SVM_12_WhyAreYouSneaking";			//Weshalb schleichst du hier rum?
	GetOutOrICallGuards									= "SVM_12_GetOutOrICallGuards";			//Raus hier, sonst rufe ich die Wachen!
	WhatDidYouInThere									= "SVM_12_WhatDidYouInThere";			//Du hast da drinnen nichts verloren!
	WiseMove											= "SVM_12_WiseMove";					//Du lernst schnell!
	CallGuards											= "SVM_12_CallGuards";					//Wachen, hierher!
	IntruderAlert										= "SVM_12_IntruderAlert";				//ALARM !!!!
	BehindYou											= "SVM_12_BehindYou";					//Hey, pass auf!
	TheresAFight										= "SVM_12_TheresAFight";				//Ein Kampf!
	HeyHeyHey											= "SVM_12_HeyHeyHey";					//Drauf !
	CheerFight											= "SVM_12_CheerFight";					//Gut so!
	CheerFriend											= "SVM_12_CheerFriend";					//Hau ihn endlich um!
	Ooh													= "SVM_12_Ooh";							//Pass doch auf!
	RunCoward											= "SVM_12_RunCoward";					//Der Typ verdrückt sich!
	HeDefeatedHim										= "SVM_12_HeDefeatedHim";				//Klarer Sieger, würde ich sagen!
	HeKilledHim											= "SVM_12_HeKilledHim";					//Einfach einen kaltmachen. Du hast jetzt echt ein Problem!
	Awake												= "SVM_12_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_12_FriendlyGreetings";			//Hallo, Freund!
	ALGreetings											= "SVM_12_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_12_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_12_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_12_NoLearnNoPoints";				//So unerfahren, wie du bist, kann ich dir nichts beibringen.
	NoLearnOverMax										= "SVM_12_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_12_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_12_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_12_HeyYou";						//Hey du!
	NotNow												= "SVM_12_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_12_WhatDoYouWant";				//Kann ich dir helfen?
	ISaidWhatDoYouWant									= "SVM_12_ISaidWhatDoYouWant";			//Was willst du?
	MakeWay												= "SVM_12_MakeWay";						//Lass mich mal durch.
	OutOfMyWay											= "SVM_12_OutOfMyWay";					//Na los, lass mich vorbei!
	YouDeafOrWhat										= "SVM_12_YouDeafOrWhat";				//Bist du taub oder suchst du Streit?
	LookingForTroubleAgain								= "SVM_12_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_12_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_12_ThatsMyWeapon";				//Ich würde es vorziehen, meine Waffe zurückzubekommen!
	YouDisturbedMySlumber								= "SVM_12_YouDisturbedMySlumber";		//Hm, was soll denn das? Warum weckst du mich?
	YouStoleFromMe										= "SVM_12_YouStoleFromMe";				//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_12_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_12_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_12_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_12_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_12_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_12_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_12_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_12_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_12_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_12_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_12_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_12_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_12_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_12_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_12_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_12_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_12_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_12_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_12_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_12_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_12_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_12_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_12_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird  ...
	Smalltalk21											= "SVM_12_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_12_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_12_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_12_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_12_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_12_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_12_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_12_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_12_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_12_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_12_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_12_NotEnoughSilver";				//Also hör mal zu, du musst schon ein bischen entgegenkommend sein. Du kannst nicht einfach mit zu wenig Silber hier ankommen. Du verstehst das, da bin ich mir sicher!
	Buh													= "SVM_12_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_12_Possessed1";					//Ich habe alles Wissen der Welt verstanden
	Possessed2											= "SVM_12_Possessed2";					//Und ich werde es Dir lehren
};

prototype SVM_PROTOTYPE_13(C_SVM) // Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7, aber klarer, Ruhm-und-Ehre-Typ, Mitläufer
{
	StopMagic											= "SVM_13_StopMagic";					//Steck die Magie weg!
	ISaidStopMagic										= "SVM_13_ISaidStopMagic";				//Pack sie weg, WEG!!
	WeaponDown											= "SVM_13_WeaponDown";					//Die Waffe weg!
	ISaidWeaponDown										= "SVM_13_ISaidWeaponDown";				//Weg mit der Waffe!
	WatchYourAim										= "SVM_13_WatchYourAim";				//Auf mich zielen? Pass auf du!
	WatchYourAimAngry									= "SVM_13_WatchYourAimAngry";			//Du bist auf dem besten Wege zu sterben. Ziel gefälligst woanders hin!
	WhatAreYouDoing										= "SVM_13_WhatAreYouDoing";				//Was soll das werden?!
	LetsForgetOurLittleFight							= "SVM_13_LetsForgetOurLittleFight";	//Den Streit vergessen wir, okay?
	DieMonster											= "SVM_13_DieMonster";					//Heute Abend gibt es Fleisch!
	DieMortalEnemy										= "SVM_13_DieMortalEnemy";				//Du bist dran! Keine Gnade!
	NowWait												= "SVM_13_NowWait";						//Das gibt Prügel ...
	YouStillNotHaveEnough								= "SVM_13_YouStillNotHaveEnough";		//Du willst es doch wohl nicht noch mal versuchen?
	YouAskedForIt										= "SVM_13_YouAskedForIt";				//Du wolltest es so!
	NowWaitIntruder										= "SVM_13_NowWaitIntruder";				//Jetzt gehts dir an den Kragen, Eindringling!
	DirtyThief											= "SVM_13_DirtyThief";					//Dreckiger Dieb! Ich werde dir die Hände brechen ...
	YouAttackedMyCharge									= "SVM_13_YouAttackedMyCharge";			//Wenn hier jemand Prügel austeilt, bin ich das!
	YouKilledOneOfUs									= "SVM_13_YouKilledOneOfUs";			//Du hast einen von uns gekillt!
	Dead												= "SVM_13_Dead";						//Aaargl
	Aargh_1												= "SVM_13_Aargh_1";						//Aargh
	Aargh_2												= "SVM_13_Aargh_2";						//Aargh
	Aargh_3												= "SVM_13_Aargh_3";						//Aargh
	Berzerk												= "SVM_13_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_13_YoullBeSorryForThis";			//Du wirst wenig Zeit haben, das zu bereuen!
	YesYes												= "SVM_13_YesYes";						//Kein Problem, es gibt kein Problem!
	ShitWhatAMonster									= "SVM_13_ShitWhatAMonster";			//Ich hab' nicht die richtige Waffe. Wir sehen uns ...
	Help												= "SVM_13_Help";						//Woooooaaahhh! Weg hier!
	NeverTryThatAgain									= "SVM_13_NeverTryThatAgain";			//Beim nächsten Mal bring ich dich um!
	ITookYourOre										= "SVM_13_ITookYourOre";				//Du hast bestimmt nichts dagegen, wenn ich etwas Silber behalte.
	ShitNoOre											= "SVM_13_ShitNoOre";					//Du hast je nicht mal etwas Erz in den Taschen!
	HandsOff											= "SVM_13_HandsOff";					//Du Ratte! Finger weg! Dir zeig' ich's!
	GetOutOfHere										= "SVM_13_GetOutOfHere";				//Verzieh Dich! Raus hier!
	WhyAreYouSneaking									= "SVM_13_WhyAreYouSneaking";			//Hey du! Was schleichst du da rum?
	GetOutOrICallGuards									= "SVM_13_GetOutOrICallGuards";			//Was machst du hier? Geh oder ich ruf die Wachen!
	WhatDidYouInThere									= "SVM_13_WhatDidYouInThere";			//Du hast da drinnen nichts zu suchen!
	WiseMove											= "SVM_13_WiseMove";					//Dein Glück! Aber ich hätte dir auch gerne die Fresse poliert!
	CallGuards											= "SVM_13_CallGuards";					//Wachen, zu mir!
	IntruderAlert										= "SVM_13_IntruderAlert";				//ALARM !!
	BehindYou											= "SVM_13_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_13_TheresAFight";				//Mal sehen, wer gleich Staub schluckt.
	HeyHeyHey											= "SVM_13_HeyHeyHey";					//Ja, noch mal!
	CheerFight											= "SVM_13_CheerFight";					//Ich will Blut sehen!
	CheerFriend											= "SVM_13_CheerFriend";					//Mach ihn fertig!!
	Ooh													= "SVM_13_Ooh";							//Wehr Dich, du Flasche!
	RunCoward											= "SVM_13_RunCoward";					//Ja, verschwinde!
	HeDefeatedHim										= "SVM_13_HeDefeatedHim";				//Kümmerliche Vorstellung! Ein kleiner Windstoß und er wäre auch umgefallen.
	HeKilledHim											= "SVM_13_HeKilledHim";					//Du bist wirklich lebensmüde, vor Zeugen jemand kalt zu machen.
	Awake												= "SVM_13_Awake";						//Gääähn !!
	FriendlyGreetings									= "SVM_13_FriendlyGreetings";			//Alles klar bei dir?
	ALGreetings											= "SVM_13_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_13_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_13_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_13_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_13_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_13_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_13_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_13_HeyYou";						//Hey du!
	NotNow												= "SVM_13_NotNow";						//Nicht jetzt!
	WhatDoYouWant										= "SVM_13_WhatDoYouWant";				//Was willst du von mir?
	ISaidWhatDoYouWant									= "SVM_13_ISaidWhatDoYouWant";			//Kann ich was für dich tun?!
	MakeWay												= "SVM_13_MakeWay";						//Lass mich vorbei.
	OutOfMyWay											= "SVM_13_OutOfMyWay";					//Mach Platz!
	YouDeafOrWhat										= "SVM_13_YouDeafOrWhat";				//Suchst du Streit? Weg da!
	LookingForTroubleAgain								= "SVM_13_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_13_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_13_ThatsMyWeapon";				//Gib mir meine Waffe zurück!
	YouDisturbedMySlumber								= "SVM_13_YouDisturbedMySlumber";		//Warum weckst du mich?
	YouStoleFromMe										= "SVM_13_YouStoleFromMe";				//Du Arsch hast mich beklaut! Versuch das nicht noch mal!
	YouAttackedMe										= "SVM_13_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_13_YouKilledMyFriend";			//Einer unserer eigenen Leute ist tot und du hast damit zu tun! Der kleinste Fehler noch und du bist Freiwild!
	YouDefeatedMeWell									= "SVM_13_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_13_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_13_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_13_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_13_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_13_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_13_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_13_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_13_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_13_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_13_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_13_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_13_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_13_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_13_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_13_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_13_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_13_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_13_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_13_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_13_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_13_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_13_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_13_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_13_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_13_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_13_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_13_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_13_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_13_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_13_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_13_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_13_NotEnoughSilver";				//Wenn du nicht genug Silber hast, brauchst du mich auch nicht zu fragen! Also verschwende nicht meine Zeit!
	Buh													= "SVM_13_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_13_Possessed1";					//Tisch, Stuhl, Bett Talamon.
	Possessed2											= "SVM_13_Possessed2";					//Preist die Macht.
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_14(C_SVM) // Heiler	alt, gebildet, unnahbar
{
	StopMagic											= "SVM_14_StopMagic";					//Steck den Zauber weg!
	ISaidStopMagic										= "SVM_14_ISaidStopMagic";				//Hörst du nicht, steck den Zauber weg!
	WeaponDown											= "SVM_14_WeaponDown";					//Was willst du mit der Waffe?
	ISaidWeaponDown										= "SVM_14_ISaidWeaponDown";				//Steck die Waffe ein!
	WatchYourAim										= "SVM_14_WatchYourAim";				//Du hast mich im Visier!
	WatchYourAimAngry									= "SVM_14_WatchYourAimAngry";			//Würdest du aufhören, auf mich zu zielen!
	WhatAreYouDoing										= "SVM_14_WhatAreYouDoing";				//Pass doch auf!
	LetsForgetOurLittleFight							= "SVM_14_LetsForgetOurLittleFight";	//Vergessen wir unsere Meinungsverschiedenheit!
	DieMonster											= "SVM_14_DieMonster";					//Lästige Kreatur.
	DieMortalEnemy										= "SVM_14_DieMortalEnemy";				//Nimm es nicht persönlich, dass ich dich töten muss!
	NowWait												= "SVM_14_NowWait";						//Das reicht jetzt!
	YouStillNotHaveEnough								= "SVM_14_YouStillNotHaveEnough";		//Du willst doch nicht wieder Ärger?
	YouAskedForIt										= "SVM_14_YouAskedForIt";				//Du wolltest es so haben!
	NowWaitIntruder										= "SVM_14_NowWaitIntruder";				//Du kommst ungebeten!
	DirtyThief											= "SVM_14_DirtyThief";					//Du hast dir etwas von mir geliehen! Jetzt musst du auch dafür bezahlen!
	YouAttackedMyCharge									= "SVM_14_YouAttackedMyCharge";			//Du musst lernen, dich an die Regeln zu halten!
	YouKilledOneOfUs									= "SVM_14_YouKilledOneOfUs";			//Du hast jemanden getötet!
	Dead												= "SVM_14_Dead";						//Aaargl
	Aargh_1												= "SVM_14_Aargh_1";						//Aargh
	Aargh_2												= "SVM_14_Aargh_2";						//Aargh
	Aargh_3												= "SVM_14_Aargh_3";						//Aargh
	Berzerk												= "SVM_14_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_14_YoullBeSorryForThis";			//Das wirst du noch bereuen!
	YesYes												= "SVM_14_YesYes";						//Schon gut, schon gut!
	ShitWhatAMonster									= "SVM_14_ShitWhatAMonster";			//Dieser Herausforderung will ich mich jetzt nicht stellen.
	Help												= "SVM_14_Help";						//Ich muss mich meinen Studien widmen!
	NeverTryThatAgain									= "SVM_14_NeverTryThatAgain";			//Tu das besser nicht noch mal!
	ITookYourOre										= "SVM_14_ITookYourOre";				//Das Silber ist sicher nützlich!
	ShitNoOre											= "SVM_14_ShitNoOre";					//Du hast kein Erz.
	HandsOff											= "SVM_14_HandsOff";					//Finger weg!
	GetOutOfHere										= "SVM_14_GetOutOfHere";				//Raus hier!
	WhyAreYouSneaking									= "SVM_14_WhyAreYouSneaking";			//Warum schleichst du?
	GetOutOrICallGuards									= "SVM_14_GetOutOrICallGuards";			//Geh einfach wieder, bevor ich die Wachen rufe!
	WhatDidYouInThere									= "SVM_14_WhatDidYouInThere";			//Da drin hast du nichts zu suchen! Verstanden?
	WiseMove											= "SVM_14_WiseMove";					//Kluge Entscheidung!
	CallGuards											= "SVM_14_CallGuards";					//Wachen, hier, hier!
	IntruderAlert										= "SVM_14_IntruderAlert";				//EINDRINGLING !!!
	BehindYou											= "SVM_14_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_14_TheresAFight";				//Ein Kampf!
	HeyHeyHey											= "SVM_14_HeyHeyHey";					//Na ja.
	CheerFight											= "SVM_14_CheerFight";					//Wie uneffektiv!
	CheerFriend											= "SVM_14_CheerFriend";					//Sieht anstrengend aus!
	Ooh													= "SVM_14_Ooh";							//Schmerzhaft !
	RunCoward											= "SVM_14_RunCoward";					//Er hat was gelernt!
	HeDefeatedHim										= "SVM_14_HeDefeatedHim";				//Das war's ja dann wohl
	HeKilledHim											= "SVM_14_HeKilledHim";					//Ihn umzubringen war unnötig und wird dir große Probleme machen!
	Awake												= "SVM_14_Awake";						//hab' ich etwa geschlafen?
	FriendlyGreetings									= "SVM_14_FriendlyGreetings";			//Sei gegrüßt.
	ALGreetings											= "SVM_14_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_14_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_14_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_14_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_14_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_14_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_14_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_14_HeyYou";						//He du!
	NotNow												= "SVM_14_NotNow";						//Nicht jetzt.
	WhatDoYouWant										= "SVM_14_WhatDoYouWant";				//Was kann ich für dich tun?
	ISaidWhatDoYouWant									= "SVM_14_ISaidWhatDoYouWant";			//Kann ich dir helfen?
	MakeWay												= "SVM_14_MakeWay";						//Geh zur Seite.
	OutOfMyWay											= "SVM_14_OutOfMyWay";					//Lass mich vorbei.
	YouDeafOrWhat										= "SVM_14_YouDeafOrWhat";				//Verschwinde endlich!
	LookingForTroubleAgain								= "SVM_14_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_14_WhatsThat";					//Was war denn das?
	ThatsMyWeapon										= "SVM_14_ThatsMyWeapon";				//Gib mir meine Waffe zurück.
	YouDisturbedMySlumber								= "SVM_14_YouDisturbedMySlumber";		//Du störst meine Studien!
	YouStoleFromMe										= "SVM_14_YouStoleFromMe";				//Du wagst es mir unter die Augen zu treten, dreckiger Dieb?
	YouAttackedMe										= "SVM_14_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_14_YouKilledMyFriend";			//Du hast einen von uns auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_14_YouDefeatedMeWell";			//Du hast mir ganz schön aufs Maul gehauen, Mann. War ein guter Kampf. Aber jetzt ist gut!
	Smalltalk01											= "SVM_14_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_14_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_14_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_14_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_14_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_14_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_14_Smalltalk07";					// ... aber behalt's für dich, muss ja nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_14_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_14_Smalltalk09";					// ... an der Geschichte muss doch wohl was dran sein ...
	Smalltalk10											= "SVM_14_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_14_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_14_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_14_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_14_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_14_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_14_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_14_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_14_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_14_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_14_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_14_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_14_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_14_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_14_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_14_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_14_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_14_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_14_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_14_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_14_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_14_PointForMe";					//Punkt für mich!
	NotEnoughSilver										= "SVM_14_NotEnoughSilver";				//Du hast nicht genug Silber, da kann ich nichts machen!
	Buh													= "SVM_14_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_14_Possessed1";					//Silber und Moleratfat
	Possessed2											= "SVM_14_Possessed2";					//Braue den finalen Traaaank
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_15(C_SVM) //	PLAYER	trocken,ernst
{
	SectGreetings										= "SVM_15_SectGreetings";				//Erwache !
	ALGreetings											= "SVM_15_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_15_MageGreetings";				//Sei gegrüßt!
	FriendlyGreetings									= "SVM_15_FriendlyGreetings";			//Hi !
	Aargh_1												= "SVM_15_Aargh_1";						//Aargh
	Aargh_2												= "SVM_15_Aargh_2";						//Aargh
	Aargh_3												= "SVM_15_Aargh_3";						//Aargh
	Dead												= "SVM_15_Dead";						//Aaargl
	Awake												= "SVM_15_Awake";						//

	WaterpipeVision1									= "SVM_15_WaterpipeVision1";			// ... Xardas wird das Land erhellen ...
	WaterpipeVision2									= "SVM_15_WaterpipeVision2";			// ... Nimm Dich in Acht vor den Amazonen ...
	WaterpipeVision3									= "SVM_15_WaterpipeVision3";			// ... Nicht alle Orks sind von Grund auf böse ...
	WaterpipeVision4									= "SVM_15_WaterpipeVision4";			// ... Feuerregen wird über das Land kommen ...
	WaterpipeVision5									= "SVM_15_WaterpipeVision5";			// ... Bist Du nicht der Auserwählte ...
	//IWantToRegret										= "SVM_15_IWANTTOREGRET";				//Ich habe Dinge getan, die Sühne erforden, deshalb komme ich zu Dir
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_16(C_SVM) // Weibliche Stimme (Thora) --- FIXME: ist noch Kopie von SVM 2
{
	StopMagic											= "SVM_16_StopMagic";					//Keine Magie!
	ISaidStopMagic										= "SVM_16_ISaidStopMagic";				//HEY! Keine Magie, hab' ich gesagt!
	WeaponDown											= "SVM_16_WeaponDown";					//Komm, steck das Ding weg!
	ISaidWeaponDown										= "SVM_16_ISaidWeaponDown";				//Weg mit der Waffe!
	WatchYourAim										= "SVM_16_WatchYourAim";				//Pass auf, wo du hinzielst!
	WatchYourAimAngry									= "SVM_16_WatchYourAimAngry";			//Wenn du weiter auf mich anlegst, muss ich das wohl persönlich nehmen!
	WhatAreYouDoing										= "SVM_16_WhatAreYouDoing";				//Hey, was soll denn das??
	LetsForgetOurLittleFight							= "SVM_16_LetsForgetOurLittleFight";	//Lass uns die Sache vergessen, ok?
	DieMonster											= "SVM_16_DieMonster";					//Schon wieder eins!
	DieMortalEnemy										= "SVM_16_DieMortalEnemy";				//Ich befürchte, ich muss dich beseitigen!
	NowWait												= "SVM_16_NowWait";						//Du bist selbst Schuld!
	YouStillNotHaveEnough								= "SVM_16_YouStillNotHaveEnough";		//Hast du noch nicht genug?
	YouAskedForIt										= "SVM_16_YouAskedForIt";				//Wenn du es unbedingt willst!
	NowWaitIntruder										= "SVM_16_NowWaitIntruder";				//Du weißt doch, dass du hier nichts zu Suchen hast!
	DirtyThief											= "SVM_16_DirtyThief";					//Du hast mich beklaut! Das nehme ich dir echt übel!
	YouAttackedMyCharge									= "SVM_16_YouAttackedMyCharge";			//Niemand vergreift sich an meinen Jungs!
	YouKilledOneOfUs									= "SVM_16_YouKilledOneOfUs";			//Du hast einen von uns umgebracht! Dafür musst du büßen!
	Dead												= "SVM_16_Dead";						//Aaargl
	Aargh_1												= "SVM_16_Aargh_1";						//Aargh
	Aargh_2												= "SVM_16_Aargh_2";						//Aargh
	Aargh_3												= "SVM_16_Aargh_3";						//Aargh
	Berzerk												= "SVM_16_Berzerk";						//UUAAARRGGGHHH !!!
	YoullBeSorryForThis									= "SVM_16_YoullBeSorryForThis";			//Das wird dir noch Leid tun!
	YesYes												= "SVM_16_YesYes";						//Langsam, langsam, du hast gewonnen!
	ShitWhatAMonster									= "SVM_16_ShitWhatAMonster";			//Ich - ähm - geh' Hilfe holen!
	Help												= "SVM_16_Help";						//Keine Zeit, ich muss noch was erledigen!
	NeverTryThatAgain									= "SVM_16_NeverTryThatAgain";			//Versuch das nicht noch mal!
	ITookYourOre										= "SVM_16_ITookYourOre";				//Etwas Silber kannst du doch entbehren!
	ShitNoOre											= "SVM_16_ShitNoOre";					//Du hast kein Erz? Scheint heute nicht dein Tag zu sein!
	HandsOff											= "SVM_16_HandsOff";					//Finger weg!
	GetOutOfHere										= "SVM_16_GetOutOfHere";				//Raus hier!
	WhyAreYouSneaking									= "SVM_16_WhyAreYouSneaking";			//Was schleichst du da rum?
	GetOutOrICallGuards									= "SVM_16_GetOutOrICallGuards";			//Raus aus meiner Hütte oder ich ruf die Wachen!
	WhatDidYouInThere									= "SVM_16_WhatDidYouInThere";			//Bleib aus den Hütten draußen!
	WiseMove											= "SVM_16_WiseMove";					//Die richtige Entscheidung.
	CallGuards											= "SVM_16_CallGuards";					//Wachen, hierher!
	IntruderAlert										= "SVM_16_IntruderAlert";				//ALARM !!!
	BehindYou											= "SVM_16_BehindYou";					//Hinter dir!
	TheresAFight										= "SVM_16_TheresAFight";				//Ah, ein Kampf!
	HeyHeyHey											= "SVM_16_HeyHeyHey";					//Ist das alles!
	CheerFight											= "SVM_16_CheerFight";					//Nicht so müde!
	CheerFriend											= "SVM_16_CheerFriend";					//Guter Schlag!
	Ooh													= "SVM_16_Ooh";							//Das tat weh!
	RunCoward											= "SVM_16_RunCoward";					//Bleib hier, du Feigling!
	HeDefeatedHim										= "SVM_16_HeDefeatedHim";				//Der hat genug!
	HeKilledHim											= "SVM_16_HeKilledHim";					//Du hast ihn umgebracht! War das nötig?
	Awake												= "SVM_16_Awake";						//Gäääähn
	FriendlyGreetings									= "SVM_16_FriendlyGreetings";			//Hallo.
	ALGreetings											= "SVM_16_ALGreetings";					//Für Gomez!
	MageGreetings										= "SVM_16_MageGreetings";				//Magie zu Ehren!
	SectGreetings										= "SVM_16_SectGreetings";				//Erwache !
	NoLearnNoPoints										= "SVM_16_NoLearnNoPoints";				//Ich kann dir nichts beibringen. Du hast nicht genug Erfahrung.
	NoLearnOverMax										= "SVM_16_NoLearnOverMax";				//Du bist am Ende deiner Möglichkeiten. Du solltest etwas anderes lernen.
	NoLearnYouAlreadyKnow								= "SVM_16_NoLearnYouAlreadyKnow";		//Du musst erst fortgeschritten sein, bevor du Meister werden kannst!
	NoLearnYoureBetter									= "SVM_16_NoLearnYoureBetter";			//Du bist jetzt schon besser!
	HeyYou												= "SVM_16_HeyYou";						//Hey, du!
	NotNow												= "SVM_16_NotNow";						//Jetzt nicht.
	WhatDoYouWant										= "SVM_16_WhatDoYouWant";				//Was willst du?
	ISaidWhatDoYouWant									= "SVM_16_ISaidWhatDoYouWant";			//Kann ich was für dich tun?
	MakeWay												= "SVM_16_MakeWay";						//Lass mich mal vorbei!
	OutOfMyWay											= "SVM_16_OutOfMyWay";					//Mach Platz!
	YouDeafOrWhat										= "SVM_16_YouDeafOrWhat";				//Verschwinde, sonst lauf ich über dich drüber!
	LookingForTroubleAgain								= "SVM_16_LookingForTroubleAgain";		//Willst du dich noch mal mit mir anlegen?
	WhatsThat											= "SVM_16_WhatsThat";					//Was? Wie?
	ThatsMyWeapon										= "SVM_16_ThatsMyWeapon";				//Sieht aus wie meine Waffe, was du da hast!
	YouDisturbedMySlumber								= "SVM_16_YouDisturbedMySlumber";		//Warum weckst du mich?
	YouStoleFromMe										= "SVM_16_YouStoleFromMe";				//Wieso hast du mich beklaut?
	YouAttackedMe										= "SVM_16_YouAttackedMe";				//Warum hast du mich angegriffen??
	YouKilledMyFriend									= "SVM_16_YouKilledMyFriend";			//Du hast einen von unseren Jungs auf dem Gewissen. Noch ein kleiner Fehler und du bist dran!
	YouDefeatedMeWell									= "SVM_16_YouDefeatedMeWell";			//Ja, du hast mich besiegt. War ein guter Kampf! Aber jetzt ist genug!
	Smalltalk01											= "SVM_16_Smalltalk01";					// ... wenn du meinst ...
	Smalltalk02											= "SVM_16_Smalltalk02";					// ... kann schon sein ...
	Smalltalk03											= "SVM_16_Smalltalk03";					// ... war nicht besonders schlau ...
	Smalltalk04											= "SVM_16_Smalltalk04";					// ... ich halt mich da lieber raus ...
	Smalltalk05											= "SVM_16_Smalltalk05";					// ... das ist wirklich nicht mein Problem ...
	Smalltalk06											= "SVM_16_Smalltalk06";					// ... war doch klar, dass das Ärger gibt ...
	Smalltalk07											= "SVM_16_Smalltalk07";					// ... aber behalt's für dich, muss nicht gleich jeder wissen ...
	Smalltalk08											= "SVM_16_Smalltalk08";					// ... das passiert mir nicht noch mal ...
	Smalltalk09											= "SVM_16_Smalltalk09";					// ... an der Geschichte muss wohl doch was dran sein ...
	Smalltalk10											= "SVM_16_Smalltalk10";					// ... man muss eben aufpassen, was man rumerzählt ...
	Smalltalk11											= "SVM_16_Smalltalk11";					// ... solange ich damit nichts zu tun habe ...
	Smalltalk12											= "SVM_16_Smalltalk12";					// ... man darf auch nicht alles glauben, was man hört ...
	Smalltalk13											= "SVM_16_Smalltalk13";					// ... in seiner Haut will ich trotzdem nicht stecken ...
	Smalltalk14											= "SVM_16_Smalltalk14";					// ... immer wieder dieselbe Leier ...
	Smalltalk15											= "SVM_16_Smalltalk15";					// ... manche lernen eben gar nichts dazu ...
	Smalltalk16											= "SVM_16_Smalltalk16";					// ... früher wäre das ganz anders gelaufen ...
	Smalltalk17											= "SVM_16_Smalltalk17";					// ... gequatscht wird viel ...
	Smalltalk18											= "SVM_16_Smalltalk18";					// ... ich hör' nicht mehr auf das Gefasel ...
	Smalltalk19											= "SVM_16_Smalltalk19";					// ... verlass dich auf jemanden und du bist verlassen, das ist eben so ...
	Smalltalk20											= "SVM_16_Smalltalk20";					// ... ich glaube kaum, dass sich daran was ändern wird ...
	Smalltalk21											= "SVM_16_Smalltalk21";					// ... wahrscheinlich hast du Recht ...
	Smalltalk22											= "SVM_16_Smalltalk22";					// ... erst mal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird ...
	Smalltalk23											= "SVM_16_Smalltalk23";					// ... ich dachte, das wäre schon lange geklärt ...
	Smalltalk24											= "SVM_16_Smalltalk24";					// ... lass uns lieber über was anderes reden ...
	Om													= "SVM_16_Om";							//Ommm
	YouDisturbedArenaFight								= "SVM_16_YouDisturbedArenaFight";		//Du spinnst wohl. Kannst doch nicht einfach einen Arenakampf unterbrechen.
	YouMurderedInArena									= "SVM_16_YouMurderedInArena";			//Bist du wahnsinnig. In der Arena wird nicht getötet!
	NoMagicInArena										= "SVM_16_NoMagicInArena";				//Keine Magie in der Arena. Das ist Gesetz!
	NoBowInArena										= "SVM_16_NoBowInArena";				//Keine Fernkampfwaffen in der Arena! Weg damit!
	PointForYou											= "SVM_16_PointForYou";					//Punkt für dich!
	PointForMe											= "SVM_16_PointForMe";					//Punkt für mich!
	//RegretAccepted									= "SVM_16_RegretAccepted";				//Auch wenn es nicht recht war, was Du getan hast, wir brauchen jeden Mann und Deine Buße wird akzeptiert
	NotEnoughSilver										= "SVM_16_NotEnoughSilver";				//Kann es sein, dass du garnicht genug Silber hast?
	Buh													= "SVM_16_Buh";							//BUUHHH !!!!
	Possessed1											= "SVM_16_Possessed1";					//Ich muß meine Schuhe finden
	Possessed2											= "SVM_16_Possessed2";					//Sie laufen von allein.
};

//////////////////////////////////////////
prototype SVM_PROTOTYPE_17(C_SVM) 							//Ork-Stimme

// FIXME: mehr Varianten!?
{
	StopMagic											= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	ISaidStopMagic										= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	WeaponDown											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	/*
	ISaidWeaponDown										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim										= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry									= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	WhatAreYouDoing										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight							= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	DieMonster											= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy										= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	NowWait												= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	YouStillNotHaveEnough								= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt										= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	NowWaitIntruder										= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	DirtyThief											= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge									= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs									= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	Dead												= "SVM_17_Dead";						//Aaaarglll....
	Aargh_1												= "SVM_17_Aargh_1";						//Aargh !
	Aargh_2												= "SVM_17_Aargh_2";						//Aargh !
	Aargh_3												= "SVM_17_Aargh_3";						//Aargh !
	Berzerk												= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis									= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster									= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	Help												= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	NeverTryThatAgain									= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	ITookYourOre										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre											= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	HandsOff											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	GetOutOfHere										= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	WhyAreYouSneaking									= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	GetOutOrICallGuards									= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	WhatDidYouInThere									= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove											= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	CallGuards											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	IntruderAlert										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou											= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	CheerFight											= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	CheerFriend											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	Ooh													= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	Awake												= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	FriendlyGreetings									= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	HeyYou												= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow												= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	WhatDoYouWant										= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	ISaidWhatDoYouWant									= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay												= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	OutOfMyWay											= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	YouDeafOrWhat										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain								= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	YouDisturbedMySlumber								= "SVM_17_OrcSound02";					//ROK KRUSHAK KOR GANORG
	YouStoleFromMe										= "SVM_17_OrcSound01";					//KARROK UR SHAK TOS KARRAS DA GACH
	YouKilledMyFriend									= "SVM_17_OrcSound03";					//NEMROK KA VARROK
	*/
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//	Zuweisung der Prototpen
//	=======================
//	Hier werden die SVM-Prototypen den realen SVMs zugewiesen.
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
instance SVM_1(SVM_PROTOTYPE_1) { };
instance SVM_2(SVM_PROTOTYPE_2) { };
instance SVM_3(SVM_PROTOTYPE_3) { };
instance SVM_4(SVM_PROTOTYPE_4) { };
instance SVM_5(SVM_PROTOTYPE_5) { };
instance SVM_6(SVM_PROTOTYPE_6) { };
instance SVM_7(SVM_PROTOTYPE_7) { };
instance SVM_8(SVM_PROTOTYPE_8) { };
instance SVM_9(SVM_PROTOTYPE_9) { };
instance SVM_10(SVM_PROTOTYPE_10) { };
instance SVM_11(SVM_PROTOTYPE_11) { };
instance SVM_12(SVM_PROTOTYPE_12) { };
instance SVM_13(SVM_PROTOTYPE_13) { };
instance SVM_14(SVM_PROTOTYPE_14) { };
instance SVM_15(SVM_PROTOTYPE_15) { };
instance SVM_16(SVM_PROTOTYPE_16) { };
instance SVM_17(SVM_PROTOTYPE_17) { };

instance SVM_18(SVM_PROTOTYPE_16) { };
instance SVM_19(SVM_PROTOTYPE_16) { };
instance SVM_20(SVM_PROTOTYPE_16) { };
instance SVM_21(SVM_PROTOTYPE_16) { };
instance SVM_22(SVM_PROTOTYPE_16) { };
instance SVM_23(SVM_PROTOTYPE_16) { };
instance SVM_24(SVM_PROTOTYPE_16) { };
instance SVM_25(SVM_PROTOTYPE_16) { };
instance SVM_26(SVM_PROTOTYPE_16) { };
instance SVM_27(SVM_PROTOTYPE_16) { };
instance SVM_28(SVM_PROTOTYPE_16) { };
instance SVM_29(SVM_PROTOTYPE_16) { };

// ***********************
// 		Maximale SVMs
// ***********************

const int SVM_MODULES = 30;
