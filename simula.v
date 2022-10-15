// SIMULACAO
// Lucas Santos Rodrigues
// Vinicius Ferreira Pinheiro

`include "BancoInstrucao.v"
`include "BancoMemoria.v"
`include "nRisc.v"

module simula;
  reg CLK;

  wire [7:0] saida_pc;
  wire [7:0] saida_instrucao;

  wire [7:0] valorlido;
  wire [7:0] valorescrito;
  wire [7:0] endereco;
  wire EscreveMemoria;
  wire LeMemoria;

  /* Declaracao do contador de estagios */
  reg [15:0] counter;
  integer i;

  BancoInstrucao instrucao (
      CLK,
      saida_pc,
      saida_instrucao
  );
  nRisc risc (
      CLK,
      saida_instrucao,
      saida_pc,
      EscreveMemoria,
      LeMemoria,
      endereco,
      valorescrito,
      valorlido
  );
  BancoMemoria memoria (
      CLK,
      EscreveMemoria,
      LeMemoria,
      endereco,
      valorescrito,
      valorlido
  );

  initial begin
    for (i = 0; i <= 255; i = i + 1) memoria.Memoria[i] = 8'b00000000;
    for (i = 0; i <= 255; i = i + 1) instrucao.Memoria[i] = 8'b00000000;

    $readmemb("../instrucao.dat", instrucao.Memoria, 0, 14);
    memoria.Memoria[0] = 8'b00000100;
    memoria.Memoria[12] = 8'b00001100;
    memoria.Memoria[5] = 8'b00000101;
  end

  initial begin
    counter = 1;
    CLK = 0;
    forever begin
      #1;
      CLK = ~CLK;

      if (counter > 40) begin
        $display("FIM, I LOVE TYMBU!");
        $finish;
      end
        if(CLK == 0) begin
            $display("LEITURA");
        end
        if(CLK == 1) begin
            $display("ESCRITA");
        end
        $display("%d Instrucao: %b, OPcode: %b, PC: %b\n", counter, saida_instrucao,
                 risc.saida_instrucao[7:5], risc.saida_PC);
        $display(
            "halt:%b, addi:%b, jump:%b, beq:%b, \ndadoEscrito:%b, acessarMemoria:%b, imediato:%b, escreveMemoria:%b, \nleMemoria:%b, operacaoULA:%b, escreveRegistrador:%b, lw:%b\n",
            risc.halt, risc.addi, risc.jump, risc.beq, risc.dadoEscrito, risc.acessarMemoria,
            risc.imediato, risc.escreveMemoria, risc.leMemoria, risc.operacaoULA,
            risc.escreveRegistrador, risc.lw);
        $display("r1(%b):%b r2(%b):%b ra:%b saidaExtensor2_8:%b\nentrada_ULA1:%b entrada_ULA2:%b saida_ULA:%b saida_comp:%b valorEscritoReg:%b endereco:%b", risc.saida_instrucao[4:3], risc.saida_reg_1, risc.saida_instrucao[2:1], risc.saida_reg_2, risc.saida_reg_RA, risc.saida_extensor1, risc.saida_mux2, risc.saida_mux3, risc.saida_ULA, risc.saida_comp_ULA, risc.regis.dadoEscrito, risc.saida_extensor2);
        $display("r1(%d):%d r2(%d):%d ra:%d saidaExtensor2_8:%d\nentrada_ULA1:%d entrada_ULA2:%d saida_ULA:%d saida_comp:%d valorEscritoReg:%d endereco:%d\n", risc.saida_instrucao[4:3], risc.saida_reg_1, risc.saida_instrucao[2:1], risc.saida_reg_2, risc.saida_reg_RA, risc.saida_extensor1, risc.saida_mux2, risc.saida_mux3, risc.saida_ULA, risc.saida_comp_ULA, risc.regis.dadoEscrito, risc.saida_extensor2);
        $display("MEMORIA[0]: %b", memoria.Memoria[0]);
        $display("MEMORIA[0]: %d\n", memoria.Memoria[0]);
        if(CLK == 0) begin
            $display("-------------------------------------------------------------------\n");
        end
    end
  end

  always @(posedge (CLK == 0)) begin
    counter = counter + 1;
  end

endmodule
