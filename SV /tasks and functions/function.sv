module tb ();
    bit [4:0] res = 0;
    bit [3:0] ain = 4'b0100;
    bit [3:0] bin = 4'b0010;

    function [4:0] bit add(/*input bit [3:0] a = 4'b0100, b = 4'b0010*/);
        return ain + bin;
    endfunction

    function void display_ain_bin;
        $display("Value of a = %0d, b = %0d", ain, bin);;
    endfunction

    initial begin
        res = add(ain, bin);
        display_ain_bin();
        //$display("value of addition : %0d", res);
    end
endmodule

module tb ();

    int unsigned res = 0;
    int unsigned ain = 3, bin = 2;

    function int unsigned mul(input int unsigned a = 3, b = 2);
        return a*b;
    endfunction

    initial begin
        res = mul(ain, bin);
        if (res == ain*bin) begin
            $display("Test Passed");
        end else begin
            $display("Test Failed");
        end
    end
    
endmodule