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

void sinus(bool start,bool debug,bool step,hls::stream<int> &angle,hls::stream<int> &sinus_1,hls::stream<int> &sinus_2)
{

#pragma HLS Interface axis port=angle
#pragma HLS Interface axis port=sinus_1
#pragma HLS Interface axis port=sinus_2
//#pragma HLS Interface ap_vld port=step
//#pragma HLS Interface ap_ack port=step

	bool start_tmp=start;
	if(start_tmp==1)
	{
		static ap_uint<8> n=0;

		if(debug==0)
		{
			int angle_tmp=angle.read();
			int signal_tmp=sin_lookup(angle_tmp);
			sinus_1<<signal_tmp;
			sinus_2<<signal_tmp;
		}
		else
		{
			if(step==1)
			{
				int angle_tmp=angle.read();
				int signal_tmp=sin_lookup(angle_tmp);
				sinus_1<<signal_tmp;
				sinus_2<<signal_tmp;
			}
		}
	}
}
