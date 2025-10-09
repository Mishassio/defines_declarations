
`define STRINGIFY(x) `"x`"
`include `STRINGIFY(`DEFS_SRC)

module top_tb();
    initial begin
        $display("SV PRINTING A=%s",`STRINGIFY(`A));
        $display("SV PRINTING B=%s",`STRINGIFY(`B));
        $display("SV PRINTING A=%s",`STRINGIFY(`C));
        $display("SV PRINTING B=%s",`STRINGIFY(`D));
        $display("SV PRINTING B=%s",`STRINGIFY(`E));


        $display("SV PRINTING A_0_0=%s",`STRINGIFY(`A_0_0));
        $display("SV PRINTING A_0_1=%s",`STRINGIFY(`A_0_1));
        $display("SV PRINTING A_1_0=%s",`STRINGIFY(`A_1_0));
        $display("SV PRINTING A_1_1=%s",`STRINGIFY(`A_1_1));
        $display("SV PRINTING A_BLUE=%s",`STRINGIFY(`A_BLUE));
        $display("SV PRINTING A_BLUE_2=%s",`STRINGIFY(`A_BLUE_2));
        $display("SV PRINTING A_GREEN=%s",`STRINGIFY(`A_GREEN));
        $display("SV PRINTING A_INDEXED=%s",`STRINGIFY(`A_INDEXED));
        $display("SV PRINTING A_RED=%s",`STRINGIFY(`A_RED));
        #10;
        $display("T=%0t", $time);
        $finish;
    end
endmodule