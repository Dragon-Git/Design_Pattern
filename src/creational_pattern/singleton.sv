class singleton;
  static singleton s_comp;
  rand bit [31:0] addr;
  rand bit [31:0] data;

  static function singleton get_inst();
    if(s_comp == null) begin
      $display("creating new object as it found null");
      s_comp = new();
    end
    else $display("object already exist, separate memory will not be allocated.");
    return s_comp;
  endfunction
  
  virtual task display();
    $display($sformatf("addr:%d \ndata:%d",addr,data));
  endtask
  
endclass

module singleton_test();
initial begin
  singleton a, b, c;
  a = singleton::get_inst();
  b = singleton::get_inst();
  c = singleton::get_inst();
  a.randomize();
  a.display();
  b.display();
  c.display();
end
endmodule

