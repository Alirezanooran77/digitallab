module mux_nooran(w0,w1,s,f);
input [63:0]w0
input [63:0]w1
input s
output reg f;

always @(w0,w1,s)
  if(s==0)
     f=w0;
  else
     f=w1;
endmodule

module mux_test_bench;
wire a,b,c,d;
mux_nooran(a,b,c,d);

initial
begin
  a=1'bff;
  #150;
  s=0;
  #150;
  b=1'bff;
  #150;
end
