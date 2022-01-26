#include "sinus.h"



int sin_lookup (int n){

	int idx;
	bool sign;
	if (n == DATA_SIZE){
		idx = 0;
		sign =0;
	}
	else if (n>=0 && n<=DATA_SIZE/4){
		idx = n;
		sign =0;
	}
	else if (n>=DATA_SIZE/4 && n<DATA_SIZE/2) {
		idx = DATA_SIZE/4-n%(DATA_SIZE/4);
		sign = 0;
	}
	else if (n>=DATA_SIZE/2 && n<3* DATA_SIZE/4){
		idx = n%(DATA_SIZE/4);
		sign =1;
	}
	else{
		idx = DATA_SIZE/4-n%(DATA_SIZE/4);
		sign =1;
	}
	if (sign)
	{
		return(-sin_table[idx]);
	}
	else
	{
		return(sin_table[idx]);
	}
}

void sinus(bool start,bool step,hls::stream<int> &signal_1,hls::stream<int> &signal_2)
{
	static bool start_tmp=start;
	if(start_tmp==1)
	{
		static ap_uint<8> n=0;

		bool step_tmp=step;
		if(step_tmp==1)
		{
			int signal_tmp=sin_lookup(n);
			//				cout << "signal_tmp =" << signal_tmp << endl;
			signal_1<<signal_tmp;
			signal_2<<signal_tmp;
		}
		n+=1;
	}
}
