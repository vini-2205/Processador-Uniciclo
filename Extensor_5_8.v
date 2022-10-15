//Extensor_5_8
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module Extensor_5_8 (
    in,
    saida
);

input wire [4:0] in;

output wire [7:0] saida;

reg [7:0] extendido;

always @(in) begin
    extendido[4:0] = in[4:0];
    extendido[7:5] = {3{in[4]}};
end

assign saida = extendido;

endmodule
