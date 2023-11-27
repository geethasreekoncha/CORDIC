module testbench_rot();

reg signed [15:0] a0,b0;

    reg clk;
    wire signed [15:0] r,ang;

cordic_vec c1(clk,a0,b0,r,ang);

	always #5 clk = ~clk;

    initial
    begin
        clk =0;
        a0 = 0300; b0 = 0400;
        #150;
        $monitor("Time = %d, r= %d, angle = %d", $time,r,ang);
		//#100 angle = 3000; 
		#100 $finish;
		
    end
endmodule