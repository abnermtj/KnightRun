# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}


start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35tcpg236-1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir {C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.cache/wt} [current_project]
  set_property parent.project_path {C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.xpr} [current_project]
  set_property ip_output_repo {{C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.cache/ip}} [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  add_files -quiet {{C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/synth_1/Top_Student.dcp}}
  read_xdc {{C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.srcs/constrs_1/new/Basys3_Master.xdc}}
  link_design -top Top_Student -part xc7a35tcpg236-1
  create_report "impl_1_init_report_timing_summary_0" "report_timing_summary -max_paths 10 -file init_report_timing_summary_0.rpt -pb init_report_timing_summary_0.pb -rpx init_report_timing_summary_0.rpx"
  create_report "impl_1_init_report_utilization_0" "report_utilization -file init_report_utilization_0.rpt -pb init_report_utilization_0.pb"
  create_report "impl_1_init_report_high_fanout_nets_0" "report_high_fanout_nets -file init_report_high_fanout_nets_0.rpt"
  create_report "impl_1_init_report_control_sets_0" "report_control_sets -file init_report_control_sets_0.rpt"
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Top_Student_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file opt_report_drc_0.rpt -pb opt_report_drc_0.pb -rpx opt_report_drc_0.rpx"
  create_report "impl_1_opt_report_utilization_0" "report_utilization -file opt_report_utilization_0.rpt -pb opt_report_utilization_0.pb"
  create_report "impl_1_opt_report_methodology_0" "report_methodology -file opt_report_methodology_0.rpt -pb opt_report_methodology_0.pb -rpx opt_report_methodology_0.rpx"
  create_report "impl_1_opt_report_timing_summary_0" "report_timing_summary -max_paths 10 -file opt_report_timing_summary_0.rpt -pb opt_report_timing_summary_0.pb -rpx opt_report_timing_summary_0.rpx"
  create_report "impl_1_opt_report_high_fanout_nets_0" "report_high_fanout_nets -file opt_report_high_fanout_nets_0.rpt"
  create_report "impl_1_opt_report_control_sets_0" "report_control_sets -verbose -file opt_report_control_sets_0.rpt"
  create_report "impl_1_opt_report_design_analysis_0" "report_design_analysis -logic_level_distribution -file opt_report_design_analysis_0.rpt"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force Top_Student_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file place_report_io_0.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file place_report_utilization_0.rpt -pb place_report_utilization_0.pb"
  create_report "impl_1_place_report_incremental_reuse_0" "report_incremental_reuse -file place_report_incremental_reuse_0.rpt"
  create_report "impl_1_place_report_timing_summary_0" "report_timing_summary -max_paths 10 -file place_report_timing_summary_0.rpt -pb place_report_timing_summary_0.pb -rpx place_report_timing_summary_0.rpx"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Top_Student_routed.dcp
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file route_report_clock_utilization_0.rpt"
  create_report "impl_1_route_report_drc_0" "report_drc -file route_report_drc_0.rpt -pb route_report_drc_0.pb -rpx route_report_drc_0.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file route_report_power_0.rpt -pb route_report_power_summary_0.pb -rpx route_report_power_0.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file route_report_route_status_0.rpt -pb route_report_route_status_0.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -warn_on_violation -file route_report_timing_summary_0.rpt -pb route_report_timing_summary_0.pb -rpx route_report_timing_summary_0.rpx"
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file route_report_incremental_reuse_0.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file route_report_bus_skew_0.rpt -pb route_report_bus_skew_0.pb -rpx route_report_bus_skew_0.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Top_Student_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Top_Student.mmi }
  write_bitstream -force Top_Student.bit 
  catch {write_debug_probes -quiet -force Top_Student}
  catch {file copy -force Top_Student.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}
