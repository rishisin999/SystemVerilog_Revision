module tb();

    task swap(input bit [1:0] a, b);
        bit [1:0] tmp;

        tmp = a;
        a = b;
        b = tmp;

        $display("Value of a = %0d, b = %0d",a , b);
    endtask

    bit [1:0] a, b;

    initial begin
        a = 1;
        b = 2;
        swap(a,b);

        $display("Value of a = %0d, b = %0d",a , b);
    end

endmodule