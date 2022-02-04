module Dffpc(clk, PR_L, CLR_L, D, Q);
    input D, clk, PR_L, CLR_L;
    output Q;
    reg Q;

    always @(posedge clk)
        if(PR_L == 0)   Q = 1;
        else if (CLR_L == 0)    Q <= 0;
        else Q <= D;

endmodule // Dffpc

module tb_Dffpc;
    reg D, clk, CLR_L, PR_L;
    wire Q;
    Dffpc inst(clk, PR_L, CLR_L, clk, Q);

    initial begin
        clk = 1'b0;
        repeat(30)  #10 clk = ~clk;
    end

    initial begin
        D = 1'b0; CLR_L = 1'b1; PR_L = 1'b1;
        #15 D = 1'b1;
        #20 D = 1'b0;
        #20 D = 1'b1;
        #20 CLR_L = 1'b0;
        #20 CLR_L = 1'b1; PR_L = 1'b0;
        #20 CLR_L = 1'b1;
        #10 CLR_L = 1'b0;
        #20 CLR_L = 1'b1;
        #100 $finish;
    end

endmodule // tb_Dffpc