module counter
#(
parameter MAX = 25'd24_999_999
)
(
input sys_clk,
input sys_rst_n,

output reg led_out
);

reg [24:0] cnt;

always @(posedge sys_clk or negedge sys_rst_n)
  if (sys_rst_n == 1'b0) begin
    cnt <= 25'b0;
    led_out <= 1'b0;
  end
  else begin
    if (cnt == MAX) begin
      cnt <= 25'b0;
      led_out <= ~led_out;
    end
  else
      cnt <= cnt + 1'b1;
  end


endmodule