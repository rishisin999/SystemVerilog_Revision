    class first; ////////////parent class
      int data;
      
      function new(input int data);
        this.data = data;  
      endfunction
      
      
    endclass
     
    class second extends first;
      int temp;
      
      function new(int data, int temp);
        super.new(data);//it is used to distinguish the constructor b/w base and child class. It is necessary to give if you have a new function inside base class with an argument.
        this.temp = temp;
      endfunction
      
    endclass
     
    module tb;
      second s;
      
      initial begin
        s = new(67, 45);
        $display("Value of data : %0d and Temp : %0d", s.data, s.temp);
      end
      
    endmodule