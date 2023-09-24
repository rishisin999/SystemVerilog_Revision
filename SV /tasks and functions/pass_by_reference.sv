module tb();

    task automatic swap(const ref bit [1:0] a, ref bit b); ///function automatic bit [1:0] add (arguments);
    //now the 'a' variable is restricted to change the actual value but original value of 'b' can be changed.
    //So if you try to change 'a' then compiler will throw an error. 
        bit [1:0] tmp;

        tmp = a;
        //a = b;
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