`include "memoria.v"
`include "mRisc.v"

module simula;

reg CLK;
wire[15:0] valorlido;/*Saida da memória e entrada do mRisc*/
wire[15:0] valorescrito;/*Saída do mRisc e entrada da memória*/
wire[15:0] endereco;/*Saída do mRisc e entrada da memória*/
wire escmem;/*Saída do mRisc e entrada da memória | Controle*/
integer i;

/* Declaracao do contador de estagios */
reg[15:0] counter;

mRisc mrisc(CLK, escmem, endereco, valorescrito, valorlido);
memoria Memoria(CLK, valorlido, endereco, valorescrito, escmem);

initial
  begin	  
    for(i=0;i<=65535;i=i+1)
      Memoria.mem[i]=0;//Inicializa a memória com 0
    
    $readmemh("testevibn",Memoria.mem); //Leitura do arquivo
 
    CLK = 0;
  end

initial
  begin
    counter = 1;
    forever
    begin       
       #1;	
       CLK = ~CLK;
	
    end
  end   
initial begin
	  forever
	  begin

	   $display("Valorlido = %h, DetSimMem = %b, DetSimPC = %b ,EndMem = %b, EscMem = %b, TrueOrFalse = %b, EndReg = %b, FontePC2 = %b , EscReg = %b, EscFlag = %b, FonteReg = %b, FonteRI = %b, FontePC1 = %b, FontePC = %b, UALFonteA = %b, UALFonteB = %b, CodInst2 = %b UALOp = %b pipe1.PC = %h pipe2.EscMem = %b, pipe2.EscReg = %b, pipe2.EscFlag = %b, pipe2.TrueOrFalse = %b, pipe2.FontePC2 = %b, pipe2.EndReg = %b, pipe2.EndMem = %b, pipe2.B = %h pipe1.PC = %h, pipe2.UALFonteB = %b, pipe2.UALFonteA = %b, pipe2.FonteReg = %b, pipe2.FontePC1 = %b, SaidaMux7 = %h pipe3.FonteReg = %b pipe3.EscReg = %b, pipe3.TrueOrFalse = %b, pipe3.FlagLido = %b, pipe3.NegFlagLido = %b, pipe3.FontePC2 = %b, pipe3.EndReg = %b, pipe3.UALSaida = %h, UALSaida = %h, pipe2.UALOp = %b, pipe2.PC = %h, pipe2.C3 = %h, SaidaMux6 = %h, SaidaMux5 = %h, pipe3.CodInst4 = %d, pipe2.CodInst3 = %d, CodInst2 = %d, SaidaMux2 = %b, pipe3.fontepc1 = %b pip22.C1 = %h pipe1.i13_11 = %b, pipe2.i13_11 = %b, memoria[999 = %h SaidaMux 1 = %h, SaidaMux11 = %b pipe2.A = %h, pipe2.B  = %h memoria[0] = %h RegLido1 = %h RegLido2 = %h RegLido3 = %h, SaidaRI5_3 = %b,  Bancorweg.Rega = %b, BancoReg.Regb = %b, Bancoreg.regc = %b, pipe3.PC = %h SaidaMux3 = %h EscPC = %b, Memoria[ffff] = %h memoria[fffe] = %h", mrisc.ValorLido, mrisc.DetSinMem, mrisc.DetSinPC, mrisc.EndMem, mrisc.EscMem, mrisc.TrueOrFalse, mrisc.EndReg, mrisc.FontePC2, mrisc.EscReg, mrisc.EscFlag, mrisc.FonteReg, mrisc.FonteRI, mrisc.FontePC1, mrisc.FontePC, mrisc.UALFonteA, mrisc.UALFonteB, mrisc.CodInst2, mrisc.UALOp, mrisc.Pipe1.PC, mrisc.Pipe2.EscMem, mrisc.Pipe2.EscReg, mrisc.Pipe2.EscFlag, mrisc.Pipe2.TrueOrFalse, mrisc.Pipe2.FontePC2, mrisc.Pipe2.EndReg, mrisc.Pipe2.EndMem, mrisc.Pipe2.B, mrisc.Pipe1.PC, mrisc.Pipe2.UALFonteB, mrisc.Pipe2.UALFonteA, mrisc.Pipe2.FonteReg, mrisc.Pipe2.FontePC1, mrisc.SaidaMux7, mrisc.Pipe3.FonteReg, mrisc.Pipe3.EscReg, mrisc.Pipe3.TrueOrFalse, mrisc.Pipe3.FlagLido, mrisc.Pipe3.NegFlagLido, mrisc.Pipe3.FontePC2, mrisc.Pipe3.EndReg, mrisc.Pipe3.UALSaida, mrisc.UALSaida, mrisc.Pipe2.UALOp, mrisc.Pipe2.PC, mrisc.Pipe2.C3, mrisc.SaidaMux6, mrisc.SaidaMux5, mrisc.Pipe3.CodInst4, mrisc.Pipe2.CodInst3, mrisc.CodInst2, mrisc.SaidaMux2, mrisc.Pipe3.FontePC1, mrisc.Pipe2.C1, mrisc.SaidaRI13_11, mrisc.Pipe2.I13_11, Memoria.mem[999], mrisc.SaidaMux1, mrisc.SaidaMux11, mrisc.Pipe2.A, mrisc.Pipe2.B, Memoria.mem[0], mrisc.RegLido1, mrisc.RegLido2, mrisc.RegLido3, mrisc.SaidaRI5_3, mrisc.bancoReg.RegA, mrisc.bancoReg.RegB, mrisc.bancoReg.RegC, mrisc.Pipe3.PC, mrisc.SaidaMux3, mrisc.EscPC, Memoria.mem['hffff], Memoria.mem['hfffe]);
	   
	   $display("Status do processador");
	   $display("Registradores  Flags");
	   $display("Reg00=%h     Neg %b", mrisc.bancoReg.Banco[0], mrisc.bancoFlag.BancoFlags[4]);
	   $display("Reg01=%h     Zero %b", mrisc.bancoReg.Banco[1], mrisc.bancoFlag.BancoFlags[5]);
           $display("Reg02=%h     Carry %b", mrisc.bancoReg.Banco[2], mrisc.bancoFlag.BancoFlags[6]);
           $display("Reg03=%h     NegZero %b", mrisc.bancoReg.Banco[3], mrisc.bancoFlag.BancoFlags[7]);
           $display("Reg04=%h     OverFlow %b", mrisc.bancoReg.Banco[4], mrisc.bancoFlag.BancoFlags[3]);
	   $display("Reg05=%h     True %b", mrisc.bancoReg.Banco[5], mrisc.bancoFlag.BancoFlags[0]);
           $display("Reg06=%h", mrisc.bancoReg.Banco[6]);
           $display("Reg07=%h", mrisc.bancoReg.Banco[7]);
           $display("PC=%h", mrisc.pc.reg_PC);
           $display("RI=%h", mrisc.ValorLido);//Pipe1.RI);
	   $display("Clock = %b",CLK);
	   $display("Estagio : %d", counter);
	   $display("-------------------------------------------------");
	   #1;
          end
        end
   
initial begin
	  forever
	  begin
	    if(mrisc.Pipe1.RI == 'h2fff)
               #8 $finish;
          end
        end
  
always@(posedge (CLK == 0))
begin
  counter = counter + 1;
end
	
endmodule

