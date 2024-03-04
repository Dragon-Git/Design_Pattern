virtual class cells;
// abstract class, define a interface
  pure virtual function cells clone();
  pure virtual function void display();
endclass

class plant_cells extends cells;
// concrete class ,Implement interface
  int size = 500;
  virtual function plant_cells clone();
    plant_cells pc;
    pc = new();
    pc.size = this.size;
    return pc;
  endfunction
  virtual function void display();
    $display("plant_cells, size = %d",size);
  endfunction
endclass

class animal_cells extends cells;
// concrete class ,Implement interface
  int size = 1000;
  virtual function animal_cells clone();
    animal_cells ac;
    ac = new();
    ac.size = this.size;
    return ac;
  endfunction
  virtual function void display();
    $display("animal_cells, size = %d",size);
  endfunction
endclass

module prototype();
  plant_cells cp[2];
  animal_cells ca[2];
  initial begin
    cp[0] = new();
    ca[0] = new();
    cp[0].display();
    ca[0].display();
    cp[0].size += 100;
    ca[0].size += 200;
    cp[1] = cp[0].clone();
    ca[1] = ca[0].clone();
    if(cp[1].size == 600) $display("cp clone successful!");
    else $error("cp clone failed!");
    if(ca[1].size == 1200) $display("ca clone successful!");
    else $error("ca clone failed!");
    $finish;
  end
endmodule
