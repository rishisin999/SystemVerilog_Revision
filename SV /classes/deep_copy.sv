class first;
    int data = 12;

    function second copy();
        copy = new();
        copy.data = data;
    endfunction
endclass

class second;
    int ds = 34;

    first f1;

    function new();
        f1 = new();
    endfunction

    function first copy();
        copy = new();
        copy.ds = ds;
        copy.f1 = f1.copy();
    endfunction
endclass

module tb;
    second S1, S2;//we want to copy s1 to s2;

    initial begin
        S1 = new();
        S2 = new();

        S2 = S1.copy();

        $display("Value of Sb: %0d", S2.ds);

        S2.ds = 78;
        $display("Value of Sb: %0d", S1.ds);

        S2.f1.data = 98;

        $display("Value of Sb: %0d", S1.f1.data);//now the changes will not be reflected
    end

endmodule////hence we do deep copy through custom methods