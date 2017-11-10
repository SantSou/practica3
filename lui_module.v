/******************************************************************
* Description
*	This module performes a sign-extend operation that is need with
*	in instruction like andi or ben.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module LuiModule
(   
	input [15:0]  DataInput,
   output[31:0] LuiModuleOutput
);

assign  LuiModuleOutput = {DataInput,16'b0};

endmodule // signExtend
