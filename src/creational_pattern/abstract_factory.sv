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

virtual class os;
    virtual function void display();
    endfunction
endclass

class android extends os;
  function new();
  endfunction
    function void display();
        $display("display android");
    endfunction
endclass

class linux extends os;
    function void display();
        $display("display linux");
    endfunction
endclass


virtual class abstractfactory;
    virtual function os create_sw();
    endfunction
    virtual function product create_hw();
    endfunction
endclass

class phonefactory extends abstractfactory;
    function os create_sw();
        android obj;
        obj = new();
        return obj;
    endfunction
    function product create_hw();
        smartphone phone;
        phone = new();
        return phone;
    endfunction
endclass

class computerfactory extends abstractfactory;
    function os create_sw();
        linux obj;
        obj = new();
        return obj;
    endfunction
    function product create_hw();
        computer comp;
        comp = new();
        return comp;
    endfunction
endclass

module test_simple_factory;
    product hwp1,hwp2;
    os swp1,swp2;
    phonefactory fp;
    computerfactory fc;
    initial begin
        fp = new();
        fc = new();
        hwp1 = fp.create_hw();
        swp1 = fp.create_sw();
        hwp1.display();
        swp1.display();
        hwp2 = fc.create_hw();
        swp2 = fc.create_sw();
        hwp2.display();
        swp2.display();
        $finish;
    end
endmodule

