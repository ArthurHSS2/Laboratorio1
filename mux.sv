module mux
  (
    output logic [31:0] f,   
    input  logic [31:0] a, b, c, d,  
    input  logic sel1, sel2  
  );

  wire [31:0] f1, f2, f3, f4;  
  wire n_sel1, n_sel2;

  not g6(n_sel1, sel1);  
  not g7(n_sel2, sel2); 

  genvar i;
  generate
    for (i = 0; i < 32; i = i + 1) begin : mux_gen
      and g1(f1[i], a[i], sel1, sel2);          
      and g2(f2[i], b[i], sel1, n_sel2);       
      and g3(f3[i], c[i], n_sel1, sel2);       
      and g4(f4[i], d[i], n_sel1, n_sel2);    
      or  g5(f[i], f1[i], f2[i], f3[i], f4[i]);
    end
  endgenerate


endmodule
