class first;

    int data = 34;
    bit [7:0] tmp = 8'h11;
    function first copy();
        copy = new();//to return an class object 1st we need to allocate that object via constructor new()
        copy.data = data;
        copy.tmp = tmp;
    endfunction
endclass 

module tb ();
    first f1, f2;

    initial begin
        f1 = new();
        f2 = new();

        f2 = f1.copy;
        $display("data = %0d and tmp =%0x", f2.data, f2.tmp);
    end


/*  initial begin
        f1 = new();//1.constructor

        f1.data = 54;//2.processing

        f2 = new f1;//3.copying

        f2.data = 56;
        $display("%0d", f2.data);//4.processing
    end*/
endmodule