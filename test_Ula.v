`include "ULA.v"
module test_ULA;
  reg [1:0] Operacao;
  reg signed [7:0] in1;
  reg signed [7:0] in2;

  wire saida_comp;
  wire signed [7:0] saida;

  initial begin
    #1 $display("Soma sem sinal");
    in1 = 0;
    in2 = 1;
    Operacao = 0;
    #1 $display("Soma com sinal");
    in1 = -1;
    Operacao = 1;
    #1 $display("Multiplicacao com sinal");
    in2 = 2;
    in1 = 2;
    Operacao = 2;
  end

  initial begin
    $monitor("Operacao=%d  in1=%d  in2=%d  saida=%d  saida_comp=%d\n", Operacao, in1, in2, saida,
             saida_comp);
  end

  ULA gate1 (
      Operacao,
      in1,
      in2,
      saida_comp,
      saida
  );
endmodule
