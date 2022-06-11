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

virtual class abstractfactory;
    virtual function product create_product();
    endfunction
endclass

class phonefactory extends abstractfactory;
    function product create_product();
        smartphone phone;
        phone = new();
        return phone;
    endfunction
endclass

class computerfactory extends abstractfactory;
    function product create_product();
        computer computer;
        computer = new();
        return computer;
    endfunction
endclass

module test_simple_factory;
    product p1,p2;
    phonefactory fp;
    computerfactory fc;
    initial begin
        fp = new();
        fc = new();
        p1 = fp.create_product();
        p2 = fc.create_product();
        p1.display();
        p2.display();
    end
endmodule

