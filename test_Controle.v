`include "Controle.v"
module test_Controle;
  reg [2:0] OPcode;
  reg bit_menos_sig;

  wire halt;
  wire addi;
  wire jump;
  wire beq;
  wire dadoEscrito;
  wire acessarMemoria;
  wire imediato;
  wire escreveMemoria;
  wire leMemoria;
  wire [1:0] operacaoULA;
  wire escreveRegistrador;
  wire lw;

  initial begin
    $display("add");
    OPcode = 0;
    bit_menos_sig = 0;
    #1 $display("halt");
    bit_menos_sig = 1;
    #1 $display("lw");
    OPcode = 3;  // mesmo o bit_menos_sig=1 nao ocorrera halt
    // pq so temos um possivel halt no add
    #1 $display("beq");
    OPcode = 2;
  end

  initial begin
    $monitor(
        "OPcode=%b  bit_menos_sig=%b  halt=%b  addi=%b  jump=%b\nbeq=%b dadoEscrito=%b acessarMemoria=%b imediato=%b\nescreveMemoria=%b leMemoria=%b operacaoULA=%b\nescreveRegistrador=%b lw=%b\n\n",
        OPcode, bit_menos_sig, halt, addi, jump, beq, dadoEscrito, acessarMemoria, imediato,
        escreveMemoria, leMemoria, operacaoULA, escreveRegistrador, lw);
  end

  Controle gate1 (
      OPcode,
      bit_menos_sig,
      halt,
      addi,
      jump,
      beq,
      dadoEscrito,
      acessarMemoria,
      imediato,
      escreveMemoria,
      leMemoria,
      operacaoULA,
      escreveRegistrador,
      lw
  );
endmodule
