
module BranchAddress
(   
	input [15:0] DataInput,
   output[31:0] BranchAddr
);


	assign BranchAddr ={{14{DataInput[15]}},DataInput[15:0],2'b00};

endmodule // signExtend