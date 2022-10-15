`include "BancoInstrucao.v"
module test_Inst;
  reg [7:0] Endereco;
  reg clock;

  wire [7:0] Instrucao;

initial begin
    Endereco = 7;
    clock = 0;
    #1 clock = 1;
    #1 clock = 0;
    Endereco = 8; // Instrucao nao altera pois nao ha uma subida de clock
    #1 clock = 1;
    Endereco = 2;
end

initial begin
    $monitor("Clock=%d | Endereco=%d | Instrucao=%d", clock, Endereco, Instrucao);
end

  BancoInstrucao gate1 (
      Endereco,
      clock,
      Instrucao
  );
endmodule
