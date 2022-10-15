//MUX_8bits
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module MUX_8bits (
    in1,
    in2,
    controle,
    saida
);

  input wire [7:0] in1;
  input wire [7:0] in2;
  input wire controle;

  output wire [7:0] saida;

  reg [7:0] aux_saida;

  always @(in1 or in2 or controle) begin
    if (controle == 0) begin
      aux_saida = in1;
    end else if (controle == 1) begin
      aux_saida = in2;
    end
  end

  assign saida = aux_saida;

endmodule
