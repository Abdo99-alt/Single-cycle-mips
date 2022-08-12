module alu(input logic [31:0] op1,op2,
	input logic [2:0] ALUctrl,
	output logic [31:0] ALUres,
	output logic zero);
always @(*) begin
case (ALUctrl)
'b000 : ALUres = op1 & op2;            
'b001 : ALUres = op1 | op2;
'b010 : ALUres = op1 + op2;
'b100 :	ALUres = op1 & (~op2);
'b101 :	ALUres = op1 | (~op2);
'b110 :	ALUres = op1 - op2;
'b111 :	ALUres = (op1 < op2) ? 1 : 0;
default : ALUres  = 0;
endcase
end
assign zero = (ALUres == 0) ? 1 : 0;
endmodule
