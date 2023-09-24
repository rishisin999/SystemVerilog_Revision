class;
    int data;
endclass

module tb ();
    first f1;
    first p1;

    initial begin
        f1 = new();   ////1.constructor
        /////////////
        f1.data = 24; ////2. processing
        ////////////
        p1 = new f1;  ////3. copying data from f1 to p1 (a whole new memory is allocated to p1 with values copied from f1)
//p1 and f1 are two different handles with different memories allocated, not that the same memory is allocated. 
//So any change in value of variables in p1 will not reflect in f1.
//It means there are independent variables present in both the objects f1 and p1. Only thing we did is just copied the value of data members of f1 to p1.
        ///////////
        $display("Value of data memeber: %0d", p.data);//4.processing

        //remember above 4 steps.
    end
endmodule