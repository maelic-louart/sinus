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
	{ debug uint 1 regular  }
	{ step uint 1 regular  }
	{ angle_V int 32 regular {axi_s 0 volatile  { angle_V Data } }  }
	{ sinus_1_V int 32 regular {axi_s 1 volatile  { sinus_1_V Data } }  }
	{ sinus_2_V int 32 regular {axi_s 1 volatile  { sinus_2_V Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "start_r", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "start","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "debug", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "debug","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "step", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "step","cData": "int1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "angle_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "angle.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "sinus_1_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "sinus_1.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "sinus_2_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "sinus_2.V","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_r sc_in sc_logic 1 signal 0 } 
	{ debug sc_in sc_logic 1 signal 1 } 
	{ step sc_in sc_logic 1 signal 2 } 
	{ angle_V_TDATA sc_in sc_lv 32 signal 3 } 
	{ angle_V_TVALID sc_in sc_logic 1 invld 3 } 
	{ angle_V_TREADY sc_out sc_logic 1 inacc 3 } 
	{ sinus_1_V_TDATA sc_out sc_lv 32 signal 4 } 
	{ sinus_1_V_TVALID sc_out sc_logic 1 outvld 4 } 
	{ sinus_1_V_TREADY sc_in sc_logic 1 outacc 4 } 
	{ sinus_2_V_TDATA sc_out sc_lv 32 signal 5 } 
	{ sinus_2_V_TVALID sc_out sc_logic 1 outvld 5 } 
	{ sinus_2_V_TREADY sc_in sc_logic 1 outacc 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_r", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_r", "role": "default" }} , 
 	{ "name": "debug", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug", "role": "default" }} , 
 	{ "name": "step", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "step", "role": "default" }} , 
 	{ "name": "angle_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "angle_V", "role": "TDATA" }} , 
 	{ "name": "angle_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "angle_V", "role": "TVALID" }} , 
 	{ "name": "angle_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "angle_V", "role": "TREADY" }} , 
 	{ "name": "sinus_1_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sinus_1_V", "role": "TDATA" }} , 
 	{ "name": "sinus_1_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sinus_1_V", "role": "TVALID" }} , 
 	{ "name": "sinus_1_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "sinus_1_V", "role": "TREADY" }} , 
 	{ "name": "sinus_2_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sinus_2_V", "role": "TDATA" }} , 
 	{ "name": "sinus_2_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sinus_2_V", "role": "TVALID" }} , 
 	{ "name": "sinus_2_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "sinus_2_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "sinus",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "start_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "debug", "Type" : "None", "Direction" : "I"},
			{"Name" : "step", "Type" : "None", "Direction" : "I"},
			{"Name" : "angle_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "angle_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sinus_1_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "sinus_1_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sinus_2_V", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "sinus_2_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "sin_table", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sin_table_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_angle_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_sinus_1_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_sinus_2_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	sinus {
		start_r {Type I LastRead 0 FirstWrite -1}
		debug {Type I LastRead 0 FirstWrite -1}
		step {Type I LastRead 0 FirstWrite -1}
		angle_V {Type I LastRead 0 FirstWrite -1}
		sinus_1_V {Type O LastRead -1 FirstWrite 2}
		sinus_2_V {Type O LastRead -1 FirstWrite 2}
		sin_table {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	start_r { ap_none {  { start_r in_data 0 1 } } }
	debug { ap_none {  { debug in_data 0 1 } } }
	step { ap_none {  { step in_data 0 1 } } }
	angle_V { axis {  { angle_V_TDATA in_data 0 32 }  { angle_V_TVALID in_vld 0 1 }  { angle_V_TREADY in_acc 1 1 } } }
	sinus_1_V { axis {  { sinus_1_V_TDATA out_data 1 32 }  { sinus_1_V_TVALID out_vld 1 1 }  { sinus_1_V_TREADY out_acc 0 1 } } }
	sinus_2_V { axis {  { sinus_2_V_TDATA out_data 1 32 }  { sinus_2_V_TVALID out_vld 1 1 }  { sinus_2_V_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
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
