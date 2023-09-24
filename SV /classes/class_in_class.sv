class first;
    local int data = 34;//private member not public
  
    task set(input int data);
        this.data = data;
    endtask
  
    function int get();
        return data;
    endfunction

    task display();
        $display("value of data = %0d", data);
    endtask
endclass

class second;

    first f1;

    function new();
        f1 = new();
    endfunction

endclass

module tb ();

    second s;

    initial begin
        s = new();
        //s.f1.display();
      
      //s.f1.data = 45;//we cant access private member outside class's scope
        s.f1.set(123);//define set task to access and update the private members
        $display("value of data = %0d", s.f1.get());//get function to retrieve data of private members
        s.f1.display();
    end
    
endmodule