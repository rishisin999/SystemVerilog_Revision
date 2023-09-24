`timescale 1ns/1ps

module tb ();
    reg clk = 0;
    reg clk50 = 0;

    always #5 clk = ~clk;// 100 MHz

    real phase = 10;
    real Ton = 5;
    real Toff = 5;

    task calc(
        input real freq_hz,
        input real duty_cycle,
        input real phase,
        output real pout,
        output real ton,
        output real toff
    );
        pout = phase;
        ton = (1.0/freq_hz)*duty_cycle*1000_000_000;
        toff = (1000_000_000/freq_hz) - ton;
    endtask

    // initial begin
    //     #phase;
    //     while (1) begin
    //         clk50 = 1;
    //         #Ton;
    //         clk50 = 0;
    //         #Toff;
    //     end
    // end

    //the above code is somewhat fixed we can make it reusable by using task and functions.
    task clkgen(input real phase, input real ton, input real toff);
        @(posedge clk);//below code will only be executed until posedge of clk is reached.
        #phase;
        while (1) begin
            clk50 = 1;
            #ton;
            clk50;
            #toff;
        end
    endtask

    initial begin
        calc(1000_000_000, 0.5, 7, phase, ton, toff);
        clkgen(phase, ton, toff);
    end

    initial begin
        #200;
        $finish();
    end
endmodule