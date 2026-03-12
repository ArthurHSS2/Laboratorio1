`timescale 1ns/1ps

module tb_mux;

logic [31:0] a, b, c, d;
logic [31:0] muxOut;
logic sel1, sel2;

genvar i;

generate
  for(i=0;i<32;i++) begin : mux_array
    mux dut(
      .f(muxOut[i]),
      .a(a[i]),
      .b(b[i]),
      .c(c[i]),
      .d(d[i]),
      .sel1(sel1),
      .sel2(sel2)
    );
  end
endgenerate

initial begin

 
  a = 32'hDEAD_BEEF;  
  b = 32'hCAFEBABE; 
  c = 32'hBADD_C0DE; 
  d = 32'hFACE_CAFE;  
  
  $monitor($time," sel2=%b sel1=%b muxOut=%h",sel2,sel1,muxOut);

  // Testando todas as combinações de sel
  sel2 = 0; sel1 = 0;  // Caso 1: selecione `a`
  #10;

  sel2 = 0; sel1 = 1;  // Caso 2: selecione `b`
  #10;

  sel2 = 1; sel1 = 0;  // Caso 3: selecione `c`
  #10;

  sel2 = 1; sel1 = 1;  // Caso 4: selecione `d`
  #10;

  $stop;

end


endmodule
