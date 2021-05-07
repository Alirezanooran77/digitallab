module decoder_nooran(w,en,y);
input [3:0]w;
input en;
output reg [0:15]y;
integer k;
always @(w,en)
  for(k=0;k<=15;k=k+1)
    if((w == k)&&(en == 1))
      y[k]=1;
    else
      y[k]=0;
endmodule

module decoder_test_bench;
wire a,b,c;
decoder_nooran(a,b,c);

initial
begin
  a=1'b0000;
  #100;
  b=1'b0;
  #100;
end
