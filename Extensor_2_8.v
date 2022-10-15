//Extensor_2_8
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module Extensor_2_8 (
    in,
    saida
);

input wire [1:0] in;

output wire [7:0] saida;

reg [7:0] extendido;

always @(in) begin
    extendido[1:0] = in[1:0];
    extendido[7:2] = {6{in[1]}};
end

assign saida = extendido;

endmodule
