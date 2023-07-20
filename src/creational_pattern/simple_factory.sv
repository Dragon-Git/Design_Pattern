// simple factory in systemverilog
virtual class product;
  virtual function display();
  endfunction
endclass

class smartphone extends product;
  function new();
  endfunction
  function display();
    $display("display smartphone");
  endfunction
endclass

class computer extends product;
  function display();
    $display("display computer");
  endfunction
endclass

class factory;
  smartphone phone;
  smartphone phone;
  function product create_product(string typename);
    smartphone phone;
    computer   computer;
    if (typename == "smartphone") begin
      phone = new();
      return phone;
    end else if (typename == "computer") begin
      computer = new();
      return computer;
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
  end
endmodule
