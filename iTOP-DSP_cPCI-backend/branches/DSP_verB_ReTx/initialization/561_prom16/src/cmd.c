
void _loader_commands(void);
extern int SECOND_STAGE_LOADER(int, int);

void loader_commands()
{
	SECOND_STAGE_LOADER(0, 1);	// load core A DXE
	SECOND_STAGE_LOADER(0, 2);	// load core B DXE
	SECOND_STAGE_LOADER(1, 0);	// execute core A DXE
}
