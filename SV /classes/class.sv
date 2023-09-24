class first;
  
  bit [2:0] data;
  bit [1:0] data2;
  
endclass

module tb;
  first f;// creating handler 
  
  initial begin
    f = new();//constructor: allocating memmory for the members and methods of the class which are initialized with there default values incase user has not specified.
    f.data = 3'b010;
    f.data2 = 2'b10;
    f = null;//deallocating the memory 
    #1;
    $display("Value of data : %0d and dat2 : %0d", f.data, f.data2);
  end
  
endmodule

//the difference between class and module is that 
//class is dynamic in nature while module is static object.
//static means module will hold the memory till whole simulation span
//dynamic means when required we allocate memory and access class's members and deallocate when not required.

class A51;
    int unsigned a, b, c;
endclass

module tb ();
    A51 f;

    initial begin
        f = new();
        f.a = 45;
        f.b = 78;
        f.c = 90;
        #1;
        $display("Value of a = %0d, b = %0d, c = %0d", f.a, f.b, f.c);
    end
endmodule