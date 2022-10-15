// Program Counter
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

module ProgramCounter (
    clock,
    valorEntradaPC,
    valorPC
);
  input wire [7:0] valorEntradaPC;
  input wire clock;

  output wire [7:0] valorPC;

  reg [7:0] pc;
  
  initial begin
    pc = 8'b00000000;
  end

  always @(posedge clock) begin
    pc = valorEntradaPC;
  end

  assign valorPC = pc;

endmodule






