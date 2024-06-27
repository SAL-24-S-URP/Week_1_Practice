interface FSM_INTF
#(
    parameter   CNT_WIDTH      = 4
)
(
    input                       clk
);
    
    logic                       start;
    logic                       done;
    
    semaphore                   sema;
    initial begin
        sema                    = new(1);
    end

    modport master (
        input           clk,
        input           done,

        output          start
    );

    task init();
        start           = 1'b0;
    endtask

    task automatic start_fsm();
        sema.get(1);
    
        #1
        start           = 1'b1;
        @(posedge clk);
        start           = 1'b0;
        @(posedge clk);
        #1
        if(done == 1'b0) begin 
            $display("  Fail...");
            $display("/*----------------------*/");
            $finish;
        end

        @(posedge clk);
        #1
        if(done == 1'b0) begin 
            $display("  Pass!!!");
        end
        
        
        sema.put(1);
    endtask
    
endinterface