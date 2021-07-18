module simulator_counter_SRFF;
    reg Sa,Ra,Sb,Rb,Sc,Rc,Sd,Rd,CLK; wire Qa,Qa_bar,Qb,Qb_bar,Qc,Qc_bar,Qd,Qd_bar;
    integer i;
    SRFF FlipFlopA(Sa,Ra,Qa,Qa_bar,CLK);
    SRFF FlipFlopB(Sb,Rb,Qb,Qb_bar,CLK);
    SRFF FlipFlopC(Sc,Rc,Qc,Qc_bar,CLK);
    SRFF FlipFlopD(Sd,Rd,Qd,Qd_bar,CLK);

initial
    begin
        $dumpfile("sim.vcd");
		$dumpvars(0, simulator_counter_SRFF);
        $monitor($time,"  Qa=%b, Qb=%b, Qc=%b, Qd=%b", Qa,Qb,Qc,Qd);

        Sa = 0;Sb = 0;Sc = 0;Sd = 0;Ra = 1;Rb = 1;Rc = 1;Rd = 1;
        #1 CLK = 1;
        for(i = 1;i<32;i++) begin
            #0.5 CLK <= ~CLK;
            
            Sa = Qb & Qc_bar & Qd_bar;
            Ra = Qb_bar & Qc_bar & Qd_bar;
        
            Sb = Qa_bar & Qc & Qd_bar;
            Rb = Qa & Qc & Qd_bar;
        
            Sc = Qd & (Qa ~^ Qb);
            Rc = Qd & (Qa ^ Qb);
        
            Sd = (Qa ~^ Qb) ^ Qc;
            Rd = Qa ^ Qb ^ Qc;
        end
        #1 $finish;
    end
endmodule
			