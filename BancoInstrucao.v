// Banco de Instruções
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

module BancoInstrucao (
    clock,
    Endereco,
    Instrucao
);

  input wire clock;
  input wire [7:0] Endereco;

  output [7:0] Instrucao;

  reg [7:0] Memoria[255:0];
  reg [7:0] aux;

  always @(negedge clock) begin
    begin
      aux = Memoria[Endereco];
    end
  end

  assign Instrucao = aux;

endmodule
