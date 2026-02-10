module reg_pipeline_buffer #(parameter DATAWIDTH =8)
( input clk, rst,
 //input interface
 input [DATAWIDTH-1:0] in_data,
 output in_ready,
 input in_valid,
 //output interface
 output reg out_valid,
 output reg [DATAWIDTH-1:0] out_data,
 input out_ready);
 
assign in_ready = ~out_valid || out_ready;
 
 always @(posedge clk or negedge rst) begin
 if(!rst) begin
 out_valid <=0;
 out_data <=0;
 end
 else begin
 if(in_ready) begin
 out_valid <= in_valid;
 if(in_valid) begin
 out_data <= in_data;
 end
 end
 end
 end
 endmodule
