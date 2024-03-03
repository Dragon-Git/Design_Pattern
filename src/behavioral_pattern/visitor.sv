// Visitor pattern in systemverilog
typedef class Visitor;
typedef class Element;
virtual class Element;
  pure virtual function void accept(Visitor v);
  pure virtual function string get_name();
  pure virtual function int get_age();
endclass

virtual class Visitor;
  pure virtual function void visit(Element e);
endclass

class Element_A extends Element;
  string name = "a";
  int age = 10;
  function void accept(Visitor v);
    v.visit(this);
  endfunction

  function string get_name();
    return this.name;
  endfunction

  function int get_age();
    return this.age;
  endfunction
endclass

class Element_B extends Element;
  string name = "b";
  int age = 20;
  function void accept(Visitor v);
    v.visit(this);
  endfunction

  function string get_name();
    return this.name;
  endfunction

  function int get_age();
    return this.age;
  endfunction
endclass

class visitor_S extends Visitor;
  function void visit(Element e);
    $display($sformatf("I am %s,my age is %d", e.get_name(), e.get_age()));
  endfunction
endclass

class visitor_L extends Visitor;
  function void visit(Element e);
    $display($sformatf("I am %s,my age is %d", e.get_name(), e.get_age() * 10));
  endfunction
endclass

class obj_struct;
  Element e[$];  // Object structure
  function void visit(Visitor v);
    foreach (e[i]) begin
      e[i].accept(v);
    end
  endfunction
endclass

module visitor;
  Element_A  ea;
  Element_B  eb;
  visitor_S  vs;
  visitor_L  vl;
  obj_struct obj;
  initial begin
    ea  = new;
    eb  = new;
    vs  = new;
    vl  = new;
    obj = new;
    obj.e.push_back(ea);
    obj.e.push_back(eb);
    obj.visit(vs);
    obj.visit(vl);
    $finish;
  end
endmodule
