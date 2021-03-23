`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  LAB SESSION DAY: MONDAY P.M
//
//  STUDENT A NAME: Theodore Pinto
//  STUDENT A MATRICULATION NUMBER: A0199277H
//
//  STUDENT B NAME: Tolentino Abner Jr Morales
//  STUDENT B MATRICULATION NUMBER: A0201438N
//
//////////////////////////////////////////////////////////////////////////////////

module Top_Student (
    input  J_MIC3_Pin3,  
    output J_MIC3_Pin1,  
    output J_MIC3_Pin4,  
   
    input CLK100MHZ,
    input btnC,btnU,btnD,btnL,btnR,
    output [7:0] JC,
    
    input [15:0] sw,
    output [15:0] led,
    
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    parameter TICTAC = 0, WHACKO = 1, RAND =2, HANGMAN =3, GENERAL = 4, MAIN =5, PLATFORMER = 6; 
    
    wire _6_25mhz, _381hz;
    wire dbtnC,dbtnU,dbtnD,dbtnL,dbtnR;
    
    wire frame_begin,sample_pixel;
    wire [12:0] pixel_index;
    wire sending_pixels;
    wire [4:0] teststate;
    wire CLK20KHZ,_5hz;
    wire [11:0] mic_data;
    wire [15:0] oled_data;
    
    wire [6:0] disp_x;
    wire [5:0] disp_y;
    
    wire [15:0]oled_general;
    wire [1:0] bordermode;
    wire volumebarmode;
    wire [1:0] colorschememode;
    wire freeze;
    wire [15:0] oled1,oled2,oled3,oled_tictac,oled_data_menu,oled_data_wfreeze;
    wire [15:0] oled_platformer,led_platformer;
    wire dgbtnC, dgbtnU, dgbtnD, dgbtnL, dgbtnR;
    wire [6:0]platformer_distleft;
    ToPixel(pixel_index, disp_x, disp_y); // note this is zero indexed
    
    // THEO GAME VARS
    wire [15:0] oled_evo, led_data_on, led_data_off, led_data, led_random, led_whacko, led_runman;
    wire _7hz, _1hz, _0_25hz, high_hz, med_hz, slow_hz,_3hz;
    wire [3:0] an_data, an_random, an_whacko, an_runman;
    wire [6:0] seg_data, seg_random, seg_whacko, seg_runman;
    // THEO AUDIO 7 SEG LEVEL DISPLAY
    wire[6:0] number_tens, number_ones, tens_random, ones_random;
    // THEO AUDIO MODULE
    wire [11:0] peak_mic_data;
    wire [3:0] miclevel;
    
    wire [4:0] menumode;
    wire selected;
    reg [4:0]state = MAIN;
    Mainmenu menu(dbtnC, dbtnU,dbtnD,pixel_index,disp_x,disp_y, _381hz,
                  oled_data_menu, menumode,selected, miclevel);

    clk_divider _6_25mhzclk(CLK100MHZ, 7,_6_25mhz); 
    clk_divider _381hzclk(CLK100MHZ, 131232, _381hz); 
    clk_divider _20khzclk(CLK100MHZ, 2499, CLK20KHZ);
    clk_divider _5hzclk(CLK100MHZ, 9999999, _5hz);
    clk_divider _3hzclk(CLK100MHZ, 16666666, _3hz);


    clk_divider _7hzclk(CLK100MHZ, 7142856, _7hz);
    clk_divider highclk(CLK100MHZ, 833333, high_hz);   // 60hz
    clk_divider  medclk(CLK100MHZ, 1111110, med_hz);   // 45hz
    clk_divider slowclk(CLK100MHZ, 2499999, slow_hz); // 20hz
    
    debounce debouncec(btnC, _381hz, dbtnC);
    debounce debounceu(btnU, _381hz, dbtnU);
    debounce debounced(btnD, _381hz, dbtnD);
    debounce debouncel(btnL, _381hz, dbtnL);
    debounce debouncer(btnR, _381hz, dbtnR);
    
    assign dgbtnC = (state == TICTAC) ? dbtnC : 0; 
    assign dgbtnU = (state == TICTAC) ? dbtnU : 0;
    assign dgbtnD = (state == TICTAC) ? dbtnD : 0;
    assign dgbtnL = (state == TICTAC) ? dbtnL : 0;
    assign dgbtnR = (state == TICTAC) ? dbtnR : 0;
 
    wire exitTicTac, exitGeneral;
     
    wire resetOled;
    assign resetOled = (state == TICTAC) ? 0 : dbtnC;  // this is so that display doesn't reset when btnC is pressed in game mode
    Oled_Display my_display(_6_25mhz, resetOled, frame_begin, sending_pixels,
    sample_pixel, pixel_index, oled_data_wfreeze, JC[0], JC[1], JC[3], JC[4], JC[5], JC[6],
    JC[7],teststate);
    
    Audio_Capture catch(CLK100MHZ, CLK20KHZ, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_data);           
  
    peak_generator pgens(CLK20KHZ,mic_data, peak_mic_data);  // 5Hz
    miclevels mlevels(peak_mic_data,CLK20KHZ, miclevel);
   
    assign bordermode = (state == GENERAL) ? sw[15] ? (sw[14] ? 2 : 1) : (sw[14] ? 2: 0) : 0;  // 0 is disabled, 1 is 1p mode, 2 is 3 pixmode
    assign volumebarmode = sw[13] ? 1 : 0;    // 0 disable , 1 enabled
    volumebar col1(bordermode, volumebarmode,disp_x,disp_y,oled1,miclevel);
    volumebar1 col2(bordermode, volumebarmode,disp_x,disp_y,oled2,miclevel);
    volumebar2 col3(bordermode, volumebarmode,disp_x,disp_y,oled3,miclevel);
    
    assign colorschememode = sw[12] ? (sw[11] ? 2 : 1) : (sw[11] ? 2 : 0);
    _3_1_16bitMUX colorscheme(oled_general, oled1, oled2, oled3, colorschememode);
    
    // NEVER TURN OFF THE FREEZER AS IT OUTPUTS OLED DISPLAY DATA
    assign freeze = (sw[9]&&state == GENERAL) ? 1 : 0;
    freezer fridge(oled_data, CLK100MHZ, freeze, pixel_index, oled_data_wfreeze); 
    tictac tactic(dgbtnU, dgbtnD, dgbtnL, dgbtnR, dgbtnC,disp_x,disp_y,_381hz,oled_tictac, pixel_index);
        
        // THEO GAMES
        random_game game1(peak_mic_data,CLK20KHZ, _381hz, _5hz,_7hz, high_hz, med_hz, slow_hz, dbtnC, dbtnU, dbtnD, dbtnL, dbtnR, sw[1],an_random[3:0], seg_random [6:0]);   // change discrete to peakmicdata
        whacko_game whacko(CLK20KHZ, _381hz,  _5hz, CLK100MHZ, sw[2], dbtnC, miclevel, led_whacko, an_whacko, seg_whacko);
        // 7 SEG VOLUME VALUE DISPLAY
        intensity_analysis peak(CLK20KHZ, peak_mic_data, number_tens, number_ones, led_data_on);
        display_multiple set_origin(_381hz,_3hz ,~sw[0],miclevel, number_tens, number_ones, an_data, seg_data); // IN GENERAL MODE
        // Runman                               
        run_man run(_381hz, _5hz, _7hz,sw[3], dbtnC, dbtnU, dbtnD, dbtnL, dbtnR, miclevel, an_runman, seg_runman, led_runman);                                                         
    
    
    wire dbtnUs,dbtnRs;
    signalextend signalextU(dbtnU, _381hz, dbtnUs);  // lengthen the debounced signal
    signalextend signalextR(dbtnR, _381hz, dbtnRs);
    assign exitGeneral = (dbtnUs && dbtnRs) ? 1 : 0;
    
     // FSM FOR EACH MODE
       /*  TICTACTOE 0
             Whacko  1
             Random number  3
             Hangman  4
             General one for the eval 5
             Platformer 7
         */
    always @ (posedge CLK100MHZ) begin
        if (state == MAIN) begin  // main menu mode state is 7 not 0
            if (selected) begin 
                state <= menumode;
            end
        end
        else if (state == WHACKO) begin
             if(exitGeneral) begin
                 state <=MAIN;
             end
                     
        end
        else if (state == RAND) begin 
            if(exitGeneral) begin
                state <=MAIN;
            end
        end
        else if (state == HANGMAN) begin 
            if(exitGeneral) begin
                state <=MAIN;
            end
        end
        else if (state == GENERAL) begin 
            if(exitGeneral) begin
                state <=MAIN;
            end
        end
        else if (state == TICTAC) begin 
            if(exitGeneral) begin
                state <= MAIN;
            end
        end
        else if (state == PLATFORMER) begin 
            if(exitGeneral) begin
                state <= MAIN;
            end
        end
    end 
    platformer (CLK100MHZ, dbtnC,dbtnU,dbtnD,dbtnL,dbtnR,disp_x,disp_y,pixel_index,oled_platformer,platformer_distleft); // change back to oled_platformer
    distancetoled(platformer_distleft, led_platformer);
        
    assign oled_data = (state == TICTAC)  ? oled_tictac:
                       (state == MAIN)    ? oled_data_menu:
                       (state == GENERAL) ? oled_general:
                       (state == PLATFORMER) ? oled_platformer:
                        0;
                        
    assign an = (state == RAND) ? an_random: 
                (state == WHACKO) ? an_whacko:
                (state == GENERAL) ? an_data:
                (state == HANGMAN) ? an_runman:
                4'b1111;
    assign led = (state == GENERAL) ? led_data_on : // from display_multiple module omit sw0 check
                 (state == WHACKO) ? led_whacko: 
                 (state == HANGMAN) ? led_runman:
                 (state == PLATFORMER)? led_platformer:
                  0;
    assign seg = (state == RAND) ? seg_random: 
                 (state == WHACKO) ? seg_whacko:
                 (state == GENERAL) ? seg_data:  // from display_multiple module
                 (state == HANGMAN) ? seg_runman:
                  0;
endmodule