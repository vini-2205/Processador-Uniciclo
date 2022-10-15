`include "BancoMemoria.v"
module test_Mem;
  reg EscreveMemoria;
  reg LeMemoria;
  reg [7:0] Endereco;
  reg [7:0] DadoSalvo;
  reg clock;

  wire [7:0] DadoCarregado;

  initial begin
    EscreveMemoria = 1;
    LeMemoria = 0;
    DadoSalvo = 10;
    Endereco = 7;
    clock = 0;
    #1 clock = 1;
    #1;
    $display("Valor salvo no endereco 7: %b", gate1.Memoria[7]);
    $display("");
    #1 clock = 0;
    EscreveMemoria = 0;
    LeMemoria = 1;
    #1;
    $display("Valor carregado do endereco 7: %b", DadoCarregado);
  end

  initial begin
    $monitor(
        "EscreveMemoria=%d  LeMemoria=%d  DadoSalvo=%d  clock=%d  DadoCarregado=%d  Endereco=%d",
        EscreveMemoria, LeMemoria, DadoSalvo, clock, DadoCarregado, Endereco);
  end

  BancoMemoria gate1 (
      EscreveMemoria,
      LeMemoria,
      Endereco,
      DadoSalvo,
      clock,
      DadoCarregado
  );
endmodule
