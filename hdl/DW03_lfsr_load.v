

module DW03_lfsr_load #(
parameter WIDTH           = 'd4           // numar de biti ai numaratorului
) (
input      [WIDTH -1:0]   data        , // data de load
input                     clk         , // semnal de clock
input                     rst_n       , // reset date
input                     cen         , // count enable
input                     load_n      , // incarcare date

output reg [WIDTH -1:0]   count        // iesire counter

);

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)  count <= 'd1; else
    if(load_n && cen) count <= {count[WIDTH-1] ^ count[0], count[WIDTH-1:1]}; else //xor intre primul si ultimul bit
    if(cen) count <= count ^ data; else // daca se face load, se face xor intre count si data
    count <= count; //daca counter enable e 0 se mentine valoarea lui count
    
end


endmodule

