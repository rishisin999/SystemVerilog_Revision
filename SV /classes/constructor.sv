class first;
    int data1;
    bit [7:0] data2;
    shortint data3;

    function new(int data1 = 0, bit [7:0] data2 = 8'h00, shortint data3 = 0);
        this.data1 = data1;
        this.data2 = data2;
        this.data3 = data3;
    endfunction

    task display();
        $display("value of Data1 : %0d, Data2 = %0d, Data3 = %0d", data1, data2, data3);
    endtask

endclass

module tb;
    first f1; //declare handle

    initial begin
        // f1 = new(23,,35);///follow position
        f1 = new(
            .data2(4),
            .data1(23),
            .data3(5)
        );
        f1.display();
    end
endmodule

class first;

    bit [3:0] a, b, c;
    function new(bit [3:0] a = 1, b = 2, c = 4);
        this.a = a;
        this.b = b;
        this.c = c;
    endfunction //new()

    task add();
        bit [4:0] res = 0;
        res = a + b + c;
        $display("a = %0d, b = %0d, c = %0d and a+b+c = %0d",a,b,c,res);
    endtask
endclass

module tb;
    first f;

    initial begin
        f = new(1,2,4);
        f.add();
    end
endmodule