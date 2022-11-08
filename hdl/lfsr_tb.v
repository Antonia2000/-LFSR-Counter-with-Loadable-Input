


module lfsr_tb #(
parameter WIDTH             = 'd4          // numar de biti ai operanzilor
) (    

output    reg  [WIDTH -1:0]   data        ,
output    reg                 cen         ,
output    reg                 load_n      ,
output    reg              clk         , // ceas
output    reg              rst_n,
input     [WIDTH -1:0]              count
);

initial 
begin
  clk = 1'b0;             // valoare initiala 0
  forever #10             // valoare complementata la fiecare semi-perioada
    clk = ~clk;
end

initial begin
  rst_n     <= 1'b1;
  cen       <= 1'bx;
  load_n    <= 'bx;  
  data      <= {WIDTH{1'bx}};
  @(posedge clk);
  rst_n     <=1'b0;
  // initializeaza numaratorul la 0, la activarea reset asincron
  @(negedge rst_n);
  load_n    <= 1'b1;
  cen       <= 1'b1;
  data      <=  'd0;
  @(posedge clk);
  rst_n     <= 1'b1;

  repeat (10) @(posedge clk);
  
  cen    <= 1'b0;
  repeat (3) @(posedge clk);
  cen    <= 1'b1;

  repeat (10) @(posedge clk); //al doilea grafic

  load_n <= 1'b0;
  data   <= 'd4; //incarcare date
  repeat (5) @(posedge clk);
  load_n <= 1'b1;
  repeat (5) @(posedge clk);
  cen    <= 1'b0;
  @(posedge clk);
  cen    <= 1'b1;
  repeat (5) @(posedge clk);
  $stop;
end

endmodule // adder_tb

