module cordic_vec(clk,a0,b0,r,ang);
input signed[15:0]a0,b0;
input clk;
  output signed [15:0]r,ang;
  wire signed [15:0] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
  wire signed [15:0] b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16;
  wire signed [15:0] angle_x1,angle_x2,angle_x3,angle_x4,angle_x5,angle_x6,angle_x7,angle_x8,angle_x9,angle_x10,angle_x11,angle_x12,angle_x13,angle_x14,angle_x15,angle_x16;
reg signed [15:0] v;
initial
begin
v<=16'd0607;
end
  vec k1(clk,a0,b0,16'b1,4'b0,16'b0,a1,b1,angle_x1);
  vec k2(clk,a1,b1,b1,4'd1,angle_x1,a2,b2,angle_x2);
  vec k3(clk,a2,b2,b2,4'd2,angle_x2,a3,b3,angle_x3);
  vec k4(clk,a3,b3,b3,4'd3,angle_x3,a4,b4,angle_x4);
  vec k5(clk,a4,b4,b4,4'd4,angle_x4,a5,b5,angle_x5);
  vec k6(clk,a5,b5,b5,4'd5,angle_x5,a6,b6,angle_x6);
  vec k7(clk,a6,b6,b6,4'd6,angle_x6,a7,b7,angle_x7);
  vec k8(clk,a7,b7,b7,4'd7,angle_x7,a8,b8,angle_x8);
  vec k9(clk,a8,b8,b8,4'd8,angle_x8,a9,b9,angle_x9);
  vec k10(clk,a9,b9,b9,4'd9,angle_x9,a10,b10,angle_x10);
  vec k11(clk,a10,b10,b10,4'd10,angle_x10,a11,b11,angle_x11);
  vec k12(clk,a11,b11,b11,4'd11,angle_x11,a12,b12,angle_x12);
  vec k13(clk,a12,b12,b12,4'd12,angle_x12,a13,b13,angle_x13);
  vec k14(clk,a13,b13,b13,4'd13,angle_x13,a14,b14,angle_x14);
  vec k15(clk,a14,b14,b14,4'd14,angle_x14,a15,b15,angle_x15);
  vec k16(clk,a15,b15,b15,4'd15,angle_x15,a16,b16,angle_x16);
assign  r=v*a16/1000;
assign ang=angle_x16;
endmodule

  module vec(clk,a,b,z,i,angle_y,af,bf,angle_x);
    input signed [15:0]a,b,angle_y,z;
  input clk;
  input [3:0]i;
  output reg signed [15:0]af,bf,angle_x;
    reg [15:0]angle[15:0];
initial
begin
  angle[0]<=16'd45000;
  angle[1]<=16'd26570;
  angle[2]<=16'd14040;
  angle[3]<=16'd7130;
  angle[4]<=16'd3580;
  angle[5]<=16'd1790;
  angle[6]<=16'd0895;
  angle[7]<=16'd0448;
  angle[8]<=16'd0224;
  angle[9]<=16'd0112;
  angle[10]<=16'd0056;
  angle[11]<=16'd0028;
  angle[12]<=16'd0013;
  angle[13]<=16'd0007;
  angle[14]<=16'd0003;
  angle[15]<=16'd0001;
  
  end
  always@(posedge clk)
    begin
      if(z < 0)  
   begin
     af<= a - (b>>>i);
     bf<= b + (a>>>i);
     angle_x<=angle_y-angle[i];
     end
  else
    begin
      af<=a+(b>>>i);
      bf<=b-(a>>>i);
      angle_x<=angle_y+angle[i];
      end
    end 
endmodule
