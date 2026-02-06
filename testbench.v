`include"cla_design.v"
module tb;
	reg [3:0]a, b;
	reg cin;
	wire [3:0]sum;
	wire carry;
	carry_look_ahead_adder dut(.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
	initial begin
		repeat(10) begin
			{a, b, cin}=$random;
			#1;
			$display("a=%b b=%b cin=%b sum=%b carry=%b",a, b, cin, sum, carry);
		end
	end
endmodule

