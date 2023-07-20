// Composite pattern in systemverilog
class node;
  int id;
  string name;
  typedef node children[$];
  children childs;
  node parent = null;
  function new(int id, string name, node parent);
    this.id = id;
    this.name = name;
    this.parent = parent;
  endfunction
  function get_id();
    return this.id;
  endfunction
  function get_name();
    return this.name;
  endfunction
  function node get_parent();
    return this.parent;
  endfunction
  function void add_child(node child);
    this.childs.push_front(child);
  endfunction
  function children get_child();
    $display("child: %d", this.childs.size());
    return this.childs;
  endfunction
endclass

module Composite;
  node root;
  int  i;
  initial begin
    root = new(0, "root", null);
    for (i = 1; i <= 10; i++) begin
      node child = new(i, "child" + i, root);
      root.add_child(child);
      root.get_child();
    end
  end
endmodule
