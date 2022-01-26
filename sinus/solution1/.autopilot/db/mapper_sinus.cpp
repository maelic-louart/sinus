#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_signal_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_signal_1_V_size_Reader("../tv/stream_size/stream_size_out_signal_1_V.dat");
unsigned int ap_apatb_signal_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_signal_2_V_size_Reader("../tv/stream_size/stream_size_out_signal_2_V.dat");
extern "C" void sinus(char, char, int*, int*);
extern "C" void apatb_sinus_hw(char __xlx_apatb_param_start, char __xlx_apatb_param_step, volatile void * __xlx_apatb_param_signal_1, volatile void * __xlx_apatb_param_signal_2) {
  //Create input buffer for signal_1
  ap_apatb_signal_1_V_cap_bc = __xlx_signal_1_V_size_Reader.read_size();
  int* __xlx_signal_1_input_buffer= new int[ap_apatb_signal_1_V_cap_bc];
  //Create input buffer for signal_2
  ap_apatb_signal_2_V_cap_bc = __xlx_signal_2_V_size_Reader.read_size();
  int* __xlx_signal_2_input_buffer= new int[ap_apatb_signal_2_V_cap_bc];
  // DUT call
  sinus(__xlx_apatb_param_start, __xlx_apatb_param_step, __xlx_signal_1_input_buffer, __xlx_signal_2_input_buffer);
  for (unsigned i = 0; i <ap_apatb_signal_1_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_signal_1)->write(__xlx_signal_1_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_signal_2_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_signal_2)->write(__xlx_signal_2_input_buffer[i]);
}
