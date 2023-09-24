class first;
    int data = 12;
endclass

class second;
    int ds = 34;

    first f1;

    function new();
        f1 = new();
    endfunction
endclass

module tb;

    second s1, s2;

    initial begin
        s1 = new();//constructor

        s1.ds = 45;//processing

        s2 = new s1;//copying (only data members of s1 will have independent copy, not the class handler f1)

        $display("value of ds: %0d", s2.ds);

        s2.ds = 78;//changing datamember will not reflect in s1;

        $display("value of ds: %0d", s1.ds);

        s2.f1.data = 56;//now changing through s2.f1 will also reflect in s1.f1;

        $display("value of data: %0d", s1.f1.data);//both the s1 and s2 works on the same handler
////////*********So this is called shallow copy:- s2 = new s1;
    end

endmodule

//In shallow copy we donot get another copy of class handler but we do get an independent another copy of datamembers;
//So in deep copy we get another copy of both class and data members also. 