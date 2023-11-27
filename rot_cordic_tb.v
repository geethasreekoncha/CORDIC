module cordic_tb();
    reg clk;
    reg reset;
    reg start;
    reg [15:0] angle;
	reg signed [15:0] xin;
	reg signed [15:0] yin;
	wire signed [15:0] xout;
	wire signed [15:0] yout;
    
    cordic dut(clk,reset,start,angle,xin,yin,xout,yout);
    
    always #5 clk = ~clk;
    
    initial begin
        reset =0;
        clk =0;
        angle = 16'd7500; xin = 16'd0400; yin = 16'd0300;
        $dumpfile("waveforms.vcd");
        $dumpvars(0, cordic_tb);
        $monitor("%d %d %d %d %d", clk,reset,xout, yout,dut.angle_temp);
        #5 start = 1;
        #5 start = 0;
        #5 reset = 0;
        #15 reset = 1;

        
        #330 $finish;
    end
endmodule