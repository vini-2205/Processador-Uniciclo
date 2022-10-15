`include "Extensor_2_8.v"
module test_Extensor;

  reg [1:0] in;

  wire [7:0] saida;

    initial begin
      in = 2'b1;
    end

    initial begin
      $monitor("in:%b saida:%b\n", in, saida);
    end

    Extensor_2_8 gate1 (
      in,
      saida
    );
    
endmodule