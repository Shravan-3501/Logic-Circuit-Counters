module SRFF(S,R,Q,Q_bar,CLK);
    input S,R,CLK;
    output Q,Q_bar;
    reg Q,Q_bar;
    

    always@(posedge CLK)
        if(S == 0 && R == 1) begin
            Q = 0;
            Q_bar = 1;
        end else if(S == 1 && R == 0) begin
            Q = 1;
            Q_bar = 0;
        end 
endmodule   