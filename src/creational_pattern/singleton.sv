class singleton;
  static singleton s_comp;
  rand int addr;
  rand int data;

  static function singleton get_inst();
    if(s_comp == null) begin
      $display("creating new object as it found null");
      s_comp = new();
    end
    else $display("object already exist, separate memory will not be allocated.");
    return s_comp;
  endfunction
  
endclass

module singleton_test();
initial begin
  singleton a, b;
  a = singleton::get_inst();
  b = singleton::get_inst();
  if(a == b) $display("a and b are same");
  else $error("a and b are not same");
  $finish;
end
endmodule

