//Verilog code for carry look ahead adder
//Full adder
module full_adder(input a,b,cin, output sum, carry);
	assign {carry, sum} = a + b + cin;
endmodule

//CLA
module carry_look_ahead_adder(input [3:0] a, b, input cin, output [3:0] sum, output carry);
    wire [3:0] p, g;
    wire [2:0] c;

    //propagate and generate
    assign p = a ^ b;
    assign g = a & b;

    //carry Lookahead Logic
    assign c[0] = g[0] | (p[0] & cin);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign carry = g[3] | (p[3] & g[2]) | 
				   (p[3] & p[2] & g[1]) | 
				   (p[3] & p[2] & p[1] & g[0]) | 
				   (p[3]&p[2]&p[1]&p[0]&cin);

    //full adder instantiation
    full_adder ckt1(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry());
    full_adder ckt2(.a(a[1]), .b(b[1]), .cin(c[0]),  .sum(sum[1]), .carry());
    full_adder ckt3(.a(a[2]), .b(b[2]), .cin(c[1]),  .sum(sum[2]), .carry());
    full_adder ckt4(.a(a[3]), .b(b[3]), .cin(c[2]),  .sum(sum[3]), .carry());
endmodule
