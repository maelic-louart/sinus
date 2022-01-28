#include "sinus.h"


int main()
{

	bool start;
	bool debug;
	bool step;

	hls::stream<int> angle("angle");
	hls::stream<int> sinus_1("sinus_1");
	hls::stream<int> sinus_2("sinus_2");
	int sinus_1_tmp;
	int sinus_2_tmp;

	start=1;
	debug=0;

	int err=0;
	int nb_simu=10;

	for (int i=0;i<nb_simu;i++)
	{
		if(i==5)
		{
			debug=1;
			step=1;
		}
		if(i==8)
		{
			step=0;
		}
		angle<<i;

		sinus(start,debug,step,angle,sinus_1,sinus_2);

	}

	for (int i=0;i<nb_simu-2;i++)
	{
		sinus_1_tmp=sinus_1.read();
		sinus_2_tmp=sinus_2.read();

		cout << "sinus_1_tmp =" << sinus_1_tmp <<endl;
		cout << "sinus_2_tmp =" << sinus_2_tmp << endl;
	}
	return err;
}

