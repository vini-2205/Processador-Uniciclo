//ULA
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module ULA (
    Operacao,
    in1,
    in2,
    saida_comp,
    saida
);
  input wire [1:0] Operacao;
  input wire signed [7:0] in1;
  input wire signed [7:0] in2;

  output wire [0:0] saida_comp;
  output wire [7:0] saida;

  reg unsigned [7:0] reg1;
  reg unsigned [7:0] reg2;
  reg signed [7:0] regS1;
  reg signed [7:0] regS2;
  reg signed [7:0] saida_aux;
  reg comparacao;

  always @(Operacao or in1 or in2) begin
    reg1 = in1;
    reg2 = in2;
    regS1 = in1;
    regS2 = in2;
    comparacao = 0;

    if (Operacao == 0) begin
      saida_aux = (reg1 + reg2);
    end

    if (Operacao == 1) begin
      saida_aux = (regS1 + regS2);
    end

    if (Operacao == 2) begin
      saida_aux = (regS1 * regS2);
    end

    if ((regS1 - regS2) == 0) begin
      comparacao = 1;
    end
  end

  assign saida = saida_aux;
  assign saida_comp = comparacao;
endmodule
