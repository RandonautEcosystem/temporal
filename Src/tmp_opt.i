

Ooof int SplitUnit(string L) {
	for_(L.size())
		if (L[i] < '0' or L[i] > '9')
			return i;
	return (int)L.size();
}


Ooof char lower (char a) {
	if (a >= 'A' and a <= 'Z')
		return a + ('a'-'A');
	return a;
}


Ooof bool matchi(const char* a, const char* b) {
	if (!a or !b)
		return a==b;

	while (true) {
		char A = lower(*a++);
		char B = lower(*b++);
		if (!A or !B)
			return A==B;
		if (A != B)
			return false;
	}
	
	return true;
}
 
Ooof int ParseLength (string L) {
	int mul = 0;
	int spl = SplitUnit(L);
	string U = L.substr(spl, (int)L.size());
	int UL = (int)U.size() - 1;
	auto Last = U[UL];
	if (Last == 'b' or Last == 'B')
		U = U.substr(0, UL);

	if (U == "")
		mul = 1;
	  else if (U == "k" or U == "K")
		mul = 1024;
	  else if (U == "m" or U == "M")
		mul = 1024 * 1024;
	  else
		std::cerr << "Can't use unit: " << U << "\n";

	if (mul) {
		string Amount = L.substr(0, spl);
		if (Amount.size())
			return atoi(Amount.c_str()) * mul;
	}

	errno = ArgError;
	return 0;
}


Ooof FILE* CmdArgFile (string FileOut) {
	if (FileOut == "")  {
		errno = ArgError;
		return 0;
	}
	if (FileOut == "-") return stdout;

	auto Dest = fopen(FileOut.c_str(), "w");
	if (Dest) return Dest;

	std::cerr << "Can't open: " << FileOut;
	return 0;
}
