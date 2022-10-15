// Banco de Memoria
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

module BancoMemoria (
    clock,
    EscreveMemoria,
    LeMemoria,
    Endereco,
    DadoSalvo,
    DadoCarregado
);

  input wire EscreveMemoria;
  input wire LeMemoria;
  input wire [7:0] Endereco;
  input wire [7:0] DadoSalvo;
  input wire clock;

  output wire [7:0] DadoCarregado;

  reg [7:0] Memoria[255:0];
  reg [7:0] aux;

  // Escrita
  always @(posedge clock or EscreveMemoria) begin
    begin
      if (EscreveMemoria) begin
        Memoria[Endereco] = DadoSalvo;
      end
    end
  end

  always @(negedge clock or LeMemoria) begin
    begin
      if (LeMemoria) begin
        aux = Memoria[Endereco];
      end
    end
  end

  assign DadoCarregado = aux;

endmodule
