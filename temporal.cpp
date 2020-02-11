
//  
//  Generate temporal number stream: © 2019-2020 Theodore H. Smith
//  Could be used in almost anything! Even games :3
//  Can we make a computer FEEL Psychic energy?
//  compile: g++ -pthread -std=c++0x -Os temporal.cpp -o temporal
//	  or use Xcode project
//  


//  TODO:
//  * Histogram... use it.
//  * chaotic randomness? use multiple code-paths!
//  * Use lasting statistical-mean in the stablity sorter! 
//  * Save the expected score? So if it gets worse suddenly, we switch lists

//  ADD:
//  * Allow "Hash-mode"... assumes retro-causality. "Try 100 diferent realities... choose the best".
//		* smaller space-reps needed!

//  OPTS:
//  * histogram debiaser should use sliding window...
//      * This just gives more data, then dump von-neuman. It costs us 4x data.


#include "tmp_api.h"
#include "tmp_headers.i"
#include "tmp_typedefs.i"
#include "tmp_defines.i"
#include "tmp_math.i"
#include "tmp_classes.i"
#include "tmp_gen.i"
#include "tmp_stats.i"
#include "tmp_logging.i"
#include "tmp_saving.i"
#include "tmp_histogram.i"
#include "tmp_drawhisto.i"
#include "tmp_extraction.i"
#include "tmp_sorting.i"
#include "tmp_core.i"
#include "tmp_api.i"


