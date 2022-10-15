// Banco de Registradores
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

module BancoRegis (
    EscreveReg,
    clock,
    inRA,
    in1,
    in2,
    regEscrito,
    dadoEscrito,
    outRA,
    out1,
    out2
);

  input wire EscreveReg;
  input wire [1:0] inRA;
  input wire [1:0] in1;
  input wire [1:0] in2;
  input wire [1:0] regEscrito;
  input wire [7:0] dadoEscrito;
  input wire clock;

  output wire [7:0] outRA;
  output wire [7:0] out1;
  output wire [7:0] out2;

  reg [7:0] registradores [3:0]; 

  initial begin
    registradores[0] = 0; // $zero
    registradores[1] = 0;
    registradores[2] = 0;
    registradores[3] = 0;
  end

  always @(posedge clock) begin  // Escrita
    if (EscreveReg) begin
      if (regEscrito != 0) begin
      registradores[regEscrito] = dadoEscrito;
      end
    end
  end

  assign outRA = registradores[inRA];
  assign out1 = registradores[in1];
  assign out2 = registradores[in2];

endmodule


