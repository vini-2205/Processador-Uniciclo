//MUX_2bits
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module MUX_2bits (
    in1,
    in2,
    controle,
    saida
);

  input wire [1:0] in1;
  input wire [1:0] in2;
  input wire controle;

  output wire [1:0] saida;

  reg [1:0] aux_saida;

  always @(in1 or in2 or controle) begin
    if (controle == 0) begin
      aux_saida = in1;
    end else if (controle == 1) begin
      aux_saida = in2;
    end
  end

  assign saida = aux_saida;

endmodule
