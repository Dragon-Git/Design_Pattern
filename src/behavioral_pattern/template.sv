// Template method pattern in systemverilog
virtual class game;
  pure virtual function void start();
  pure virtual function void close();
  virtual function void play();
    start();
    $display("Playing game");
    close();
  endfunction
endclass

class skyrim extends game;
  function void start();
    $display("Starting skyrim");
  endfunction
  function void close();
    $display("closing skyrim");
  endfunction
endclass

module template;
  skyrim g;
  initial begin
    g = new;
    g.play();
  end
endmodule
