


module lfsr_test;
localparam                  WIDTH           = 'd4;         // numar de biti ai numaratorului

wire  [WIDTH   -1:0]        data            ;  // data
wire                        cen             ;  // counter enable
wire                        load_n          ;  // load activ in 0
wire                        clk             ;  // clock
wire                        rst_n           ;  // reset activ in 0
wire  [WIDTH   -1:0]        count           ;  // output


DW03_lfsr_load #(
.WIDTH   (WIDTH)
) i_DW03_lfsr_load_DUT (
.clk            (clk        ),
.rst_n          (rst_n      ),
.load_n         (load_n     ),
.cen            (cen        ), 
.data           (data       ), 
.count          (count      )
);

lfsr_tb i_lfsr_tb (
.clk            (clk      ),
.rst_n          (rst_n    ),
.load_n         (load_n   ),
.cen            (cen      ), 
.data           (data     ),
.count          (count    )
);


endmodule

