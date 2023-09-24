//fork_join:- In fork-join all processes start simultaneously and join will wait for all processes to be completed
module fork_join_example(); 
  initial begin
    fork
      begin
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join
    $display("fork-join completed at time = %0t", $time);
  end
endmodule

//fork-join_any:- all processes will start simultaneously and join_any will wait for any one
//process to be completed
module fork_join_any();
  initial begin
    fork
      begin
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join_any
    $display("fork-join completed at time = %0t", $time);
  end
endmodule

//fork-join_none:- all processes start simultaneously but join_none will notwait for any process
//to be completed. fork-join_none is not blocked due to any process.
module fork_join_none();
  initial begin
    fork
      begin
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join_none
    $display("fork-join completed at time = %0t", $time);
  end 
endmodule

//disable fork:- disable fork statement terminates all outstanding or active processes.
//wait fork:- wait fork statement is used to wait for all forked processes to be completed.

module disable_fork_example;
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin // process B
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin // process C
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join_any
    disable fork;
    $display("fork-join_any completed at time = %0t", $time);
  end
endmodule

module wait_fork_example;
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin // process B
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin // process C
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join_any
    wait fork;
    $display("fork-join_any completed at time = %0t", $time);
  end
endmodule