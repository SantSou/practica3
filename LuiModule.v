/******************************************************************
* Description
*	This module performes a signal extension, adding 0s to the end
*  of the input signal
******************************************************************/
module luiModule
(   
	input [15:0]  DataInput,
   output[31:0]  ExtendedOutput
);

assign  ExtendedOutput = {DataInput[15:0],16'b0000000000000000};

endmodule // LuiModule
