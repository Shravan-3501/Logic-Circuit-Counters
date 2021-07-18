module DFF(D,Q,Q_bar,CLK);
    input D,CLK;
    output Q,Q_bar;
    reg Q,Q_bar;

    always@(posedge CLK)
        if(D == 0) begin
            Q = 0;
            Q_bar = 1;
        end else begin
            Q = 1;
            Q_bar = 0;
        end

endmodule   