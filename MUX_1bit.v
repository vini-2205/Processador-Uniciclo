//MUX_1bit
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module MUX_1bit (
    in1,
    in2,
    controle,
    saida
);

  input wire in1;
  input wire in2;
  input wire controle;

  output wire saida;

  reg aux_saida;

  always @(in1 or in2 or controle) begin
    if (controle == 0) begin
      aux_saida = in1;
    end else if (controle == 1) begin
      aux_saida = in2;
    end
  end

  assign saida = aux_saida;

endmodule
