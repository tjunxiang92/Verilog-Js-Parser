module main;  //module definition - no inputs or outputs
	reg clk=0;           //define a 1 bit register.
	reg rst = 0;  //initialize to zero, otherwise would be "x"--unknown.
	wire [2:0] a;
	test uut(clk, rst,a);

	always #1 clk=~clk;
	  
	initial 
	begin           
		$monitor ("Time = %d a = %d, Clock = %d",$time,a,clk);
	end

	initial
	begin
		#1 rst = 1;
		#3 rst = 0;
		#20 $finish; 
end
endmodule

// Module Test
module test(input clk, rst, output reg [2:0] a);
	always @ (posedge clk)
	begin
		if (rst)
			a <= 0;
		else
			a <= a + 1;
	end
endmodule