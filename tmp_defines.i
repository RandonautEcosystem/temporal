

// i hate C-style for-loops! XD

#define for_(count)			for (int i = 0; i < count; i++)
#define FOR_(var, count)	for (int var = 0; var < count; var++)
#define require(expr)		if (!(expr)) {return {};}
#define sizecheck(a,b)		if (sizeof(a)!=b) {return -100;} // sizecheck
#define Time_(R)			u32 TimeFinish = 0; while (Data < DataEnd) { u32 Start = Time32(); for_(R)
#define TimeEnd 			; TimeFinish = Time32(); *Data++ = TimeDiff(Start,TimeFinish);}
#define Gen(name) static u64 name##Generator (uSample* Data, uSample* DataEnd, u32 Input, int Reps)
#define New(x)				std::make_shared<x>()
#define New2(x,a)			std::make_shared<x>(a)
#define New3(x,a,b)			std::make_shared<x>(a,b)
#define New4(x,a,b,c)		std::make_shared<x>(a,b,c)
#define Now()				std::chrono::high_resolution_clock::now()
#define self				(*this)
#define ChronoLength(Start)	(std::chrono::duration_cast<std::chrono::duration<float>>(Now() - Start).count())
#ifdef DEBUG
	#define debugger asm("int3")
	#define DEBUG_AS_NUM 1
#else
	#define debugger
	#define DEBUG_AS_NUM 0
#endif
#define Ooof				[[maybe_unused]] static
#define test(cond)	if (!(cond)) {debugger;}


bool				AllowDebiaser	= false; // seems not good enough. but i have a better idea.
int					IgnoredError;
const IntVec		ModList			= {0, 2, 12, 13, 17, 19, 23, 31}; // arbitrary... can change these to whatever.
const string		ScoreNames[]	= {"entropy", "chisq", "mean", "monte",  "histogram", "persistant"}; 
const string		MaxNames[]		= {"",        "min",   "max",  "pmin",   "pmax"}; 
std::vector<string> FilesToOpenLater;


#define		kSudo	 			1
#define		kChaotic	  		2


#define		kXShrink			1
#define		kXVonn				2
#define		kXHisto				4


#define		kXORShrinkAmount	16

