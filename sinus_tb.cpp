#include "sinus.h"


int main()
{

	bool start_sinus;
	bool step_sinus;

	hls::stream<int> sinus_1("sinus_1");
	hls::stream<int> sinus_2("sinus_2");
	int sinus_1_tmp;
	int sinus_2_tmp;

	start_sinus=1;

	int err=0;
	int nb_simu=10;

	for (int i=0;i<nb_simu;i++)
	{
		step_sinus=1;
		sinus(start_sinus,step_sinus,sinus_1,sinus_2);
		sinus_1_tmp=sinus_1.read();
		sinus_2_tmp=sinus_2.read();

		cout << "sinus_1_tmp =" << sinus_1_tmp <<endl;
		cout << "sinus_2_tmp =" << sinus_2_tmp << endl;
	}
	return err;
}

