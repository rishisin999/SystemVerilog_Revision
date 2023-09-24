class parent_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Base: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass

class child_trans extends parent_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Child: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass

module class_example;
  initial begin
    parent_trans p_tr;
    child_trans c_tr;//it is always necessary to first instantiate all the handles 
    
    p_tr = new();//and then allocate memory. If you allocate this memory before c_tr handle it will give error
    c_tr = new();
    
    p_tr.data = 100;
    p_tr.id = 1;

    c_tr.data = 200;
    c_tr.id = 2;
    
    p_tr.display();
    c_tr.display();
  end
endmodule

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class first;

  int data = 12;

  function void display();
    $display("Value of data: %0d", data);
  endfunction

endclass

class second extends first;
  int tmp = 34;

  function void add4();
    $display("value afer process: %0d", tmp+4);
  endfunction
endclass

module tb ();
  second s;

  initial begin
    s = new();
    $display("Value of data: %0d", s.data);
    s.display();
    $display("Value of data: %0d", s.tmp);
    s.add();
  end
endmodule