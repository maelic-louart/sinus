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
unsigned int ap_apatb_angle_V_cap_bc;
static AESL_RUNTIME_BC __xlx_angle_V_size_Reader("../tv/stream_size/stream_size_in_angle_V.dat");
unsigned int ap_apatb_sinus_1_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sinus_1_V_size_Reader("../tv/stream_size/stream_size_out_sinus_1_V.dat");
unsigned int ap_apatb_sinus_2_V_cap_bc;
static AESL_RUNTIME_BC __xlx_sinus_2_V_size_Reader("../tv/stream_size/stream_size_out_sinus_2_V.dat");
extern "C" void sinus(char, char, char, int*, int*, int*);
extern "C" void apatb_sinus_hw(char __xlx_apatb_param_start, char __xlx_apatb_param_debug, char __xlx_apatb_param_step, volatile void * __xlx_apatb_param_angle, volatile void * __xlx_apatb_param_sinus_1, volatile void * __xlx_apatb_param_sinus_2) {
  // collect __xlx_angle_tmp_vec
  unsigned __xlx_angle_V_tmp_Count = 0;
  unsigned __xlx_angle_V_read_Size = __xlx_angle_V_size_Reader.read_size();
  vector<int> __xlx_angle_tmp_vec;
  while (!((hls::stream<int>*)__xlx_apatb_param_angle)->empty() && __xlx_angle_V_tmp_Count < __xlx_angle_V_read_Size) {
    __xlx_angle_tmp_vec.push_back(((hls::stream<int>*)__xlx_apatb_param_angle)->read());
    __xlx_angle_V_tmp_Count++;
  }
  ap_apatb_angle_V_cap_bc = __xlx_angle_tmp_vec.size();
  // store input buffer
  int* __xlx_angle_input_buffer= new int[__xlx_angle_tmp_vec.size()];
  for (int i = 0; i < __xlx_angle_tmp_vec.size(); ++i) {
    __xlx_angle_input_buffer[i] = __xlx_angle_tmp_vec[i];
  }
  //Create input buffer for sinus_1
  ap_apatb_sinus_1_V_cap_bc = __xlx_sinus_1_V_size_Reader.read_size();
  int* __xlx_sinus_1_input_buffer= new int[ap_apatb_sinus_1_V_cap_bc];
  //Create input buffer for sinus_2
  ap_apatb_sinus_2_V_cap_bc = __xlx_sinus_2_V_size_Reader.read_size();
  int* __xlx_sinus_2_input_buffer= new int[ap_apatb_sinus_2_V_cap_bc];
  // DUT call
  sinus(__xlx_apatb_param_start, __xlx_apatb_param_debug, __xlx_apatb_param_step, __xlx_angle_input_buffer, __xlx_sinus_1_input_buffer, __xlx_sinus_2_input_buffer);
  for (unsigned i = 0; i <ap_apatb_sinus_1_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_sinus_1)->write(__xlx_sinus_1_input_buffer[i]);
  for (unsigned i = 0; i <ap_apatb_sinus_2_V_cap_bc; ++i)
    ((hls::stream<int>*)__xlx_apatb_param_sinus_2)->write(__xlx_sinus_2_input_buffer[i]);
}
