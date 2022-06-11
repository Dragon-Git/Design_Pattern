virtual class cell;
// abstract class, define a interface
  pure virtual function cell clone();
  pure virtual function void display();
endclass

class plant_cell extends cell;
// concrete class ,Implement interface
  int size = 500;
  virtual function plant_cell clone();
    plant_cell pc;
    pc = new();
    pc.size = this.size;
    return pc;
  endfunction
  virtual function void display();
    $display("plant_cell, size = %d",size);
  endfunction
endclass

class animal_cell extends cell;
// concrete class ,Implement interface
  int size = 1000;
  virtual function animal_cell clone();
    animal_cell ac;
    ac = new();
    ac.size = this.size;
    return ac;
  endfunction
  virtual function void display();
    $display("animal_cell, size = %d",size);
  endfunction
endclass

module prototype();
  plant_cell cp[5];
  animal_cell ca[5];
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
  end
endmodule
