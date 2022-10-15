module AND (
    in1,
    in2,
    saida
);

  input wire in1;
  input wire in2;

  output wire saida;

  assign saida = (in1 & in2);

endmodule
