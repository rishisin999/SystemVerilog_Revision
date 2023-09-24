`timescale 1ns/1ns

module tb ();
    
    ///default direction : input
    /*task add(input bit [3:0] a, input bit [3:0] b, output bit [4:0] y);
        y = a + b;
    endtask*/

    bit [3:0] a,b;
    bit [4:0] y;

    bit clk = 0;

    always #10 clk = ~clk;// 20ns --> 50 MHz

    task add();
        y = a + b;
        $display("a = %0d, b = %0d, y = %0d", a, b, y);
    endtask

    task stim_a_b();
        a = 1;
        b = 3;
        add();
        #10;
        a = 5;
        b = 6;
        add();
        #10;
        a = 7;
        b = 8;
        add();
        #10;
    endtask 

    task stim_clk();
        @(posedge clk);   //wait
        a = $urandom();
        b = $urandom();
        add();
    endtask 

    initial begin
        #110;
        $finish();
    end

    initial begin
        // stim_a_b();
        for (int i = 0; i<10; i++) begin
            stim_clk;
        end
    end

endmodule

`timescale 1ns/1ns

module tb ();
    bit [5:0] addr;
    bit wr, en;
    bit clk = 0;

    always #20 clk = ~clk;// 40ns --> 25MHz

    task stimulus();
        @(posedge clk);
        addr = 12;
        wr = 1;
        en = 1;

        @(posedge clk);
        addr = 14;
        wr = 1;
        en = 1;

        @(posedge clk);
        addr = 23;
        wr = 0;
        en = 1;

        @(posedge clk);
        addr = 48;
        wr = 0;
        en = 1;

        @(posedge clk);
        addr = 56;
        wr = 0;
        en = 0;
    endtask 

    initial begin
        #300;
        $finish();
    end

    initial begin
        stimulus();
    end
endmodule