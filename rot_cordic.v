module cordic(clk,reset,start,angle,xin,yin,xout,yout);
	input wire clk;
	input wire reset;
	input wire start;
	input signed [15:0] angle;
	input signed [15:0] xin;
	input signed [15:0] yin;
	output reg signed [15:0] xout;
	output reg signed [15:0] yout;
	reg  signed [15:0] k = 16'd0607;
	wire [15:0] c [7:0];
	assign c[0] = 16'd4500;
	assign c[1] = 16'd2657;
	assign c[2] = 16'd1404;
	assign c[3] = 16'd0713;
	assign c[4] = 16'd0358;
	assign c[5] = 16'd0179;
	assign c[6] = 16'd0895;
	assign c[7] = 16'd0448;


	reg signed [15:0] x_temp;
	reg signed [15:0] y_temp;
	reg signed [15:0] angle_temp;
	reg signed [15:0] x_next;
	reg signed [15:0] y_next;
	reg signed [15:0] angle_next;
	reg [15:0] count;



	always @(posedge clk or posedge reset) begin

		if (~reset) begin
			x_temp <= xin;
			y_temp <= yin;
			angle_temp <= 16'd0000;
			count <= 16'b0;
		end 
		if (count<=8) begin
			if (angle_temp < angle ) begin
				x_temp = x_temp + (y_temp >> count);
				y_temp = y_temp - (x_temp >> count);
				angle_temp = angle_temp + c[count];
			end else begin
				x_temp = x_temp - (y_temp >> count);
				y_temp = y_temp + (x_temp >> count);
				angle_temp = angle_temp - c[count];
			end
			count = count +1;
		end
		xout <= (k*x_temp)/1000;
		yout <= (k*y_temp)/1000;

	end




endmodule



		