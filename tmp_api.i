
extern "C" { // A simple C API!


BookHitter* bh_create(bool Log) {
	auto G = new BookHitter;
	auto& F = *G;
	require (G);

	F = {};
	F.Log = Log;

	try {
		F.Allocate(22);
		F.CreateReps(0);
		if (!F.Log)
			F.LoadLists();
	} catch (std::bad_alloc& e) {
		std::cerr << e.what();
	}
	return G;
}

void bh_logfiles(BookHitter* f) {
	for (auto S : FilesToOpenLater)
		OpenFile(S);
}

void bh_free (BookHitter* f) {
	delete(f);
}


void bh_conf (BookHitter* f, int Channel, int* RepList) {
	f->UserChannel = Channel;
	f->CreateReps(RepList);
}


void bh_detect (BookHitter* f, bh_output* Out) {
	GenApproach App = {};
	Out->GenerateTime = 0; Out->WorstScore = 0; Out->ProcessTime = 0;
	DetectRandomness_(App, (u8*)Out->Data, Out->DataLength);
}


int bh_hitbooks (BookHitter* f, bh_output* Out) {
	Out->GenerateTime = 0; Out->WorstScore = 0; Out->ProcessTime = 0;
	auto &F = *f;
	if (Out->Data) memset(Out->Data, 0, Out->DataLength);
	
	RandomBuildup B = {}; B.Remaining=Out->DataLength; B.Data = (u8*)Out->Data;
	while (F.CollectPieceOfRandom(B, *Out))
		if (F.AssembleRandoms(B, *Out))
			return 0;

	F.ResetApproach();
	if (!f->Time.Error) f->Time.Error = -1;
	return f->Time.Error;
}



static string RestoreDir;
static void CleanupMain () {
	IgnoredError = chdir(RestoreDir.c_str());
}


static const char* WelcomeMsg = R"(Reesurrch iN2 teMpOwAls!!

Gennewaits pngs 4 u 2 chekk iFf dA randOmNesS "seems gud".

Uses da ~RAndoMnEss~ in "hoW loNg" da instruction taykes, 4 fizzicalie bassed raNdoMness.

No idea if dis RanDmoNess iz "gud"? Seems ~eggsiiting~! >:3
)";


int main (int argc, const char* argv[]) {
	sizecheck(u64, 8);  sizecheck(u32, 4);  sizecheck(u16, 2);  sizecheck(u8, 1);
	
	RestoreDir = getcwd(0, 0);
	atexit(CleanupMain);

	puts(WelcomeMsg);
	PrintProbabilities();
	
	bh_output TROut = {0, 1};
	BookHitter& F = *bh_create(1);

	int Err = bh_hitbooks(&F, &TROut);

	u8 DataBuff[4096];
	TROut = {DataBuff, sizeof(DataBuff)};
	
	auto html = F.HTML("steve.html",  "Randomness Test");
	
	for_(5) {
		Err = bh_hitbooks(&F, &TROut);
		if (Err) break;
		html->WriteOne(&TROut, F.App, i+1);
	}
	
	html->Finish();
	bh_logfiles(&F);
	bh_free(&F);

	printf("\n");
	return Err;
}

}
