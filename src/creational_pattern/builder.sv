// Builder pattern in systemverilog
class smartphone;
  string screen;
  string camera;
  string battery;
  function void set_screen(string s);
    this.screen = s;
  endfunction
  function void set_camera(string c);
    this.camera = c;
  endfunction
  function void set_battery(string b);
    this.battery = b;
  endfunction
  function void display();
    $display("Screen: %s\n", this.screen);
    $display("Camera: %s\n", this.camera);
    $display("Battery: %s\n", this.battery);
  endfunction
endclass

virtual class builder;
  smartphone phone = new();
  pure virtual function void build_screen();
  pure virtual function void build_camera();
  pure virtual function void build_battery();
  virtual function void display();
    phone.display();
  endfunction
  virtual function smartphone create_phone();
    return this.phone;
  endfunction
endclass

class lowend_builder extends builder;
  function void build_screen();
    phone.set_screen("5.5 inch");
  endfunction
  function void build_camera();
    phone.set_camera("8MP");
  endfunction
  function void build_battery();
    phone.set_battery("3000mAh");
  endfunction
endclass

class highend_builder extends builder;
  function void build_screen();
    phone.set_screen("6 inch");
  endfunction
  function void build_camera();
    phone.set_camera("12MP");
  endfunction
  function void build_battery();
    phone.set_battery("4000mAh");
  endfunction
endclass

class director;
  builder b;
  function void set_builder(builder b);
    this.b = b;
  endfunction
  function smartphone build_phone();
    b.build_screen();
    b.build_camera();
    b.build_battery();
    b.display();
    return b.create_phone();
  endfunction
endclass

module builder;
  director d;
  lowend_builder lb;
  highend_builder hb;
  smartphone s;

  initial begin
    d  = new();
    lb = new();
    hb = new();
    d.set_builder(lb);
    s = d.build_phone();
    d.set_builder(hb);
    s = d.build_phone();
    $finish;
  end
endmodule

