// simple factory in systemverilog
virtual class product;
  virtual function void display();
  endfunction
endclass

class smartphone extends product;
  function new();
  endfunction
  function void display();
    $display("display smartphone");
  endfunction
endclass

class computer extends product;
  function void display();
    $display("display computer");
  endfunction
endclass

class factory;
  function product create_product(string type_name);
    smartphone phone;
    computer   comput;
    if (type_name == "smartphone") begin
      phone = new();
      return phone;
    end else if (type_name == "computer") begin
      comput = new();
      return comput;
    end else begin
      return null;
    end
  endfunction
endclass

module test_simple_factory;
  product p1, p2;
  factory f;
  initial begin
    f  = new();
    p1 = f.create_product("smartphone");
    p2 = f.create_product("computer");
    p1.display();
    p2.display();
    $finish;
  end
endmodule
