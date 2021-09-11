virtual class component;
// abstract class, define a interface
  pure virtual task display();
endclass

class concrete_component extends component;
// concrete class ,Implement interface
  virtual task display();
    $display("hello,world");
  endtask
endclass

class decorator extends component;
// abstract decrator
  component p;
  function new(component t);
    this.p = t;
  endfunction
  virtual task display();
    p.display();
  endtask
endclass

class red_decorator extends decorator;
  function new(component t);
    super.new(t);
  endfunction
  virtual task display();
    $display("red");
    super.display();
  endtask
endclass

class blue_decorator extends decorator;
  function new(component t);
    super.new(t);
  endfunction
  virtual task display();
    $display("blue");
    super.display();
  endtask
endclass

module decorator();
initial begin
  concrete_component c;
  red_decorator r;
  blue_decorator b;
  c = new();
  r = new(c);
  r.display();
  b = new(c);
  b.display();
end
endmodule

