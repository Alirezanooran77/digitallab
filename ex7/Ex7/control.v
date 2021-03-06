module control
(instruction,alusrc,memtoreg,regwrite,memread,memwrite,branch,aluop);
input [31:0]instruction;
output alusrc,memtoreg,regwrite,memread,memwrite,branch;
output [1:0]aluop ;
reg [6:0] opcode ;instruction[6:0];
reg [7:0] controls;
assign opcode = [6:0] instruction;
always @(opcode)
begin
  casex(opcode)
     7'b0110011:alusrc=0,memtoreg=0,regwrite=1,memread=0,memwrite=0,branch=0,aluop=2'b10;
     7'b0000011:alusrc=1,memtoreg=1,regwrite=1,memread=1,memwrite=0,branch=0,aluop=2'b00;
     7'b0100011:alusrc=1,memtoreg=x,regwrite=0,memread=0,memwrite=1,branch=0,aluop=2'b00;
     7'b1100011:alusrc=0,memtoreg=x,regwrite=0,memread=0,memwrite=0,branch=1,aluop=2'b01;
      default:controls=8'bxxxxxxxx;
end

assign {}=controls
endmodule
