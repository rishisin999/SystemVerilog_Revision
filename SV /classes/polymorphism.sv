class first;  ///parent class
      int data = 12;
      
      virtual function void display();
         $display("FIRST : Value of data : %0d", data);
      endfunction
      
endclass
     
class second extends first; //child class
      int temp = 34;
      
      function void add();
        $display("secomd:Value after process : %0d", temp+4);
      endfunction
      
      function void display();
        $display("SECOND : Value of data : %0d", data);
      endfunction    
endclass
     
module tb;
      first f;
      second s;
      
      initial begin
        f = new();
        s = new();
        
        f = s;//***Assign extended class handle to base class handle.
        f.display(); //now display func of extended class will be overrided in display func of base class due to virtual keyword otherwise it will not override.
      end
endmodule

//Output in console:
//'SECOND' : Value of data : 12  |_/
//not- FIRST : value of data : 12 X