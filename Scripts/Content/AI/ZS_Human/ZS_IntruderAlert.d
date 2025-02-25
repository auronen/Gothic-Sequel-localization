func void ZS_IntruderAlert()
{
	PrintDebugNpc(PD_ZS_FRAME, "ZS_IntruderAlert");
	PrintGlobals(PD_ZS_FRAME);

	B_IntruderAlert(self, hero);
	B_AttackQuick(self, hero);
};
