module debounce(
    input A,
    input CLOCK,
    output SIGNAL
    );
    
    wire dff1out, dff2out;
    my_dff dff1 (CLOCK, A, dff1out);
    my_dff dff2 (CLOCK, dff1out, dff2out);
   
    and(SIGNAL, dff1out, !dff2out);
endmodule
    
