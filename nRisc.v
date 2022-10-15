// nRisc
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

`include "BancoRegis.v"
`include "Controle.v"
`include "Extensor_2_8.v"
`include "Extensor_5_8.v"
`include "MUX_1bit.v"
`include "MUX_2bits.v"
`include "MUX_8bits.v"
`include "AND.v"
`include "ProgramCounter.v"
`include "ULA.v"

module nRisc (
    CLK,
    saida_instrucao,
    saidaPC,
    EscreveMemoria,
    LeMemoria,
    endereco,
    valorescrito,
    valorlido
);

  // INPUT e OUTPUT
  input wire CLK;
  input wire [7:0] saida_instrucao;
  input wire [7:0] valorlido;

  output wire EscreveMemoria;
  output wire LeMemoria;
  output wire [7:0] endereco;
  output wire [7:0] valorescrito;
  output wire [7:0] saidaPC;

  // SAIDAS MUX'S
  wire [1:0] saida_mux1;
  wire [7:0] saida_mux2;
  wire [7:0] saida_mux3;
  wire [7:0] saida_mux4;
  wire [7:0] saida_mux5;
  wire [7:0] saida_mux6;
  wire [7:0] saida_mux7;
  wire saida_mux8;
  wire saida_mux9;
  wire [7:0] saida_mux10;

  // OUTRAS SAIDAS
  wire [7:0] saida_extensor1;
  wire [7:0] saida_extensor2;
  wire [7:0] saida_PC;
  wire saida_comp_pc;
  wire [7:0] saida_ula_pc;
  wire [7:0] saida_reg_RA;
  wire [7:0] saida_reg_1;
  wire [7:0] saida_reg_2;
  wire saida_comp_ULA;
  wire [7:0] saida_ULA;
  wire saida_and;

  // SINAIS DE CONTROLE
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

  ProgramCounter PC (
      CLK,
      saida_mux10,
      saida_PC
  );
  ULA ulaPC (
      2'b00,  // EXECUTAR SOMA
      saida_PC,
      8'b00000001,
      saida_comp_pc,  // NAO SERA UTILIZADA
      saida_ula_pc
  );
  Controle controle (
      saida_instrucao[7:5],
      saida_instrucao[0],
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
  MUX_2bits MUX1 (
      saida_instrucao[4:3],
      2'b11,
      lw,
      saida_mux1
  );
  BancoRegis regis (
      escreveRegistrador,
      CLK,
      2'b11,
      saida_instrucao[4:3],
      saida_instrucao[2:1],
      saida_mux1,
      saida_mux5,
      saida_reg_RA,
      saida_reg_1,
      saida_reg_2
  );
  Extensor_2_8 extensor1 (
      saida_instrucao[2:1],
      saida_extensor1
  );
  Extensor_5_8 extensor2 (
      saida_instrucao[4:0],
      saida_extensor2
  );
  MUX_8bits MUX2 (
      8'b00000000,
      saida_reg_1,
      saida_mux8,
      saida_mux2
  );
  MUX_8bits MUX3 (
      saida_reg_2,
      saida_extensor1,
      imediato,
      saida_mux3
  );
  ULA ula (
      operacaoULA,
      saida_mux2,
      saida_mux3,
      saida_comp_ULA,
      saida_ULA
  );
  MUX_8bits MUX5 (
      valorlido,
      saida_ULA,
      dadoEscrito,
      saida_mux5
  );
  MUX_8bits MUX4 (
      saida_ULA,
      saida_extensor2,
      acessarMemoria,
      saida_mux4
  );
  AND porta_and (
      beq,
      saida_comp_ULA,
      saida_and
  );
  MUX_8bits MUX6 (
      saida_ula_pc,
      saida_reg_RA,
      saida_and,
      saida_mux6
  );
  MUX_8bits MUX7 (
      saida_mux6,
      saida_reg_RA,
      jump,
      saida_mux7
  );
  MUX_1bit MUX8 (
      1'b1,
      saida_instrucao[0],
      addi,
      saida_mux8
  );
  MUX_1bit MUX9 (
      1'b0,
      saida_instrucao[0],
      halt,
      saida_mux9
  );
  MUX_8bits MUX10 (
      saida_mux7,
      8'b11111111,
      saida_mux9,
      saida_mux10
  );

  assign saidaPC = saida_PC;
  assign valorescrito = saida_reg_RA;
  assign EscreveMemoria = escreveMemoria;
  assign LeMemoria = leMemoria;
  assign endereco = saida_mux4;

endmodule
