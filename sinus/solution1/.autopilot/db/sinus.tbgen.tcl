set moduleName sinus
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {sinus}
set C_modelType { void 0 }
set C_modelArgList {
	{ start_r uint 1 regular  }
	{ step uint 1 regular  }
	{ signal_1_V int 32 regular {fifo 1 volatile }  }
	{ signal_2_V int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "start_r", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "start","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "step", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "step","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "signal_1_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "signal_1.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "signal_2_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "signal_2.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_r sc_in sc_logic 1 signal 0 } 
	{ step sc_in sc_logic 1 signal 1 } 
	{ signal_1_V_din sc_out sc_lv 32 signal 2 } 
	{ signal_1_V_full_n sc_in sc_logic 1 signal 2 } 
	{ signal_1_V_write sc_out sc_logic 1 signal 2 } 
	{ signal_2_V_din sc_out sc_lv 32 signal 3 } 
	{ signal_2_V_full_n sc_in sc_logic 1 signal 3 } 
	{ signal_2_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_r", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_r", "role": "default" }} , 
 	{ "name": "step", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "step", "role": "default" }} , 
 	{ "name": "signal_1_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "signal_1_V", "role": "din" }} , 
 	{ "name": "signal_1_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "signal_1_V", "role": "full_n" }} , 
 	{ "name": "signal_1_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "signal_1_V", "role": "write" }} , 
 	{ "name": "signal_2_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "signal_2_V", "role": "din" }} , 
 	{ "name": "signal_2_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "signal_2_V", "role": "full_n" }} , 
 	{ "name": "signal_2_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "signal_2_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "sinus",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "start_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "step", "Type" : "None", "Direction" : "I"},
			{"Name" : "signal_1_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "signal_1_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "signal_2_V", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "signal_2_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "start_tmp", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "n", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "sin_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sin_table_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sinus {
		start_r {Type I LastRead 0 FirstWrite -1}
		step {Type I LastRead 0 FirstWrite -1}
		signal_1_V {Type O LastRead -1 FirstWrite 1}
		signal_2_V {Type O LastRead -1 FirstWrite 1}
		guard_variable_for_sinus_bool_bool_stream_int_0_stream_int_0_start_tmp {Type IO LastRead -1 FirstWrite -1}
		start_tmp {Type IO LastRead -1 FirstWrite -1}
		n {Type IO LastRead -1 FirstWrite -1}
		sin_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	start_r { ap_none {  { start_r in_data 0 1 } } }
	step { ap_none {  { step in_data 0 1 } } }
	signal_1_V { ap_fifo {  { signal_1_V_din fifo_data 1 32 }  { signal_1_V_full_n fifo_status 0 1 }  { signal_1_V_write fifo_update 1 1 } } }
	signal_2_V { ap_fifo {  { signal_2_V_din fifo_data 1 32 }  { signal_2_V_full_n fifo_status 0 1 }  { signal_2_V_write fifo_update 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	signal_1_V { fifo_write 1 has_conditional }
	signal_2_V { fifo_write 1 has_conditional }
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
