module Mainmenu(
    input btnc, btnu,btnd,
    input [12:0] pixels,  
    input [6:0] x,
    input [5:0]y,
    input CLOCK, // 381HZ EXPECTED
    output reg [15:0]oled,
    output reg [4:0] mode = 0,  // correspond to all the different state in the machine
    output reg done = 0,
    input [3:0]miclevel
    );
    parameter MAXMODES = 6;  // TOTAL NUMBER OF MODES-1
     parameter TICTAC = 0, WHACKO = 1, RAND =2, HANGMAN =3, GENERAL = 4, MAIN =5, PLATFORMER = 6;
    reg [4:0] selection = 0; // try again
    
    wire [3:0] micselect; //between the non main menu modes
    wire micmode;
    
    //ACCELERATION
    acceleration accmod(miclevel, CLOCK, micmode, micselect);
    
    always @ (posedge CLOCK) begin // may need slower clock as a "1" is held for quite long may read it twice
        mode <= btnc? selection : mode;
        done <= btnc? 1: 0; // used by FSM in TOP
        // option to blow through or up down for selection
        selection <= micmode ? micselect:
                    btnu ? ((selection == 0)? MAXMODES: (selection == MAIN +1)? selection -2 :selection - 1):
                    btnd? ((selection == MAXMODES) ? 0 : (selection == MAIN-1) ? selection + 2: selection + 1):  
                    selection;
    end
    
    //back ground
    wire [15:0]menupixel;
    mainmenubg menu(pixels, menupixel);
    
    // text pixels
    wire [15:0] textout0, textout1,textout2,textout3,textout4,textout5,textout6,textout7;
    text0  text0(pixels, x,y ,textout0);
    text1  text1(pixels, x,y ,textout1);
    text3  text3(pixels, x,y ,textout3);
    text4  text4(pixels, x,y ,textout4);
    text5  text5(pixels, x,y ,textout5);
    text6  text6(pixels, x,y ,textout6);
    
    always @(*) begin
        // BACKGROUND 
        oled = menupixel;  
        //TEXT
        if (x >= 19 && x <=78 && y >=20 && y <= 43)begin
            if (selection == TICTAC)  
                oled = textout0;
            else if (selection == WHACKO)
                oled = textout1;
             else if (selection == RAND)
                oled = textout3;
             else if (selection == HANGMAN)
                oled = textout4;
             else if (selection == GENERAL)
                oled = textout5;
             else if (selection == PLATFORMER)
                oled = textout6;
        end 
    end    
    // DEBUG
    // assign led = micselect;
endmodule

