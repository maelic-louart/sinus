#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_start "../tv/cdatafile/c.sinus.autotvin_start_r.dat"
#define AUTOTB_TVOUT_start "../tv/cdatafile/c.sinus.autotvout_start_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_debug "../tv/cdatafile/c.sinus.autotvin_debug.dat"
#define AUTOTB_TVOUT_debug "../tv/cdatafile/c.sinus.autotvout_debug.dat"
// wrapc file define:
#define AUTOTB_TVIN_step "../tv/cdatafile/c.sinus.autotvin_step.dat"
#define AUTOTB_TVOUT_step "../tv/cdatafile/c.sinus.autotvout_step.dat"
// wrapc file define:
#define AUTOTB_TVIN_angle_V "../tv/cdatafile/c.sinus.autotvin_angle_V.dat"
#define AUTOTB_TVOUT_angle_V "../tv/cdatafile/c.sinus.autotvout_angle_V.dat"
#define WRAPC_STREAM_SIZE_IN_angle_V "../tv/stream_size/stream_size_in_angle_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_angle_V "../tv/stream_size/stream_ingress_status_angle_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_sinus_1_V "../tv/cdatafile/c.sinus.autotvin_sinus_1_V.dat"
#define AUTOTB_TVOUT_sinus_1_V "../tv/cdatafile/c.sinus.autotvout_sinus_1_V.dat"
#define WRAPC_STREAM_SIZE_OUT_sinus_1_V "../tv/stream_size/stream_size_out_sinus_1_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_sinus_1_V "../tv/stream_size/stream_egress_status_sinus_1_V.dat"
// wrapc file define:
#define AUTOTB_TVIN_sinus_2_V "../tv/cdatafile/c.sinus.autotvin_sinus_2_V.dat"
#define AUTOTB_TVOUT_sinus_2_V "../tv/cdatafile/c.sinus.autotvout_sinus_2_V.dat"
#define WRAPC_STREAM_SIZE_OUT_sinus_2_V "../tv/stream_size/stream_size_out_sinus_2_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_sinus_2_V "../tv/stream_size/stream_egress_status_sinus_2_V.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_start "../tv/rtldatafile/rtl.sinus.autotvout_start_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_debug "../tv/rtldatafile/rtl.sinus.autotvout_debug.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_step "../tv/rtldatafile/rtl.sinus.autotvout_step.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_angle_V "../tv/rtldatafile/rtl.sinus.autotvout_angle_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_sinus_1_V "../tv/rtldatafile/rtl.sinus.autotvout_sinus_1_V.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_sinus_2_V "../tv/rtldatafile/rtl.sinus.autotvout_sinus_2_V.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  start_depth = 0;
  debug_depth = 0;
  step_depth = 0;
  angle_V_depth = 0;
  sinus_1_V_depth = 0;
  sinus_2_V_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{start_r " << start_depth << "}\n";
  total_list << "{debug " << debug_depth << "}\n";
  total_list << "{step " << step_depth << "}\n";
  total_list << "{angle_V " << angle_V_depth << "}\n";
  total_list << "{sinus_1_V " << sinus_1_V_depth << "}\n";
  total_list << "{sinus_2_V " << sinus_2_V_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int start_depth;
    int debug_depth;
    int step_depth;
    int angle_V_depth;
    int sinus_1_V_depth;
    int sinus_2_V_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" void sinus_hw_stub_wrapper(char, char, char, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_sinus_hw(char __xlx_apatb_param_start, char __xlx_apatb_param_debug, char __xlx_apatb_param_step, volatile void * __xlx_apatb_param_angle, volatile void * __xlx_apatb_param_sinus_1, volatile void * __xlx_apatb_param_sinus_2) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;long __xlx_apatb_param_angle_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_IN_angle_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_angle_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  for (long i = 0; i < __xlx_apatb_param_angle_V_stream_buf_final_size; ++i)((hls::stream<int>*)__xlx_apatb_param_angle)->read();
long __xlx_apatb_param_sinus_1_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_sinus_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_sinus_1_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sinus_1_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > sinus_1_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "sinus_1_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              sinus_1_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;

            ((int*)&xlx_stream_elt)[0] = sinus_1_V_pc_buffer[j].to_int64();
          ((hls::stream<int>*)__xlx_apatb_param_sinus_1)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  long __xlx_apatb_param_sinus_2_V_stream_buf_final_size;
{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(WRAPC_STREAM_SIZE_OUT_sinus_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){__xlx_apatb_param_sinus_2_V_stream_buf_final_size = atoi(AESL_token.c_str());

            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sinus_2_V);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > sinus_2_V_pc_buffer;
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "sinus_2_V");
  
            // push token into output port buffer
            if (AESL_token != "") {
              sinus_2_V_pc_buffer.push_back(AESL_token.c_str());
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {for (int j = 0, e = i; j != e; ++j) {
int xlx_stream_elt;

            ((int*)&xlx_stream_elt)[0] = sinus_2_V_pc_buffer[j].to_int64();
          ((hls::stream<int>*)__xlx_apatb_param_sinus_2)->write(xlx_stream_elt);
}
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//start
aesl_fh.touch(AUTOTB_TVIN_start);
aesl_fh.touch(AUTOTB_TVOUT_start);
//debug
aesl_fh.touch(AUTOTB_TVIN_debug);
aesl_fh.touch(AUTOTB_TVOUT_debug);
//step
aesl_fh.touch(AUTOTB_TVIN_step);
aesl_fh.touch(AUTOTB_TVOUT_step);
//angle_V
aesl_fh.touch(AUTOTB_TVIN_angle_V);
aesl_fh.touch(AUTOTB_TVOUT_angle_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_IN_angle_V);
aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_angle_V);
//sinus_1_V
aesl_fh.touch(AUTOTB_TVIN_sinus_1_V);
aesl_fh.touch(AUTOTB_TVOUT_sinus_1_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_sinus_1_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_sinus_1_V);
//sinus_2_V
aesl_fh.touch(AUTOTB_TVIN_sinus_2_V);
aesl_fh.touch(AUTOTB_TVOUT_sinus_2_V);
aesl_fh.touch(WRAPC_STREAM_SIZE_OUT_sinus_2_V);
aesl_fh.touch(WRAPC_STREAM_EGRESS_STATUS_sinus_2_V);
CodeState = DUMP_INPUTS;
// print start Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_start, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_start);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_start, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.start_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_start, __xlx_sprintf_buffer.data());
}
// print debug Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_debug, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_debug);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_debug, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.debug_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_debug, __xlx_sprintf_buffer.data());
}
// print step Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_step, __xlx_sprintf_buffer.data());
  {
    sc_bv<1> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_step);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_step, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.step_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_step, __xlx_sprintf_buffer.data());
}
std::vector<int> __xlx_apatb_param_angle_stream_buf;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_angle)->empty())
    __xlx_apatb_param_angle_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_angle)->read());
  for (int i = 0; i < __xlx_apatb_param_angle_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_angle)->write(__xlx_apatb_param_angle_stream_buf[i]);
  }
long __xlx_apatb_param_angle_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_angle)->size();
std::vector<int> __xlx_apatb_param_sinus_1_stream_buf;
long __xlx_apatb_param_sinus_1_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_sinus_1)->size();
std::vector<int> __xlx_apatb_param_sinus_2_stream_buf;
long __xlx_apatb_param_sinus_2_stream_buf_size = ((hls::stream<int>*)__xlx_apatb_param_sinus_2)->size();
CodeState = CALL_C_DUT;
sinus_hw_stub_wrapper(__xlx_apatb_param_start, __xlx_apatb_param_debug, __xlx_apatb_param_step, __xlx_apatb_param_angle, __xlx_apatb_param_sinus_1, __xlx_apatb_param_sinus_2);
CodeState = DUMP_OUTPUTS;
long __xlx_apatb_param_angle_stream_buf_final_size = __xlx_apatb_param_angle_stream_buf_size - ((hls::stream<int>*)__xlx_apatb_param_angle)->size();
// print angle_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_angle_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_angle_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv_hw;
sc_bv<32> __xlx_tmp_lv;
__xlx_tmp_lv = ((int*)&__xlx_apatb_param_angle_stream_buf[j])[0];
__xlx_tmp_lv_hw = __xlx_tmp_lv;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv_hw.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_angle_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_angle_stream_buf_final_size, &tcl_file.angle_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_angle_V, __xlx_sprintf_buffer.data());
}

// dump stream ingress status to file
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_angle_V, __xlx_sprintf_buffer.data());
  if (__xlx_apatb_param_angle_stream_buf_final_size > 0) {
  long angle_V_stream_ingress_size = __xlx_apatb_param_angle_stream_buf_size;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", angle_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_angle_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_angle_stream_buf_final_size; j != e; j++) {
    angle_V_stream_ingress_size--;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", angle_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_angle_V, __xlx_sprintf_buffer.data());
  }
} else {
  long angle_V_stream_ingress_size = 0;
sprintf(__xlx_sprintf_buffer.data(), "%d\n", angle_V_stream_ingress_size);
 aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_angle_V, __xlx_sprintf_buffer.data());
}

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_angle_V, __xlx_sprintf_buffer.data());
}{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_angle_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_angle_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_IN_angle_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_IN_angle_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_sinus_1_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_sinus_1)->size() - __xlx_apatb_param_sinus_1_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_sinus_1)->empty())
    __xlx_apatb_param_sinus_1_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_sinus_1)->read());
  for (int i = 0; i < __xlx_apatb_param_sinus_1_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_sinus_1)->write(__xlx_apatb_param_sinus_1_stream_buf[i]);
  }
// print sinus_1_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_sinus_1_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_sinus_1_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_sinus_1_stream_buf[__xlx_apatb_param_sinus_1_stream_buf_size+j])[0];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_sinus_1_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_sinus_1_stream_buf_final_size, &tcl_file.sinus_1_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_sinus_1_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_1_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_sinus_1_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_1_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_1_V, __xlx_sprintf_buffer.data());
}long __xlx_apatb_param_sinus_2_stream_buf_final_size = ((hls::stream<int>*)__xlx_apatb_param_sinus_2)->size() - __xlx_apatb_param_sinus_2_stream_buf_size;
{
  while (!((hls::stream<int>*)__xlx_apatb_param_sinus_2)->empty())
    __xlx_apatb_param_sinus_2_stream_buf.push_back(((hls::stream<int>*)__xlx_apatb_param_sinus_2)->read());
  for (int i = 0; i < __xlx_apatb_param_sinus_2_stream_buf.size(); ++i)
    ((hls::stream<int>*)__xlx_apatb_param_sinus_2)->write(__xlx_apatb_param_sinus_2_stream_buf[i]);
  }
// print sinus_2_V Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_sinus_2_V, __xlx_sprintf_buffer.data());
  for (int j = 0, e = __xlx_apatb_param_sinus_2_stream_buf_final_size; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)&__xlx_apatb_param_sinus_2_stream_buf[__xlx_apatb_param_sinus_2_stream_buf_size+j])[0];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_sinus_2_V, __xlx_sprintf_buffer.data()); 
  }

  tcl_file.set_num(__xlx_apatb_param_sinus_2_stream_buf_final_size, &tcl_file.sinus_2_V_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_sinus_2_V, __xlx_sprintf_buffer.data());
}
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_2_V, __xlx_sprintf_buffer.data());
  sprintf(__xlx_sprintf_buffer.data(), "%d\n", __xlx_apatb_param_sinus_2_stream_buf_final_size);
 aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_2_V, __xlx_sprintf_buffer.data());

  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(WRAPC_STREAM_SIZE_OUT_sinus_2_V, __xlx_sprintf_buffer.data());
}CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
