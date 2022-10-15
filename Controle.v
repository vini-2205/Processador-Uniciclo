//Controle
//LUCAS SANTOS RODRIGUES
//VINICIUS FERREIRA PINHEIRO

module Controle (
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
  input wire [2:0] OPcode;
  input wire bit_menos_sig;

  output wire halt;
  output wire addi;
  output wire jump;
  output wire beq;
  output wire dadoEscrito;
  output wire acessarMemoria;
  output wire imediato;
  output wire escreveMemoria;
  output wire leMemoria;
  output wire [1:0] operacaoULA;
  output wire escreveRegistrador;
  output wire lw;

  reg aux_halt;
  reg aux_addi;
  reg aux_jump;
  reg aux_beq;
  reg aux_dadoEscrito;
  reg aux_acessarMemoria;
  reg aux_imediato;
  reg aux_escreveMemoria;
  reg aux_leMemoria;
  reg [1:0] aux_operacaoULA;
  reg aux_escreveRegistrador;
  reg aux_lw;

  always @(OPcode) begin
    if (OPcode == 0) begin  // add
      aux_addi = 0;
      aux_jump = 0;
      aux_beq = 0;
      aux_dadoEscrito = 1;
      aux_acessarMemoria = 0;
      aux_imediato = 0;
      aux_escreveMemoria = 0;
      aux_leMemoria = 0;
      aux_operacaoULA = 1;
      aux_escreveRegistrador = 1;
      aux_lw = 0;
      if (bit_menos_sig == 1) begin  // halt
        aux_halt = 1;
      end else begin
        aux_halt = 0;
      end
    end

    if (OPcode == 1) begin  // addi
      aux_addi = 1;
      aux_jump = 0;
      aux_beq = 0;
      aux_dadoEscrito = 1;
      aux_acessarMemoria = 0;
      aux_imediato = 1;
      aux_escreveMemoria = 0;
      aux_leMemoria = 0;
      aux_operacaoULA = 1;
      aux_escreveRegistrador = 1;
      aux_lw = 0;
      aux_halt = 0;
    end

    if (OPcode == 2) begin  // beq
      aux_addi = 0;
      aux_jump = 0;
      aux_beq = 1;
      aux_dadoEscrito = 0;
      aux_acessarMemoria = 0;
      aux_imediato = 0;
      aux_escreveMemoria = 0;
      aux_leMemoria = 0;
      aux_operacaoULA = 0;
      aux_escreveRegistrador = 0;
      aux_lw = 0;
      aux_halt = 0;
    end

    if (OPcode == 3) begin  // lw
      aux_addi = 0;
      aux_jump = 0;
      aux_beq = 0;
      aux_dadoEscrito = 0;
      aux_acessarMemoria = 1;
      aux_imediato = 0;
      aux_escreveMemoria = 0;
      aux_leMemoria = 1;
      aux_operacaoULA = 0;
      aux_escreveRegistrador = 1;
      aux_lw = 1;
      aux_halt = 0;
    end

    if (OPcode == 4) begin  // sw
      aux_addi = 0;
      aux_jump = 0;
      aux_beq = 0;
      aux_dadoEscrito = 0;
      aux_acessarMemoria = 0;
      aux_imediato = 0;
      aux_escreveMemoria = 1;
      aux_leMemoria = 0;
      aux_operacaoULA = 0;
      aux_escreveRegistrador = 0;
      aux_lw = 0;
      aux_halt = 0;
    end

    if (OPcode == 5) begin  // j
      aux_addi = 0;
      aux_jump = 1;
      aux_beq = 0;
      aux_dadoEscrito = 0;
      aux_acessarMemoria = 0;
      aux_imediato = 0;
      aux_escreveMemoria = 0;
      aux_leMemoria = 0;
      aux_operacaoULA = 0;
      aux_escreveRegistrador = 0;
      aux_lw = 0;
      aux_halt = 0;
    end

    if (OPcode == 6) begin  // mul
      aux_addi = 0;
      aux_jump = 0;
      aux_beq = 0;
      aux_dadoEscrito = 1;
      aux_acessarMemoria = 0;
      aux_imediato = 0;
      aux_escreveMemoria = 0;
      aux_leMemoria = 0;
      aux_operacaoULA = 2;
      aux_escreveRegistrador = 1;
      aux_lw = 0;
      aux_halt = 0;
    end
  end

  assign halt = aux_halt;
  assign addi = aux_addi;
  assign jump = aux_jump;
  assign beq = aux_beq;
  assign dadoEscrito = aux_dadoEscrito;
  assign acessarMemoria = aux_acessarMemoria;
  assign imediato = aux_imediato;
  assign escreveMemoria = aux_escreveMemoria;
  assign leMemoria = aux_leMemoria;
  assign operacaoULA = aux_operacaoULA;
  assign escreveRegistrador = aux_escreveRegistrador;
  assign lw = aux_lw;

endmodule
