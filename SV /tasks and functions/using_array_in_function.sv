/*
remember this is not C++. Here in SV if you pass by value an array it will make whole copy of array.
So it might take a lot of space as if an array has very large space like 1000 elements.
Hence we should try to always use 'pass by ref' in case of an array.
*/

module tb();

    bit [3:0] res[16];

    function automatic void init_arr(ref bit [3:0] arr[16]);
        for (int i = 0; i<=15; i++) begin
            arr[i] = i;
        end
    endfunction

    initial begin
        init_arr(res);
        for (int i = 0; i<=15; i++) begin
            $display("res[%0d] = %0d", i, res[i]);
        end
    end

endmodule

`timescale 1ns/1ns
module tb();

    bit [7:0] res[32];

    function automatic void multiple_of_8(ref bit [7:0] arr[32]);
        for (int i = 0; i<32; i++) begin
            arr[i] = 8*i;
        end
    endfunction

    function automatic void display_arr(const ref bit [7:0] a[32]);
        for (int i = 0; i<32; i++) begin
            $display("Value of res[%0d] = %0d", i, a[i]);
        end
    endfunction

    initial begin
        multiple_of_8(res);
        display_arr(res);
    end
endmodule