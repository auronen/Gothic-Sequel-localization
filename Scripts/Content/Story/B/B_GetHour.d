// Funktion zur Feststellung bestimmter Stundenzahlen.
// äquvivalent zum Wld_GetDay
//
// M.F.
func int B_GetHour()
{
	if (Wld_IsTime(00, 00, 01, 00))
	{
		return 0;
	};

	if (Wld_IsTime(01, 00, 02, 00))
	{
		return 1;
	};

	if (Wld_IsTime(02, 00, 03, 00))
	{
		return 2;
	};

	if (Wld_IsTime(03, 00, 04, 00))
	{
		return 3;
	};

	if (Wld_IsTime(04, 00, 05, 00))
	{
		return 4;
	};

	if (Wld_IsTime(05, 00, 06, 00))
	{
		return 5;
	};

	if (Wld_IsTime(06, 00, 07, 00))
	{
		return 6;
	};

	if (Wld_IsTime(07, 00, 08, 00))
	{
		return 7;
	};

	if (Wld_IsTime(08, 00, 09, 00))
	{
		return 8;
	};

	if (Wld_IsTime(09, 00, 10, 00))
	{
		return 9;
	};

	if (Wld_IsTime(10, 00, 11, 00))
	{
		return 10;
	};

	if (Wld_IsTime(11, 00, 12, 00))
	{
		return 11;
	};

	if (Wld_IsTime(12, 00, 13, 00))
	{
		return 12;
	};

	if (Wld_IsTime(13, 00, 14, 00))
	{
		return 13;
	};

	if (Wld_IsTime(14, 00, 15, 00))
	{
		return 14;
	};

	if (Wld_IsTime(15, 00, 16, 00))
	{
		return 15;
	};

	if (Wld_IsTime(16, 00, 17, 00))
	{
		return 16;
	};

	if (Wld_IsTime(17, 00, 18, 00))
	{
		return 17;
	};

	if (Wld_IsTime(18, 00, 19, 00))
	{
		return 18;
	};

	if (Wld_IsTime(19, 00, 20, 00))
	{
		return 19;
	};

	if (Wld_IsTime(20, 00, 21, 00))
	{
		return 20;
	};

	if (Wld_IsTime(21, 00, 22, 00))
	{
		return 21;
	};

	if (Wld_IsTime(22, 00, 23, 00))
	{
		return 22;
	};

	if (Wld_IsTime(23, 00, 24, 00))
	{
		return 23;
	};

	return 0;
};
