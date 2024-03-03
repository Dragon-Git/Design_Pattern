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
  plant_cells cp[5];
  animal_cells ca[5];
  initial begin
    cp[0] = new();
    ca[0] = new();
    cp[0].display();
    ca[0].display();
    for(int i=1;i<5;i++) begin
      cp[i-1].size = cp[i-1].size + 100;
      cp[i] = cp[i-1].clone();
      ca[i] = ca[i-1].clone();
      cp[i].display();
      ca[i].display();
    end
    $finish;
  end
endmodule
