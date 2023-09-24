typedef enum {TRANS, RECIEVE, REPEATER } tr_type;
//fixed array
class transaction;
    bit [31:0] data;
    int id;
endclass

module class_example ();
    transaction tr[5];
    initial begin
        foreach(tr[i]) begin
            tr[i] = new();
            tr[i].data = i*i;
            tr[i].id = i+1;
        end

        foreach(tr[i]) $display("tr[%0d].data = %0d, tr[%0d].id = %0d",i,tr[i].data,i,tr[i].id);
    end
endmodule
//_______________________________________________________________________________________________________________________________

//dynamic array
module dynamic_array_objects ();
    transaction tr[];
    initial begin
        tr = new[5];
      foreach(tr[i]) begin
            tr[i] = new();
            tr[i].data = i*i;
            tr[i].id = i+1;
        end

        foreach(tr[i]) $display("tr[%0d].data = %0d, tr[%0d].id = %0d",i,tr[i].data,i,tr[i].id);
    end
endmodule

//associated array
//typedef enum {TRANS, RECIEVE, REPEATER } tr_type;
module associated_array_objects ();
    transaction tr[tr_type];
    initial begin
        tr[TRANS] = new();
        tr[RECIEVE] = new();
        tr[REPEATER] = new();

        foreach(tr[i]) begin
            tr[i].data = i*i;
            tr[i].id = i+1;
        end

        foreach(tr[i]) $display("tr[%0d].data = %0d, tr[%0d].id = %0d",i,tr[i].data,i,tr[i].id);
    end
endmodule
