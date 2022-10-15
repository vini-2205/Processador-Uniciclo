`include "ProgramCounter.v"
module test_PC;
  reg [7:0] valorEntradaPC;
  reg EscrevePC, clock;

  wire [7:0] valorPC;

  initial begin
    clock = 0;
    EscrevePC = 1;
    valorEntradaPC = 1;
    #1 clock = 1;
    #1 clock = 0;
    valorEntradaPC = 2;
    #1 clock = 1;
    EscrevePC = 0;
    #1 EscrevePC = 1;
    #1 clock = 0;
    #1 clock = 1;

  end
  initial begin
    $monitor("Time=%0d valorEntradaPC=%d clock=%d EscrevePC=%d valorPC=%d", $time, valorEntradaPC,
             clock, EscrevePC, valorPC);
  end
  ProgramCounter gate1 (
      EscrevePC,
      clock,
      valorEntradaPC,
      valorPC
  );
endmodule
