
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
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
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0352default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
[
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 109c103ca
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.064 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0642default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place26
"menu/accmod/speedval7/count[3]_i_32default:default2
42default:default2?
?	menu/accmod/count_reg[2] {FDRE}
	menu/accmod/count_reg[1] {FDRE}
	menu/accmod/count_reg[0] {FDRE}
	menu/accmod/count_reg[3] {FDRE}
2default:defaultZ30-568h px? 
?
?A LUT '%s' is driving clock pin of %s registers. This could lead to large hold time violations. First few involved registers are:
%s524*place22
debouncec/dff2/board[8][1]_i_32default:default2
192default:default2?
?	tactic/board_reg[0][1] {FDRE}
	tactic/board_reg[3][1] {FDRE}
	tactic/board_reg[1][1] {FDRE}
	tactic/board_reg[1][0] {FDRE}
	tactic/board_reg[2][0] {FDRE}
2default:defaultZ30-568h px? 
h
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 153dda32f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:10 ; elapsed = 00:00:07 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
}

Phase %s%s
101*constraints2
1.3 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px? 
P
;Phase 1.3 Build Placer Netlist Model | Checksum: 16ffbd4ad
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:16 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
1.4 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px? 
M
8Phase 1.4 Constrain Clocks/Macros | Checksum: 16ffbd4ad
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:21 ; elapsed = 00:00:16 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
I
4Phase 1 Placer Initialization | Checksum: 16ffbd4ad
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:22 ; elapsed = 00:00:16 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
2.1 2default:default2!
Floorplanning2default:defaultZ18-101h px? 
C
.Phase 2.1 Floorplanning | Checksum: 1ba512ecb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:18 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
2.2 2default:default20
Physical Synthesis In Placer2default:defaultZ18-101h px? 
K
)No high fanout nets found in the design.
65*physynthZ32-65h px? 
?
$Optimized %s %s. Created %s new %s.
216*physynth2
02default:default2
net2default:default2
02default:default2
instance2default:defaultZ32-232h px? 
?
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12default:default2
02default:default2
net or cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:default2
02default:default2
cell2default:defaultZ32-775h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0352default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
B
-
Summary of Physical Synthesis Optimizations
*commonh px? 
B
-============================================
*commonh px? 


*commonh px? 


*commonh px? 
?
~-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Optimization       |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 
?
?|  Very High Fanout   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total              |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
-----------------------------------------------------------------------------------------------------------------------------
*commonh px? 


*commonh px? 


*commonh px? 
R
=Phase 2.2 Physical Synthesis In Placer | Checksum: 1aedab543
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:23 ; elapsed = 00:00:58 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
D
/Phase 2 Global Placement | Checksum: 1972c1371
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:25 ; elapsed = 00:01:00 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px? 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px? 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1972c1371
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:26 ; elapsed = 00:01:00 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px? 
Q
<Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: ecadf31d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:04 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px? 
L
7Phase 3.3 Area Swap Optimization | Checksum: 12200dce7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.4 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.4 Pipeline Register Optimization | Checksum: 12200dce7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px? 
K
6Phase 3.5 Timing Path Optimizer | Checksum: 12200dce7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:31 ; elapsed = 00:01:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
F
1Phase 3.6 Fast Optimization | Checksum: eaad8f2b
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:40 ; elapsed = 00:01:14 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px? 
R
=Phase 3.7 Small Shape Detail Placement | Checksum: 161a2a780
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:55 ; elapsed = 00:01:28 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px? 
H
3Phase 3.8 Re-assign LUT pins | Checksum: 1ad0d419a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:58 ; elapsed = 00:01:31 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
3.9 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px? 
T
?Phase 3.9 Pipeline Register Optimization | Checksum: 1ad0d419a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:01:59 ; elapsed = 00:01:32 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
u

Phase %s%s
101*constraints2
3.10 2default:default2%
Fast Optimization2default:defaultZ18-101h px? 
H
3Phase 3.10 Fast Optimization | Checksum: 1441925f4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:02:37 ; elapsed = 00:02:07 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
D
/Phase 3 Detail Placement | Checksum: 1441925f4
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:02:38 ; elapsed = 00:02:07 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
?

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px? 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?

Phase %s%s
101*constraints2
4.1.1 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px? 
U
@Post Placement Optimization Initialization | Checksum: 95ebcc9d
*commonh px? 
u

Phase %s%s
101*constraints2
4.1.1.1 2default:default2"
BUFG Insertion2default:defaultZ18-101h px? 
?
?BUFG insertion identified %s candidate nets, %s success, %s skipped for placement/routing, %s skipped for timing, %s skipped for netlist change reason.30*	placeflow2
02default:default2
02default:default2
02default:default2
02default:default2
02default:defaultZ46-31h px? 
G
2Phase 4.1.1.1 BUFG Insertion | Checksum: 95ebcc9d
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:02:51 ; elapsed = 00:02:16 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
?
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-2.2892default:defaultZ30-746h px? 
R
=Phase 4.1.1 Post Placement Optimization | Checksum: 587771cb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:39 ; elapsed = 00:03:03 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
M
8Phase 4.1 Post Commit Optimization | Checksum: 587771cb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:39 ; elapsed = 00:03:04 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
y

Phase %s%s
101*constraints2
4.2 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px? 
K
6Phase 4.2 Post Placement Cleanup | Checksum: 587771cb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:40 ; elapsed = 00:03:04 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
s

Phase %s%s
101*constraints2
4.3 2default:default2$
Placer Reporting2default:defaultZ18-101h px? 
E
0Phase 4.3 Placer Reporting | Checksum: 587771cb
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:40 ; elapsed = 00:03:04 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
z

Phase %s%s
101*constraints2
4.4 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px? 
L
7Phase 4.4 Final Placement Cleanup | Checksum: 4f82a2d7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:41 ; elapsed = 00:03:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
[
FPhase 4 Post Placement Optimization and Clean-Up | Checksum: 4f82a2d7
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:41 ; elapsed = 00:03:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
=
(Ending Placer Task | Checksum: 443ae946
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:03:41 ; elapsed = 00:03:05 . Memory (MB): peak = 1378.406 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
722default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:03:452default:default2
00:03:082default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
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
00:00:102default:default2
00:00:042default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
uC:/Users/Abner/Desktop/Y1Sem2/EE2026 Digital Design/Proj/SoundDisplay/SoundDisplay.runs/impl_1/Top_Student_placed.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:132default:default2
00:00:072default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 
b
%s4*runtcl2F
2Executing : report_io -file place_report_io_0.rpt
2default:defaulth px? 
?
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.189 . Memory (MB): peak = 1378.406 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2z
fExecuting : report_utilization -file place_report_utilization_0.rpt -pb place_report_utilization_0.pb
2default:defaulth px? 
?
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.468 . Memory (MB): peak = 1378.406 ; gain = 0.000
*commonh px? 
?
%s4*runtcl2d
PExecuting : report_incremental_reuse -file place_report_incremental_reuse_0.rpt
2default:defaulth px? 
x
TNo incremental reuse to report, no incremental placement and routing data was found.278*	vivadotclZ4-545h px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file place_report_timing_summary_0.rpt -pb place_report_timing_summary_0.pb -rpx place_report_timing_summary_0.rpx
2default:defaulth px? 
?
UpdateTimingParams:%s.
91*timing2R
> Speed grade: -1, Delay Type: min_max, Timing Stage: Requireds2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2+
report_timing_summary: 2default:default2
00:00:122default:default2
00:00:072default:default2
1378.4062default:default2
0.0002default:defaultZ17-268h px? 


End Record