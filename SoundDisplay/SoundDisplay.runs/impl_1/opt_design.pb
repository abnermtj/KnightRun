
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px? 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px? 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1210.727 ; gain = 12.0162default:defaulth px? 
g

Starting %s Task
103*constraints2,
Cache Timing Information2default:defaultZ18-103h px? 
P
;Ending Cache Timing Information Task | Checksum: 1a0e9c954
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.008 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px? 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px? 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
202default:defaultZ31-138h px? 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px? 
;
&Phase 1 Retarget | Checksum: c7aa93ce
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
02default:default2
02default:defaultZ31-389h px? 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
H
3Phase 2 Constant propagation | Checksum: 15f4010f5
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
22default:default2
42default:defaultZ31-389h px? 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px? 
9
$Phase 3 Sweep | Checksum: 10870c8a3
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
02default:defaultZ31-389h px? 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px? 
E
0Phase 4 BUFG optimization | Checksum: 10870c8a3
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:09 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
02default:default2
02default:default2
02default:defaultZ31-662h px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px? 
O
:Phase 5 Shift Register Optimization | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px? 
x

Phase %s%s
101*constraints2
6 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px? 
K
6Phase 6 Post Processing Netlist | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
?
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
02default:defaultZ31-389h px? 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.180 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
J
5Ending Logic Optimization Task | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:12 ; elapsed = 00:00:12 . Memory (MB): peak = 1210.727 ; gain = 0.0002default:defaulth px? 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px? 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px? 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px? 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
-2.8582default:default2
-39.9752default:defaultZ32-619h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 


*pwropth px? 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px? 
?
?WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
42default:defaultZ34-162h px? 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px? 
?
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
02default:default2
02default:default2
82default:defaultZ34-65h px? 
N
9Ending PowerOpt Patch Enables Task | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.198 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
J
5Ending Power Optimization Task | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:26 ; elapsed = 00:00:16 . Memory (MB): peak = 1378.406 ; gain = 167.6802default:defaulth px? 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px? 
E
0Ending Final Cleanup Task | Checksum: 1d156e23b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
352default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px? 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
opt_design: 2default:default2
00:00:422default:default2
00:00:302default:default2
1378.4062default:default2
179.6952default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.1132default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
rC:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/Top_Student_opt.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:082default:default2
00:00:062default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2x
dExecuting : report_drc -file opt_report_drc_0.rpt -pb opt_report_drc_0.pb -rpx opt_report_drc_0.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2k
Wreport_drc -file opt_report_drc_0.rpt -pb opt_report_drc_0.pb -rpx opt_report_drc_0.rpx2default:defaultZ4-113h px? 
>
Refreshing IP repositories
234*coregenZ19-234h px? 
G
"No user IP repositories specified
1154*coregenZ19-1704h px? 
|
"Loaded Vivado IP repository '%s'.
1332*coregen23
C:/Xilinx/Vivado/2018.2/data/ip2default:defaultZ19-2313h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
sC:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/opt_report_drc_0.rptsC:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/opt_report_drc_0.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:122default:default2
00:00:102default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2v
bExecuting : report_utilization -file opt_report_utilization_0.rpt -pb opt_report_utilization_0.pb
2default:defaulth px? 
?
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.248 . Memory (MB): peak = 1378.406 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2?
?Executing : report_methodology -file opt_report_methodology_0.rpt -pb opt_report_methodology_0.pb -rpx opt_report_methodology_0.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
wreport_methodology -file opt_report_methodology_0.rpt -pb opt_report_methodology_0.pb -rpx opt_report_methodology_0.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
{C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/opt_report_methodology_0.rpt{C:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/opt_report_methodology_0.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:172default:default2
00:00:102default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file opt_report_timing_summary_0.rpt -pb opt_report_timing_summary_0.pb -rpx opt_report_timing_summary_0.rpx
2default:defaulth px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -1, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
|
%s4*runtcl2`
LExecuting : report_high_fanout_nets -file opt_report_high_fanout_nets_0.rpt
2default:defaulth px? 
?
ureport_high_fanout_nets: Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 1378.406 ; gain = 0.000
*commonh px? 
}
%s4*runtcl2a
MExecuting : report_control_sets -verbose -file opt_report_control_sets_0.rpt
2default:defaulth px? 
?
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.116 . Memory (MB): peak = 1378.406 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2x
dExecuting : report_design_analysis -logic_level_distribution -file opt_report_design_analysis_0.rpt
2default:defaulth px? 
?
ReportTimingParams:%s.
78*timing2M
9 -max_paths 1000 -nworst 1 -delay_type max -sort_by slack2default:defaultZ38-78hpx? 


End Record