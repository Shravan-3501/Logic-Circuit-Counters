module simulator_DFF;
    reg D3,D2,D1,D0,CLK; wire Q3,Q3_bar,Q2,Q2_bar,Q1,Q1_bar,Q0,Q0_bar;
    integer i;
    DFF FlipFlop3(D3,Q3,Q3_bar,CLK);
    DFF FlipFlop2(D2,Q2,Q2_bar,CLK);
    DFF FlipFlop1(D1,Q1,Q1_bar,CLK);
    DFF FlipFlop0(D0,Q0,Q0_bar,CLK);

initial
    begin
        $dumpfile("sim.vcd");
		$dumpvars(0, simulator_DFF);
        $monitor($time,"  Q3=%b, Q2=%b, Q1=%b, Q0=%b", Q3,Q2,Q1,Q0);

        D3 = 0;D2 = 1;D1 = 0;D0 = 0;
        #1 CLK = 1;
        for(i = 1;i<32;i++) begin
            #0.5 CLK = ~CLK;
            D3 = Q1 ^ Q0;
            D2 = Q3;
            D1 = Q2;
            D0 = Q1;
        end
        #1 $finish;
    end
endmodule
			