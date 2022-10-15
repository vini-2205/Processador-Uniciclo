`include "BancoRegis.v"
module test_Reg;
  reg [1:0] inRA;
  reg [1:0] in1;
  reg [1:0] in2;
  reg [1:0] regEscrito;
  reg [7:0] dadoEscrito;
  reg clock, EscreveReg;

  wire [7:0] outRA;
  wire [7:0] out1;
  wire [7:0] out2;

  initial begin
    gate1.registradores[3] = 12;
    gate1.registradores[1] = 10;
    gate1.registradores[2] = 11;
    inRA = 3;
    in1 = 1;
    in2 = 2;
    regEscrito = 1;
    dadoEscrito = 3;
    EscreveReg = 1;
    clock = 0;
    #1 clock = 1;
    #1;
    $display("Valor escrito no registrador %d = %b (%d)", regEscrito, gate1.registradores[regEscrito], gate1.registradores[regEscrito]);
    $display("");
    EscreveReg = 0;
    in1 = 1;
    in2 = 2;
    #1 clock = 0;
    $display("");
    #1 $display("Por meio das saidas eh notorio que o valor do registrador 1 foi alterado para: %b (%d)", gate1.registradores[in1], gate1.registradores[in1]);
  end
  initial begin
    $monitor(
        "Time=%0d in_ra=%d in_1=%d in_2=%d regEscrito=%d dadoEscrito=%d clock=%d EscreveReg=%d outR1=%d outR2=%d outRA=%d",
        $time, inRA, in1, in2, regEscrito, dadoEscrito, clock, EscreveReg, out1, out2, outRA);
  end
  BancoRegis gate1 (
      EscreveReg,
      clock,
      inRA,
      in1,
      in2,
      regEscrito,
      dadoEscrito,
      outRA,
      out1,
      out2,
  );
endmodule
