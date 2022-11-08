module count_tb #(
parameter WIDTH             = 'd8          // numar de biti ai operanzilor
) (    

output    reg  [WIDTH -1:0]   data        ,
output    reg                 cen         ,
output    reg                 load_n      ,
output    reg              clk         , // ceas
output    reg              rst_n,
input     [WIDTH -1:0]              count
);