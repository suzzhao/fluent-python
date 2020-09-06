load Not16.hdl,
output-file Not16.out,
compare-to Not16.cmp,
output-list in%B1.16.1 out%B1.16.1;

set in %B0000000000000000, eval, output;
set in %B0101010101010101, eval, output;
set in %B0001000100010001, eval, output;
set in %B1001100110011001, eval, output;
set in %B1011101110111011, eval, output;